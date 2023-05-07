
---
title: How to run a full Bitcoin node the easy way with Umbrel OS
date: 2023-05-06 19:00:00 +0200
categories: [Bitcoin]
tags: [bitcoin, full, node, umbrel, self-host, decentralized, peer-to-peer, cryptocurrency, Web3, transactions, blockchain, mempool, liberty, VMware, ESXi, Ubuntu, server, synchronization, hypervisor, bare-metal]
math: false
mermaid: false
image:
  path: /assets/public-2/31.png
  alt: First time setup screen of Umbrel OS
---

## Showcase

![1](/assets/public-2/34.png)
_Umbrel OS home screen after installation_

{% include embed/youtube.html id='Uu1TuE6RdKM' %}
_Introduction video of Umbrel OS_

> This guide is written with the ESXi type-1 hypervisor in mind, but can also be applied to a bare-metal installation. If you want to install Umbrel OS on bare-metal, start the guide from the [Set up Ubuntu](https://vskills.nl/posts/run-full-bitcoin-node-umbrel-os/#step-2-set-up-ubuntu-server) section
{: .prompt-tip }

## Introduction
I've always been interested in Bitcoin and the way it operates. Ever since I read **[Mastering Bitcoin - Programming the Open Blockchain](https://github.com/bitcoinbook/bitcoinbook)** by Andreas Antonopoulos, I felt the need to run a full bitcoin node and be a contributor to the bitcoin network. Running a full bitcoin node is an relatively easy way to make the network more secure. The bitcoin ecosystem has matured alot throughout the years and the software has too. Follow me along on this guide and join the growing network of validators too!

What is a full Bitcoin node? Let me explain the basics:
• A node is a computer connected to other computers which follows rules and shares information      
• A ‘full node’ is a computer in Bitcoin’s peer-to-peer network which hosts and synchronises a copy of the entire Bitcoin blockchain       
• Nodes are essential for keeping a cryptocurrency network running

## Prerequisites
Here's what you'll need to get started:

- [x] Latest [Ubuntu Server ISO](https://ubuntu.com/download/server)
- [x] 600+ GB of storage available (Make sure to check the [current Blockchain size](https://www.blockchain.com/explorer/charts/blocks-size) to adjust size accordingly)
- [x] Dual Core CPU & 2GB RAM
- [x] Stable internet connection

## Step 1: Set up ESXi Virtual Machine

First, you'll need to set up your Raspberry Pi. If you don't already have one, you can purchase one online from a variety of retailers. It's recommended to get a model with built-in Wi-Fi, such as the Raspberry Pi 3 B+ or Raspberry Pi 4. A Minimum 1GB of RAM is required on both models for it to work smoothly.

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

## Step 2: Set up Ubuntu Server

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

## Step 3: Set up Umbrel OS

While you can launch games directly from Steam Link, it's helpful to have a central location to manage your games. Playnite is a free, open-source gaming platform that can be used to manage and launch your games from one central location.

To install Playnite on your PC, follow these steps:

1.  Go to the Playnite website and download the latest version of Playnite
2.  Once the download is complete, run the Playnite installer and follow the on-screen instructions to install it on your PC
3.  After installation is complete, launch Playnite and add your games library to the app. You can do this by opening the menu on the top left and clicking on "Add Game" and selecting the folders where your games are stored 

Old and new games can both be added, and it supports any modern launcher as well, it even supports pirated copies (although unsupported for obvious reasons).

## Step 4: Set up Pruning Mode (Optional)

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

## Step 5: Set up Lightning Node (Optional)

Now that Steam Link and Playnite are installed, you'll need to connect your Raspberry Pi to your PC. Follow these steps:

1.  Make sure your Raspberry Pi is connected to your network (either via Ethernet or Wi-Fi)
2.  Launch Steam on your PC
3.  In the top left corner of the Steam window, click on "Steam" and select "Settings"
4.  Click on the "Remote Play" tab and make sure the "Enable Remote Play" checkbox is checked
5.  Click on "Advanced Host Options" and make sure the "Use Nvidia NVFBC capture on supported games" checkbox is checked
6.  Also make sure to tweak your maximum bitrate and FPS. I own a model 3B+ and have set the bitrate to max 10mbps with FPS-cap on 60. This looks okay visually and also reduces stutters because the Model 3 Pi cannot handle higher bitrates smoothly
7.  Click on "OK" to save your settings
8.  Launch Steam Link on your Raspberry Pi
9.  Follow the on-screen instructions to connect to your network and select your gaming device. If your PC is running Steam, it should automatically appear on the list. If it doesn't, you can connect through a one-time PIN code

## Closing

And that's it! With these steps, you can set up your own remote gaming setup using Steam Link, Playnite, and a Raspberry Pi. Enjoy your gaming sessions from the comfort of your couch or bed, without having to be right in front of your PC. Whether you want to play your favorite games on a larger screen, or just want the flexibility to game from anywhere in your home, this project is a great way to achieve both. So, grab your Raspberry Pi, install Steam Link and Playnite, and start gaming!
