# Tinycore Scripted Remaster 2.0
============================================
This project was originally created to develop a small distro, it was then abandoned when I got swamped with work and moved onto other things. Now i have moved back to this project to develop another distro sort of thing. Seeing as tinycore has changed a bit since i last used this project, i've re-written/removed nearly all of the scripts to take advantage of the new features.

## What is it?

The entire purpose of this project is to develop some basic scripts to make remastering and modifying and testing tinycore linux distros a whole lot easier. this task is accomplished mostly with a Makefile and some shell scripts, there will eventually be a script for downloading tinycore packages and dependencies from the tinycore mirror, but i haven't added that yet

## Whats Tinycore linux?

Tinycore linux is an awesome minimalistic distro, it is so far the smallest distro that i have seen so far, and definetly one of the easier ones to remaster. You can get more info on the distro itself here:
http://distro.ibiblio.org/tinycorelinux/welcome.html

## Requirements
To build your distro you must have these applications in your path:
* gzip
* mkisofs
* kvm (thats qemu, if you prefer another vm, just modify the run command in the Makefile)
* cpio

as long as you have these, you should be good, getting these in ubuntu are as simple as:
```sudo apt-get install gzip mkisofs kvm cpio```

## How to use

First thing I should point out before you go any farther, this project was developed in Ubuntu linux and tested on no other distro's, so let me know how it runs on other distros if your using another system.

the basics of the project are pretty simple, there is a single Makefile that is capable of unpacking, modifying, and repacking a tinycore linux distro all in one action
so here's how to make a custom iso image with the Makefile

1. place anything you want to be included in the iso image into src/include
2. place packages you want loaded into src/include/cde/optional and add the name to onboot.lst in a new line (this will be automated eventually)
3. cd to the root directory where this readme is and run "make"
4. if mkisofs succeeded then go ahead and run "make run" to test your system!

