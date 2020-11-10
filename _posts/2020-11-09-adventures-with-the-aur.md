---
author: Karmanyaah
category: Linux
tags: arch
date: 2020-11-09 02:00 -0500
---

My first time contributing to the AUR ...

The story starts when I found an amazing script by [Zeitpunk](https://github.com/ztpnk/) on GitHub called [gotify-dunst](https://github.com/ztpnk/) that can show desktop notifications for Gotify. I set it up and submitted a patch with a few changes along the way. I wanted desktop notifications without being tied up to my phone through KDE Connect, while I got notifications from anyway most of the time. Anyway, I set this up and realized there should be a way to automate the build process. I had a general sense of what GNU Make was but had never used it. I had also wanted to maintain an AUR package for a while at this point but I never found the right opportunity. This was it!

I started learning about PKGBUILDs (scripts to *build packages* for Arch) and reading the Arch Wiki on developing/packaging etc. I threw together a very simple PKGBUILD using other '-git' AUR packages, the default template, and the wiki. The process ended up basically being about understanding what each field does and either filling it out or removing it. Since this was relatively simple to set up where I just had to install a few files into `/usr/lib/gotify-dunst` and a Systemd service into `/usr/lib/systemd/user`, I put those `install` commands into the package section of the PKGBUILD and it worked. I had previously seen some Makefiles be used to show compiling binaries during CTFs, so the concept of a Makefile wasn't new to me. I read through the specifics and some examples from other repos to figure out what I needed to do to make a Makefile. I [submitted](https://github.com/ztpnk/gotify-dunst/pull/3) the Systemd and Makefile patches upstream, to which @ztpnk made me a collaborator (thanks!). This made me feel like I really am a valuable FOSS contributor, lol.

Finally, I submitted the repository to the AUR over ssh git. The package showing up on the AUR page was a great moment, and was surprisingly soon after I first pushed it. I would've imagined there are some wait times to reindexing all those packages.

All of that was yesterday as of writing this, and more recently, I took on another AUR package. [Hyperspace](https://github.com/hyperspacedev/hyperspace) the Mastodon client I use on my computer. I saw earlier today, as I set up [AppImageLauncher](https://github.com/TheAssassin/AppImageLauncher), that I was using the AppImage of Hyperspace and realized that was because the 'main' AUR package `hyperspace-bin` was orphaned and hadn't been updated. I then looked at its PKGBUILD and tried to understand the Debian package to Arch package conversion and it seemed relatively simple given that I didn't have to write it from scratch. Then, I tested and updated the PKGBUILD and am now officially maintaining `hyperspace-bin`!

In conclusion, the communtiy support really encourages me to give back to the community whether it be through the AUR or other open-source contributions. I've also been looking at the Arch Wiki's [Getting Involved](https://wiki.archlinux.org/index.php/getting_involved) page and will hopefully increase my involvement in Arch and other FOSS projects soon. This presents amazing learning opportunities in things ranging from coding or devops to the parts of an operating system.

Update: I also wrote this script to keep track of my packages <https://gist.github.com/karmanyaahm/02bfb452b8e78a373b53bb78df5334a3>. I'll run it on my Raspberry Pi.
