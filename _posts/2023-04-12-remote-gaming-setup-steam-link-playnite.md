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

> This guide can also be applied to an Android / Apple TV. Install the Steam Link app from the [Play Store](https://play.google.com/store/apps/details?id=com.valvesoftware.steamlink) or [App Store](https://apps.apple.com/us/app/steam-link/id1246969117). When installed, continue the guide from the [Setting up Playnite section](https://google.com)
{: .prompt-tip }

## Introduction

In the last couple of weeks, I had the sudden urge of wanting to be able to play games from the couch again. Having owned both the Playstation 2 and 3 throughout my childhood, introduced me to the simplicity of console gaming. The pick up and play experience is something priceless that I would like to replicate. To be able to do this with a desktop, requires some setting up however. This guide will you show you how to set this up and more.

### Steam Link

Steam already provides a really good solution to this problem, and it is called [Steam Link](https://en.wikipedia.org/wiki/Steam_Link). This used to be a piece of hardware that would allow you to stream your desktop games to a little box through either a cabled or wireless internet connection. The Steam Link hardware sadly got discontinued in 2018. Valve did actively continue the development of the software though and it suppports all major platforms. It is available for Windows, macOS, Linux, Android and iOS. We are going to focus on the Linux version because it's compatible with the Raspberry Pi.

### Playnite

Downloading the Steam Link app, connecting it your PC, and play remotely would satisfy your needs if all your games were purchased on Steam. For me, this is not the case since every major game publisher has their own launcher nowadays (which is quite annoying). Adding non-steam games to your Steam Library can work, but this does not work when the game goes through another launcher before executing. This is where Playnite comes in, it is an open source video game library manager with one simple goal: To provide a unified interface for all of your games. Custom Themes are also supported which we are going to use to create the console-like experience.

### Raspberry Pi

The Raspberry Pi is a debit card-sized low-cost computer that you can use for all sorts of stuff. It mainly runs Linux and is perfect for projects like this, because it only draws 5 watts of power. A regular smartphone charging cable should be enough to power it and at the same time makes it portable friendly. I had an unused Raspberry Pi 3B+ laying around that was only used for collecting dust. When I started this project, I was able to breath back some life into it!

## Getting Started
### Prerequisites
- [x] Desktop Computer
  + [x] Powerful enough for games
  + [x] Powerful enough for streaming
  + [x] Wired connection for stability

- [x] Raspberry Pi 3 or better
  + [x] Display or TV with HDMI support
  + [x] [Supported Input/Controller](https://help.steampowered.com/en/faqs/view/6424-467A-31D9-C6CB#:~:text=Supported%20Input/Controllers)
  + [x] Wired connection for stability

### Setting up the Raspberry Pi

**1** - Setup the Raspberry Pi according to the video below

> Make sure to select [Raspberry Pi OS (Legacy)](https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-legacy) in the Imager, Steam Link is not compatible with bullseye builds
{: .prompt-warning }

{% include embed/youtube.html id='CQtliTJ41ZE' %}

Once you are done with the basic Raspberry Pi OS setup wizard, continue with step 2.

**2** - Install Steam Link by running the following commands in your terminal

```bash
sudo apt update
sudo apt install steamlink
```

**3** - Make Steam Link start automatically at boot 

```bash
sudo nano /etc/xdg/lxsession/LXDE-pi/autostart
```
Add the following line to the bottom of this file:
```bash
@steamlink
```
Press **CTRL + O** to save, **CTRL + X** to exit Nano

**4** - Additional things to setup for improved stability, performance and easier troubleshooting

Go to Menu > Preferences > Raspberry Pi Configuration

![1](/assets/public-1/8.png){: width="972" height="589" }

- Enable Network at Boot ~ this pauses the boot process until there is an active internet connection, which is needed for Steam Link at startup or else it crashes
- Disable Splash Screen ~ this is **optional**, but can come in handy when recognizing errors if they occure during boot time

![1](/assets/public-1/9.png){: width="972" height="589" }

- Enable SSH ~ also **optional**, but makes your life alot easier when things need to be setup later and you don't have a keyboard or mouse connected to the Pi

![1](/assets/public-1/10.png){: width="972" height="589" }

- Video memory 128 MB ~ this is the recommended amount of allocated video memory needed for Steam Link to run smoothly during a streaming session

![1](/assets/public-1/11.png){: width="972" height="589" }

