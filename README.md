# LVGL & Micropython Made Easy

**Goal of this Project is to compile your own Version of lv_micropython with ease.**

## What is LVGL?

### LVGL stands for Light and Versatile Graphics Library

Let me quote from [lvgl.io](https://lvgl.io):

> LVGL is an open-source graphics library providing everything you need to create embedded GUI with easy-to-use graphical elements, beautiful visual effects and low memory footprint.

Therefore it designed to run on [specific certificated boards](https://lvgl.io/boards), but also intended to run on any Microcontroller that hits the desired requirements. See [lvgl.io/features](https://lvgl.io/features) for further Details. \
In short:

-   16,32 or 64 bit microcontroller or processor
-   16 MHz speed is recommended
-   Flash/ROM: > 64 kB (180 kB is recommended)
-   RAM: 8 kB (24 kB is recommended)
-   1 Frame buffer: in MCU, external RAM, or display controller
-   Graphics buffer for LVGL: > “Horizontal resolution” pixels \
    (1/10 “Screen size” is recommended)
-   C99 or newer compiler
-   Basic C (or C++) knowledge: \
    pointers, structs, callbacks

**And last but not least, the good news:**

Thankfully, a guy named Amir Gonnen (amirgon) seems to love Micropython and Devices like the ESP32. Therefore he created a Micropython Binding.
That means the developer team, brings LVGL into Micropython! - you hear a stadium cheer -

But instead of trying to build everything from scratch they decided obviously
to create [lv_micropython](https://github.com/lvgl/lv_micropython.git).
So you can skip these Step if you dont have any clue to do that, like me.

Now you need only the knowledge to compile that version.
What is, by the time, around 408 commits behind the original [Micropython](https://micropython.org)

---

## Why is compiling lv_micropython not Newbie friendly?

### Here is what I think:

This Framework is designed for Profesional Use.
But, in my opinion it is the perfect framework for "Makers" like me
that want to fiddle around with a nice looking and performing GUI on
a "cheap" TFT like the ILI9341 one.

Since I want to learn Python ( Micropython in this special case ),
I dont want to mess around with compiling things and learn C or C++
like the well known Arduino Framework.

I wanted a terminal ( REPL ) and test things on the fly.

After a bit of research I stumpled across Micropython.

> Yes, that is what I want!

So, I thougt it couldnt be a heavy task to compile the lv_micropython,
for my ESP32 DevKitC V4.

Buuut, I was horribly wrong. The Documentation of the lvgl project is great,
really, but if you don´t have any clue about such stuff you are messed up.

Since Linux is my Daily-Driver, I thought it couldnt be hard.

After realising that the best way to do this task, is to build an Docker Container with Ubuntu Latest.

And it goes as it goes. In a "Dependency Mess".
I was'nt able to compile a single firmware.bin File.

So, I did the manual way. After looking around in the Sources of the project,
I found a bash script called ci.sh. And the pennies in my head then starts to drop....

Long Story, short:

**I dont want to stress out anybody else and automate this procedure for you.**

## Ok then, what do I need?

---

**Please be aware, this will be not an "Copy & Paste" Guide!
I will provide Links and some Commands to help out, but keep in mind
you have to learn something new, if you know nothing about [Docker](https://www.docker.com/).**

---

-   Read the docs/HOWTO.md
-   A working installation of Docker
-   This git repo
-   Some free time
-   And last but not least, some fun to fiddle around with lvgl.io and Micropython :)

# Troubleshooting

Unfortunatly,at this point you are on your own!
I tested this project, as said before, on a Linux Machine.
In my case on latest [Manjaro Linux](https://manjaro.org).

I can't provide Informations howto do this on MacOS or Windows!
The provided Informations about these OS'es are more or less googled.
Feel free to Pull Request if you're able to provide such Informations.
