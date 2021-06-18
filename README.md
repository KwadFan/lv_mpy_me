# LVGL & Micropython Made Easy

---

### Goal of this Project is to compile your own Version of lv_micropython with ease.

---

## Why is compiling lv_micropython not Newbie friendly?

#### Here is what I think:

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

### Ok then, what do I need?

-   A working installation of Docker
-   This git repo
-   Some free time
-   And last but not least, some fun to fiddle around with lvgl.io and Micropython :)
