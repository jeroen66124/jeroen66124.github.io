---
title: Creating a Remote Gaming Console-like Setup through Steam Link and Playnite with a Raspberry Pi
date: 2023-04-12 12:04:00 +0200
categories: [Gaming]
tags: [remote, gaming, steam, playnite, console, controller, Pi, Raspberry Pi, IoT, Internet of Things, ARM, Android, Apple, TV]
math: true
mermaid: true
image:
  path: /assets/steam-link-pi.jpg
  alt: Steam Link on Raspberry Pi used for Remote Gaming
---

> This guide can also be applied to an Android / Apple TV instead of the Raspberry Pi, install the Steam Link app from the Play Store or App Store. When installed, continue the guide from the Setting up Playnite section.

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
  + [x] [Raspberry Pi OS (Legacy)](https://www.raspberrypi.com/software/operating-systems/#:~:text=Archive-,Raspberry%20Pi%20OS%20(Legacy),-A%20stable%20legacy) Installed
  + [x] Display or TV with HDMI support
  + [x] [Supported Input/Controller](https://help.steampowered.com/en/faqs/view/6424-467A-31D9-C6CB#:~:text=Supported%20Input/Controllers)
  + [x] Wired connection for stability

### Setting up the Raspberry Pi

1. Setup the Raspberry Pi according to the video below

> Make sure to select Raspberry Pi OS (Legacy) in the Imager
{: .prompt-warning }

{% include embed/youtube.html id='CQtliTJ41ZE' %}
