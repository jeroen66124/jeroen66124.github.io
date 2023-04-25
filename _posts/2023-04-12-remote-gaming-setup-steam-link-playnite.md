---
title: Creating a remote gaming console-like setup through Steam Link and Playnite with a Raspberry Pi
date: 2023-04-12 12:04:00 +0200
categories: [Gaming]
tags: [remote, gaming, Steam, Playnite, console, controller, do-it-yourself, DIY, project, Raspberry Pi, IoT, Internet of Things, ARM, Android, Apple, TV, PlayStation, Xbox]
math: false
mermaid: false
image:
  path: /assets/public-1/5.jpg
  alt: Steam Link on Raspberry Pi used for Remote Gaming
---

## Showcase

![1](/assets/public-1/6.png)
_Full Screen Mode on Playnite with PS5ish Theme_

![1](/assets/public-1/7.png)
_Browsing Game Library on Playnite with PS5ish Theme_

> This guide can also be applied to an Android / Apple TV. Install the Steam Link app from the [Play Store](https://play.google.com/store/apps/details?id=com.valvesoftware.steamlink) or [App Store](https://apps.apple.com/us/app/steam-link/id1246969117). When installed, continue the guide from the [Set up Playnite](https://vskills.nl/posts/remote-gaming-setup-steam-link-playnite/#step-3-set-up-playnite) section
{: .prompt-tip }

## Introduction
In the last couple of weeks, I had the sudden urge of wanting to be able to play games from the couch again. Having owned both the Playstation 2 and 3 throughout my childhood, introduced me to the simplicity of console gaming. The pick up and play experience is something priceless that I would like to replicate. To be able to do this with a desktop, requires some setting up however. This guide will you show you how to set this up and more.

Steam Link is a technology that allows you to stream games from your PC or console to another device. This means you can play games on a TV or monitor that's located in another room or even in a different part of the world. Playnite is a free, open-source gaming platform that can be used to manage and launch your games from one central location. A Raspberry Pi is a small, affordable computer that can be used for a variety of projects.

## Prerequisites
Here's what you'll need to get started:

- [x] Raspberry Pi (preferably model 3B+ or 4)
- [x] MicroSD card (at least 16GB)
- [x] Power supply for Raspberry Pi
- [x] Display or TV with HDMI support
- [x] [Supported Input/Controller](https://help.steampowered.com/en/faqs/view/6424-467A-31D9-C6CB#:~:text=Supported%20Input/Controllers) (optional)
- [x] Ethernet cable (optional, but recommended for faster and more stable streaming)

## Step 1: Set up Raspberry Pi

First, you'll need to set up your Raspberry Pi. If you don't already have one, you can purchase one online from a variety of retailers. It's recommended to get a model with built-in Wi-Fi, such as the Raspberry Pi 3 B+ or Raspberry Pi 4. Minimum 1GB of RAM is required on both models for it to work smoothly.

Once you have your Raspberry Pi, you'll need to install an operating system on it. Raspberry Pi OS (formerly known as Raspbian) is the most popular operating system for Raspberry Pi, and it's what we'll be using for this guide.

> Make sure to select [Raspberry Pi OS (Legacy)](https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-legacy) in the Imager, Steam Link is not compatible with current bullseye builds
{: .prompt-warning }

To install Raspberry Pi OS, follow these steps:

1.  Download the **[Raspberry Pi Imager](https://www.raspberrypi.com/software/)** from the Raspberry Pi website
2.  Insert your microSD card into your computer and open the Raspberry Pi Imager
3.  Select the **[Raspberry Pi OS (Legacy)](https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-legacy)**  option and follow the on-screen instructions to install it onto your microSD card
4.  Once the installation is complete, insert the microSD card into your Raspberry Pi and turn it on
5.  Follow the instructions on the Raspbian Installation wizard and continue with the guide afterwards

Here is a quick 30 second video with visual instructions:
{% include embed/youtube.html id='CQtliTJ41ZE' %}

## Step 2: Set up Steam Link

Now that your Raspberry Pi is set up, you'll need to install Steam Link on it. Steam Link is a free app that allows you to stream games from your PC or console to another device.

To install Steam Link on your Raspberry Pi, follow these steps:

1.  Open the terminal on your Raspberry Pi by clicking on the terminal icon in the top left corner of the screen
2.  Type the following command to update your system:
```bash
sudo apt update && sudo apt upgrade -y
```
3.  Once the update is complete, type the following command to install Steam Link:
```bash
sudo apt install steamlink
```
4.  After the installation is complete, you can launch Steam Link by clicking on the Steam Link icon on the desktop or by typing the following command in the terminal:
```bash
steamlink
```
5. For ease of use, make Steam Link start automatically at boot:
```bash
sudo nano /etc/xdg/lxsession/LXDE-pi/autostart 
```
Add the following line to the bottom of this file:
```bash
@steamlink
```
Press **CTRL + O** to save, **CTRL + X** to exit Nano

## Step 3: Set up Playnite

While you can launch games directly from Steam Link, it's helpful to have a central location to manage your games. Playnite is a free, open-source gaming platform that can be used to manage and launch your games from one central location.

To install Playnite on your PC, follow these steps:

1.  Go to the Playnite website and download the latest version of Playnite
2.  Once the download is complete, run the Playnite installer and follow the on-screen instructions to install it on your PC
3.  After installation is complete, launch Playnite and add your games library to the app. You can do this by opening the menu on the top left and clicking on "Add Game" and selecting the folders where your games are stored. 

Old and new games can both be added, and it supports any modern launcher as well, it even supports pirated copies (although unsupported for obvious reasons).

## Step 4: Set up PS5ish theme

If you're a fan of the PlayStation 5's sleek, modern UI, you can install a PS5-inspired theme for Playnite to give it a similar look and feel.

To install the Playnite PS5ish theme, follow these steps:

1.  Go to the Playnite menu by clicking on the icon in the top left
2.  Go to Add-ons > Browse > Themes Fullscreen
3.  Type PS5ish in the search bar and press Enter
4.  Click on the PS5ish Theme and click on "Install"
5.  Click on "Save" in the bottom right
6.  Click on "Yes" when asked if you want to restart Playnite
7.  After Playnite has restarted, switch to Fullscreen Mode by pressing F11
8.  Go to the Playnite menu > Settings > General > Enable "Launch in Fullscreen Mode"
9.  Also change both the "When game starts:" & "After game closes:" option to "Do Nothing"

If you want to further utitlize and or tweak the Playnite PS5ish Fullscreen Mode experience, I suggest you watch the following video and check out the [official thread on the Playnite forum](https://playnite.link/forum/thread-492.html).
{% include embed/youtube.html id='Xurs63Ccnlo' %}

The Playnite PS5ish theme should now be applied to your Playnite library, giving it a sleek, modern look that's similar to the PlayStation 5's UI.
Make sure to add Playnite as a non-Steam game to your library, so you can launch it easily from within the remote play session.

## Step 5: Set up connection

Now that Steam Link and Playnite are installed, you'll need to connect your Raspberry Pi to your PC. Follow these steps:

1.  Make sure your Raspberry Pi is connected to your network (either via Ethernet or Wi-Fi)
2.  Launch Steam on your PC
3.  In the top left corner of the Steam window, click on "Steam" and select "Settings"
4.  Click on the "Remote Play" tab and make sure the "Enable Remote Play" checkbox is checked
5.  Click on "Advanced Host Options" and make sure the "Use Nvidia NVFBC capture on supported games" checkbox is checked
6.  Also make sure to tweak your maximum bitrate and FPS. I own a model 3B+ and have set the bitrate to max 10mbps with FPS-cap on 60. This looks okay visually and also reduces stutters because the Model 3 Pi cannot handle higher bitrates smoothly.
7.  Click on "OK" to save your settings
8.  Launch Steam Link on your Raspberry Pi
9.  Follow the on-screen instructions to connect to your network and select your gaming device. If your PC is running Steam, it should automatically appear on the list. If it doesn't, you can connect through a one-time PIN code.

## Step 6: Set up USB Game Controller
You can add a USB game controller If you prefer to use a game controller instead of a keyboard and mouse. Plug in a USB game controller to your Raspberry Pi, and it should work automatically. Once it's connected, you can use it to play games just as you would on a console.

If a game does not support controller input or the keymapping is throwing you off, check out the [Steamworks Browsing Configurations](https://partner.steamgames.com/doc/features/steam_controller/browse_configs) documentation.

## Step 7: Set up additional things
These are for improved stability, performance and easier troubleshooting.

Go to Menu > Preferences > Raspberry Pi Configuration

![1](/assets/public-1/8.png)

- Enable Network at Boot ~ this pauses the boot process until there is an active internet connection, which is needed for Steam Link at startup or else it crashes
- Disable Splash Screen ~ this is **optional**, but can come in handy when recognizing errors if they occure during boot time

![1](/assets/public-1/9.png)

- Enable SSH ~ also **optional**, but makes your life alot easier when things need to be setup later and you don't have a keyboard or mouse connected to the Pi

![1](/assets/public-1/10.png)

- Video memory 128 MB ~ this is the recommended amount of allocated video memory needed for Steam Link to run smoothly during a streaming session

![1](/assets/public-1/11.png)

## Closing

And that's it! With these steps, you can set up your own remote gaming setup using Steam Link, Playnite, and a Raspberry Pi. Enjoy your gaming sessions from the comfort of your couch or bed, without having to be right in front of your PC. Whether you want to play your favorite games on a larger screen, or just want the flexibility to game from anywhere in your home, this project is a great way to achieve both. So, grab your Raspberry Pi, install Steam Link and Playnite, and start gaming!

