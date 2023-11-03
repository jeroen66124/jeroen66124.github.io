---
title: How to automate and customize your own clean Windows setup with PowerShell 
date: 2023-11-03 19:00:00 +0200
categories: [Automation]
tags: [Automation, scripting, Windows, setup, winget, activation, bloatware, debloat, Microsoft, GitHub, open-source]
math: false
mermaid: false
image:
  path: /assets/public-5/1.jpg
  alt: Preview of my PowerShell script on GitHub
---

## Showcase
![1](/assets/public-4/2.png)
_RPCS3 emulating the Playstation 3 XrossMediaBar Graphical User Interface_

> This guide will be written with Windows 10, but can be applied to all Operating Systems compatible with RPCS3 if the steps are reproduced for that specific platform accordingly. Be aware that the steps in this guide can change later down the line, feel free to use the [Quickstart guide](https://rpcs3.net/quickstart) as a reference instead
{: .prompt-tip }

## Introduction
I find myself often nostalgic for older console titles that may no longer be available on the market, or not owning the console that is compatible with a certain game. Thanks to emulation software like RPCS3, players can relive the glory days of PlayStation 3 games on their modern hardware. In this guide, you will go through the step-by-step process of setting up the RPCS3 emulator to enjoy your favorite PS3 games on your PC.

## Prerequisites
Here's what you'll need to get started:
- [x] Operating System: Windows, macOS, Linux or BSD (Windows recommended)
- [x] Processor: A modern multi-core processor (quad-core or higher) is recommended for optimal performance
- [x] Graphics Card: A dedicated GPU supporting OpenGL 4.3 or Vulkan 1.1 is required
- [x] RAM: At least 4GB of RAM, but 8GB or more is recommended
- [x] Storage: You'll need storage space for both the emulator and the games

## Step 1: Set up RPCS3 Emulator

1.  Start by visiting the official RPCS3 download page at [rpcs3.net](https://rpcs3.net/download) to download the latest version of the emulator suitable for your operating system
![1](/assets/public-4/3.png)
2.  Decompress the .7z file and place it in a convenient location, also make sure to install all the required dependencies which are also available on the website
![1](/assets/public-4/4.png)
3.  After decompressing and installing the dependencies, your folder should look like this
![1](/assets/public-4/5.png)
4.  Before you start RPCS3 for the first time, [download](https://www.playstation.com/en-us/support/hardware/ps3/system-software/) the latest PS3 firmware from the official Playstation website
![1](/assets/public-4/6.png)
5.  Start rpcs3.exe from your installation folder and check the "I have read the Quickstart guide" mark and also preferrably the Desktop / Start Menu shortcut options to Continue afterwards
![1](/assets/public-4/7.png)
6.  Once on the main screen, go to File > Install Firmware > Browse and Select PS3UPDAT.PUP file > Open
![1](/assets/public-4/8.png)
![1](/assets/public-4/9.png)
7.  After succesfully installing the firmware, the Emulator will compile the base PPU modules
![1](/assets/public-4/10.png)
![1](/assets/public-4/11.png)

## Step 2: Set up NoPayStation

To acquire PS3 games, you can either dump them from your digital and or physical copies with this [RPCS3 wiki Dumping guide](https://wiki.rpcs3.net/index.php?title=Help:Dumping_PlayStation_3_games). The other option is to download digital PS3 games from the Playstation servers directly with NoPayStation.

1.  Create a NoPayStation folder in a convenient location and download the latest version of the NPS client on the [NoPayStation website](https://nopaystation.com/)
![1](/assets/public-4/12.png)
2.  Open NPS_Browser.exe and Continue until you are at the Options screen
![1](/assets/public-4/13.png)
3.  Copy and Insert all the TSV Files links from [NoPayStation](https://nopaystation.com/faq)
![1](/assets/public-4/14.png)
![1](/assets/public-4/15.png)
4.  Download [pkg2zip](https://github.com/lusid1/pkg2zip/releases) from GitHub and extract the .zip in the NoPayStation folder for convience
![1](/assets/public-4/16.png)
5.  Once done, select your preferred folder for the "Download and unpack dir" and also select pkg2zip for the "Any pkg dec tool" tables
![1](/assets/public-4/17.png)
6.  When everything has been filled in, close the Options screen and let the NPS Browser synchronise
![1](/assets/public-4/18.png)
6.  On this screen you can browse any Games and or DLCs you want to download, I will be downloading [SSX](https://en.wikipedia.org/wiki/SSX_(2012_video_game)) for demonstration purposes
![1](/assets/public-4/19.png)
7.  When the Download and Unpack is finished, your folder should look like this
![1](/assets/public-4/20.png)

## Step 3: Set up first game

1.  Open RPCS3 and go to File > Install Package/Raps/Edats > Browse to NoPayStation Packages > Select and Open
![1](/assets/public-4/21.png)
![1](/assets/public-4/22.png)
2.  Wait for the Installation of the package file to Finish
![1](/assets/public-4/23.png)
![1](/assets/public-4/24.png)
3.  Go to File > Install Package/Raps/Edats > Browse to NoPayStation Exdata > Select corresponding RAP File > Open
![1](/assets/public-4/31.png)  
5.  You are now technically ready to launch your game, but you want to apply recommended Emulation settings first for improved performance
6.  Right-click on your game > Check Game Compatibility > Click on Game Title
![1](/assets/public-4/25.png)
![1](/assets/public-4/26.png)
7.  Read and enable all the recommended Configuration and Patch settings if they are available on the [RPCS3 Wiki](https://wiki.rpcs3.net) for that specific game
![1](/assets/public-4/27.png)
8.  Copy all these settings by going to both "Create Custom Configuration" and "Manage Game Patches" accordingly
![1](/assets/public-4/28.png)

## Step 4: Set up controller

1.  Connect your controller either wired or wirelessly, this can be DualShock 3, DualShock 4, DualSense and or any Xbox or XInput-compatible controllers and also make sure to check the [Controller Configuration](https://wiki.rpcs3.net/index.php?title=Help:Controller_Configuration) guide
2.  Go to RPCS3 > Pads (Configure Controls) > Select corresponding Handler > Test if controller input is registered 
![1](/assets/public-4/29.png)
3.  When ready, start your first game and wait for it compile (the first boot can take a while!) 
![1](/assets/public-4/30.png)
![1](/assets/public-4/32.png)
4. Have fun!
![1](/assets/public-4/33.png)

## Closing

Cool, you're set up! The RPCS3 emulator opens up a world of possibilities for playing PlayStation 3 games on your PC. By following this guide, you can set up the emulator, configure it, and relive classic gaming moments from the comfort of your computer. 
