# HOWTO

Steps to do:

1. Install Python (for deploying Firmware).
2. Install Docker.
3. Install Docker-Compose.
4. Install git.
5. git clone this Repo.
6. Configure config.bash and GNUMakefile
7. Bring up the Container.
8. Deploy Firmware.

---

## Step 1 - Install Python3 and pip.

---

## Linux

Should be preinstalled on most Distro's, if not
according to your Paketmanager install Docker. In my case:

        sudo pacman -S python python-pip

## Mac

Here are you on your own. Provided by Google:

Visit https://installpython3.com/mac/ and following the Steps might help you out :)

## Windows

Please read the official Documentation on this topic.
Visit [python.org](https://www.python.org) for reference.
Grab the [Installer](https://www.python.org/downloads/windows/) and install it.

---

## Step 2 - Install Docker.

---

## Linux

According to your Paketmanager install Docker. In my case:

        sudo pacman -S docker

## Mac

Here are you on your own. Provided by Google (homebrew):

        brew install --cask docker

> from [Homebrew Formulae](https://formulae.brew.sh/cask/docker)

or visit [Docker Docs](https://docs.docker.com/docker-for-mac/install/) for Docker Desktop

## Windows

Please read the official Documentation on this topic.
Visit [Docker Docs](https://docs.docker.com/docker-for-windows/install/)

---

## Step 3 - Install Docker-Compose.

---

## Linux

According to your Paketmanager install Docker. In my case:

        sudo pacman -S docker-compose

## Mac

Here are you on your own.
If you've choose to go the Docker Desktop Way, you should already have installed docker-compose.

If not try:

        pip3 install docker-compose

## Windows

Please read the official Documentation on this topic.
Visit [Docker Docs](https://docs.docker.com/docker-for-windows/install/)

---

## Step 4 - Install git.

---

## Linux

According to your Paketmanager install Docker. In my case:

        sudo pacman -S git

---

## Mac

On MacOS, git should come preinstalled.
Check with:

        git --version

---

## Windows

Please read the official Documentation on this topic.
Visit [git-scm.com](https://git-scm.com/download/win) for reference.

---

## Step 5 - Git clone this Repo.

---

This should be the same procedure on all mentioned OS'es.
Open up a Terminal / Shell and type:

        git clone https://github.com/KwadFan/lv_mpy_me.git

Wait for finish and you're good to go.

---

## Step 6 - Configure config.bash and GNUMakefile.

---

## All OS'es

Please bring up your favorite Texteditor and Change mentioned files to your specific needs.

For the GNUMakefile see [README from lv_micropython](https://github.com/lvgl/lv_micropython/blob/master/ports/esp32/README.md#configuring-the-micropython-build).

The config.bash is written by me an fairily self explantory. Open it up and read...

_HINT: Windows Users, please be aware to use a Texteditor that is able to set END OF LINE SEQUENCE to "LF". Example: Atom, VSCode or Notepad++._

---

## Step 7 - Bring up the Container.

---

## Linux

Simple as:

        cd </path/to/lv_mpy_me> && docker-compose up

## Mac and Windows

Here we're at the mentioned point from README.
I can't provide Informations about this topic, due my lag of Apple Hardware and Windows OS.

After the build is complete or it produces Errors the Container will be stopped.
If you change something in the previous mentioned files. Bring up the Container
with the same command/action to compile new version.

---

## Step 8 - Deploy the firmware.bin

---

As previously mentioned a few times, you are own your own to manage that properly.

As an Example for my Device ESP-WROOM-32 DevKitC V4

I used [Micropython Docs](https://docs.micropython.org/en/latest/esp32/tutorial/intro.html)
as reference.

First, you have to install the "esptool.py"

        pip install -U pip
        pip install -U esptool

then connect your Board and erase the flash.

_Attention: All previous flashed data will be lost!_

        esptool.py --port /dev/ttyUSB0 erase_flash

Now you can deploy lv_micropython firmware

        cd lv_micropython/ports/esp32/build-GENERIC
        esptool.py --chip esp32 --port /dev/ttyUSB0 write_flash -z 0x1000 firmware.bin

After a device reset you can enjoy lv_micropython on your Device!

## **Please be pationed with this part you're in risk to damage or destroy your Board, if not done properly!**
