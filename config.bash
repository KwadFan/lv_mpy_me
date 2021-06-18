#!/bin/bash

#### Configuration File

####
#
# lvgl_mpy_me may distributed under the GPLv3
#
# Copyright 2021 - Stephan Wendel (KwadFan) <me@stephanwe.de>
#
####

#### Build Dependencies

DEPENDENCIES="curl build-essential libreadline-dev libffi-dev \
            git pkg-config libsdl2-2.0-0 libsdl2-dev python3.8 \
            python2 python-is-python3 python3-venv python3-pip"

#### lv_micropython git ( If you want to use a fork )

LV_MPY_GIT="https://github.com/lvgl/lv_micropython.git"
LV_MPY_PERSISTANT=y # Keep cloned git? (y/n) (if n it will be deleted everytime, default is y)


#### esp-idf git ( If you want to use a fork )
ESP_IDF_GIT="https://github.com/espressif/esp-idf.git"
ESP_IDF_PERSISTANT=y # Keep cloned git? (y/n) (if n it will be deleted everytime, default is y)
ESP_IDF_VERSION="V4" # V3 or V4


#### python build-venv
BUILD_VENV_PERSISTANT=y # Keep (y) or Rebuild everytime (n)


#### xtensa
XTENSA_PERSISTANT=y # Keep (y) or grab everytime (n)
XTENSA_DL_URL="https://github.com/espressif/crosstool-NG/releases/download/esp-2021r1/xtensa-esp32-elf-gcc8_4_0-esp-2021r1-linux-amd64.tar.gz"

