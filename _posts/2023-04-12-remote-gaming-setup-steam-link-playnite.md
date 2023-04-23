---
title: How to create a remote gaming console-like setup through Steam Link and Playnite with a Raspberry Pi
date: 2023-04-12 12:04:00 +0200
categories: [Gaming]
tags: [remote, gaming, Steam, Playnite, console, controller, Pi, Raspberry Pi, IoT, Internet of Things, ARM, Android, Apple, TV, PlayStation]
math: false
mermaid: false
image:
  path: /assets/steam-link-pi.jpg
  alt: Steam Link on Raspberry Pi used for Remote Gaming
---

> This guide can also be applied to an Android / Apple TV. Install the Steam Link app from the [Play Store](https://play.google.com/store/apps/details?id=com.valvesoftware.steamlink) or [App Store](https://apps.apple.com/us/app/steam-link/id1246969117). When installed, continue the guide from the [Setting up Playnite section](https://vskills.nl/posts/remote-gaming-setup-steam-link-playnite/#step-2-set-up-steam-link)
{: .prompt-tip }

### Introduction
In the last couple of weeks, I had the sudden urge of wanting to be able to play games from the couch again. Having owned both the Playstation 2 and 3 throughout my childhood, introduced me to the simplicity of console gaming. The pick up and play experience is something priceless that I would like to replicate. To be able to do this with a desktop, requires some setting up however. This guide will you show you how to set this up and more.

Steam Link is a technology that allows you to stream games from your PC or console to another device. This means you can play games on a TV or monitor that's located in another room or even in a different part of the world. Playnite is a free, open-source gaming platform that can be used to manage and launch your games from one central location. And a Raspberry Pi is a small, affordable computer that can be used for a variety of projects.

### Prerequisites
Here's what you'll need to get started:

- [x] Raspberry Pi (preferably a model with built-in WiFi, such as the Raspberry Pi 3 B+ or Raspberry Pi 4)
- [x] MicroSD card (at least 16GB)
- [x] Power supply for Raspberry Pi
- [x] Display or TV with HDMI support
- [x] [Supported Input/Controller](https://help.steampowered.com/en/faqs/view/6424-467A-31D9-C6CB#:~:text=Supported%20Input/Controllers) (optional)
- [x] Ethernet cable (optional, but recommended for faster and more stable streaming)

### Step 1: Set up Raspberry Pi

First, you'll need to set up your Raspberry Pi. If you don't already have one, you can purchase one online from a variety of retailers. It's recommended to get a model with built-in Wi-Fi, such as the Raspberry Pi 3 B+ or Raspberry Pi 4. Minimum 1GB of RAM is required on both models for it to work smoothly.

Once you have your Raspberry Pi, you'll need to install an operating system on it. Raspberry Pi OS (formerly known as Raspbian) is the most popular operating system for Raspberry Pi, and it's what we'll be using for this guide.

> Make sure to select [Raspberry Pi OS (Legacy)](https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-legacy) in the Imager, Steam Link is not compatible with bullseye builds
{: .prompt-warning }

To install Raspberry Pi OS, follow these steps:

1.  Download the **[Raspberry Pi Imager](https://www.raspberrypi.com/software/)** from the Raspberry Pi website.
2.  Insert your microSD card into your computer and open the Raspberry Pi Imager.
3.  Select the **[Raspberry Pi OS (Legacy)](https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-legacy)**  option and follow the on-screen instructions to install it onto your microSD card.
4.  Once the installation is complete, insert the microSD card into your Raspberry Pi.

{% include embed/youtube.html id='CQtliTJ41ZE' %}

### Step 2: Set up Steam Link

Now that your Raspberry Pi is set up, you'll need to install Steam Link on it. Steam Link is a free app that allows you to stream games from your PC or console to another device.

To install Steam Link on your Raspberry Pi, follow these steps:

1.  Open the terminal on your Raspberry Pi by clicking on the terminal icon in the top left corner of the screen.
2.  Type the following command to update your system:
```bash
sudo apt update && sudo apt upgrade -y
```
3.  Once the update is complete, type the following command to install Steam Link:
```bash
sudo apt install steamlink
```
4.  After the installation is complete, you can launch Steam Link by clicking on the Steam Link icon in the Games menu or by typing the following command in the terminal:
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

### Step 3: Set up Playnite

While you can launch games directly from Steam Link, it's helpful to have a central location to manage your games. Playnite is a free, open-source gaming platform that can be used to manage and launch your games from one central location.

To install Playnite on your PC, follow these steps:

1.  Go to the Playnite website and download the latest version of Playnite.
2.  Once the download is complete, run the Playnite installer and follow the on-screen instructions to install it on your PC.
3.  After installation is complete, launch Playnite and add your games library to the app. You can do this by clicking on "Add Games" and selecting the folders where your games are stored.

### Step 4: Connect Raspberry Pi to your PC

Now that Steam Link and Playnite are installed, you'll need to connect your Raspberry Pi to your PC or console. Follow these steps:

1.  Make sure your Raspberry Pi is connected to your network (either via Ethernet or Wi-Fi).
2.  Launch Steam on your PC.
3.  In the top left corner of the Steam window, click on "Steam" and select "Settings."
4.  Click on the "Remote Play" tab and make sure the "Enable Remote Play" checkbox is checked.
5.  Click on "Advanced Host Options" and make sure the "Use Nvidia NVFBC capture on supported games" checkbox is checked.
6.  Click on "OK" to save your settings.
7.  Launch Steam Link on your Raspberry Pi.
8.  Follow the on-screen instructions to connect to your network and select your gaming device. If your PC is running Steam, it should automatically appear on the list

### Step 5: Install the Playnite PS5ish theme

If you're a fan of the PlayStation 5's sleek, modern UI, you can install a PS5-inspired theme for Playnite to give it a similar look and feel.

To install the Playnite PS5ish theme, follow these steps:

1.  Go to the Playnite PS5ish theme Github page and download the latest version of the theme.
2.  Extract the contents of the downloaded zip file to a new folder.
3.  Open Playnite and click on the "Settings" button in the top right corner of the window.
4.  Click on the "Themes" tab and then click on the "Install Theme" button.
5.  Navigate to the folder where you extracted the theme files and select the "PlaynitePS5ish.xaml" file.
6.  Click on the "Open" button to install the theme.
7.  After installation is complete, click on the "Activate" button to apply the theme.

The Playnite PS5ish theme should now be applied to your Playnite library, giving it a sleek, modern look that's similar to the PlayStation 5's UI.

### Step 6: USB Game Controller Setup
Add a USB game controller If you prefer to use a game controller instead of a keyboard and mouse, you can connect a USB game controller to your Raspberry Pi. Simply plug in the controller and follow the on-screen instructions to set it up. Once it's connected, you should be able to use it to play games just as you would on a console.

### Step 7: Additional things to setup 
These are for improved stability, performance and easier troubleshooting.

Go to Menu > Preferences > Raspberry Pi Configuration

![1](/assets/public-1/8.png){: width="972" height="589" }

- Enable Network at Boot ~ this pauses the boot process until there is an active internet connection, which is needed for Steam Link at startup or else it crashes
- Disable Splash Screen ~ this is **optional**, but can come in handy when recognizing errors if they occure during boot time

![1](/assets/public-1/9.png){: width="972" height="589" }

- Enable SSH ~ also **optional**, but makes your life alot easier when things need to be setup later and you don't have a keyboard or mouse connected to the Pi

![1](/assets/public-1/10.png){: width="972" height="589" }

- Video memory 128 MB ~ this is the recommended amount of allocated video memory needed for Steam Link to run smoothly during a streaming session

![1](/assets/public-1/11.png){: width="972" height="589" }

### Closing
And that's it! With these steps, you can set up your own remote gaming setup using Steam Link, Playnite, and a Raspberry Pi. Enjoy your gaming sessions from the comfort of your couch or bed, without having to be right in front of your PC. Whether you want to play your favorite games on a larger screen, or just want the flexibility to game from anywhere in your home, this project is a great way to achieve both. So, grab your Raspberry Pi, install Steam Link and Playnite, and start gaming!

