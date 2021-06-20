#!/usr/bin/env bash

####
# Building lv_micropython Made Easy!
# 
# https://github.com/lvgl/lv_micropython.git
# https://lvgl.io
#
# GUI Framework for Micropython and ILI9XXX TFT Displays.
# This Version is intented to use with a ESP32 Microcontroller
#
####
#
# lvgl_mpy_me may distributed under the GPLv3
#
# Copyright 2021 - Stephan Wendel (KwadFan) <me@stephanwe.de>
#
####

#### Shellcheck Ignores
# shellcheck disable=SC1091

#### Error Handling
set -e

#### Sources
source /buildroot/config.bash


#### Functions

function sys_update {
    apt update
    apt upgrade -y
}

function install_deps {
    #shellcheck disable=SC2086
    apt install -y ${DEPENDENCIES} 
}

function clone_lvgl {
    case ${LV_MPY_PERSISTANT} in
        "y")
            if [ -d "/buildroot/lv_micropython" ]; then
                pushd lv_micropython/ || exit
                git status
                popd || exit
            else
                git clone --recurse-submodules "${LV_MPY_GIT}"
            fi
        ;;

        "n")
            if [ -d "/buildroot/lv_micropython" ]; then
                rm -rf /buildroot/lv_micropython
                git clone --recurse-submodules "${LV_MPY_GIT}"

            else
                git clone --recurse-submodules "${LV_MPY_GIT}"
            fi
        ;;
    esac
}

function clone_esp_idf {
    if [ -d /buildroot/esp-idf/ ]; then
        rm -rf /buildroot/esp-idf
    fi
    git clone "${ESP_IDF_GIT}"
}

function get_suphash {
    # Luckily it's in the Make file
    local SUPHASH
    local MAKEFILE="../lv_micropython/ports/esp32/Makefile"

    case ${ESP_IDF_VERSION} in
        V3)
            SUPHASH="$(grep "ESPIDF_SUPHASH_V3 :=" ${MAKEFILE} | awk '{ print $3 }')"
        ;;

        V4)
            SUPHASH="$(grep "ESPIDF_SUPHASH_V4 :=" ${MAKEFILE} | awk '{ print $3 }')"
        ;;
    esac

    echo "${SUPHASH}"
}

function esp_idf_checkout {
    pushd esp-idf || exit
    git checkout "$(get_suphash)"
    git submodule update --init --recursive
    popd || exit
}

function export_esp_idf {
    declare -x ESPIDF="/buildroot/esp-idf"
    declare -x IDF_PATH="/buildroot/esp-idf"
}

function build_venv {
    python3 -m venv build-venv
    source build-venv/bin/activate
    pip3 install --upgrade pip
    pip3 install -r ./esp-idf/requirements.txt
}

function check_persistant_venv {
    case ${BUILD_VENV_PERSISTANT} in
        y)
            if [ -d ./build-venv ]; then
                echo "build-venv exists. Activate..."
                source build-venv/bin/activate
            else
                build_venv
            fi
        ;;
        n)
            if [ -d ./build-venv ]; then
                echo "build-venv exists. Remove and Rebuild..."
                rm -rf ./build-venv
            fi
            build_venv
        ;;
    esac
}

function install_xtensa {
    curl -L "${XTENSA_DL_URL}" | tar xfz -
}

function check_persistant_xtensa {
    case ${XTENSA_PERSISTANT} in
        y)
            if [ -d ./xtensa-esp32-elf ]; then
                echo "xtensa-exp32-elf already exits."
                add_xtensa_to_path
                return
            else
                install_xtensa
            fi
        ;;
        n)
            if [ -d ./build-venv ]; then
                echo "xtensa-esp32-elf exists. Remove and download new one..."
                rm -rf ./xtensa-esp32-elf
            fi
            install_xtensa
        ;;
    esac
}

function add_xtensa_to_path {
    export PATH="$PATH:/buildroot/xtensa-esp32-elf/bin"
}

function copy_gnumakefile {
    # Skip if exists
    if [ -f "lv_micropython/ports/esp32/GNUMakefile" ]; then
        echo "GNUMakefile exists. Skipping"
    else
        echo "Copying GNUmakefile to /ports/esp32"
        cp GNUmakefile lv_micropython/ports/esp32/
    fi
}

function compile_mpy_cross {
    pushd lv_micropython/ || exit
    make -C mpy-cross
    popd || exit
}

function compile_mpy_esp32 {
    pushd lv_micropython/ || exit
    if [ -n "${LV_MPY_CFLAGS}" ] && [ -n "${LV_MPY_BOARD}" ]; then
        make -C ports/esp32 LV_CFLAGS="${LV_MPY_CFLAGS}" BOARD="${LV_MPY_BOARD}"
    else
        echo "Please Setup config.bash"
    fi
    popd || exit
}

function chmod_git_folders {
    # This func makes Dirs accessible from Host after compile
    chmod 0777 lv_micropython/ esp-idf/ build-venv/
}

#### Static Exports
export DEBIAN_FRONTEND="noninteractive"


#### Main

sys_update
install_deps
clone_lvgl
clone_esp_idf
esp_idf_checkout
export_esp_idf
check_persistant_venv
check_persistant_xtensa
add_xtensa_to_path
copy_gnumakefile
compile_mpy_cross
compile_mpy_esp32
chmod_git_folders
