---
title: How to automate and customize your own clean Windows setup with PowerShell 
date: 2023-11-03 19:00:00 +0200
categories: [Automation]
tags: [Automation, scripting, Windows, setup, winget, activation, bloatware, debloat, Microsoft, GitHub, open-source]
math: false
mermaid: false
image:
  path: /assets/public-5/1.jpg
  alt: PowerShell will be used for automation
---

## Showcase
![1](/assets/public-5/2.png)
_Preview of the PowerShell code on the GitHub repository_

> This guide will be written for Windows 10 and 11, but can be applied to all future Windows Operating Systems, compatible with PowerShell and the Windows Package Manager. Keep in mind that the code of the script is just a proof of concept, or template, if you will. It can be modified to your liking and includes comments for easier understanding, although it is pretty straight-forward on its own. 
{: .prompt-tip }

## Introduction
I mess around with Virtual Machines alot, which also means creating a clean Windows template is part of the process. I do not want to bother with reinstalling Windows everytime I want to try something out in an isolated environment. This script is for the rare occassion when I do end up having to reinstall Windows, and want to save as much time as possible. Microsoft has developed the Windows Sandbox feature, which provides a lightweight desktop environment to safely run applications in isolation. This option has one drawback though, it does not have persistency (this has been added in later Windows 11 updates, but I run Windows 10 and do not have the intention to switch anytime soon).

## Prerequisites
Here's what you'll need to get started:
- [x] Windows 10 or 11
- [x] PowerShell (Administrator)

## Step 1: Run the script and evaluate

1.  Open PowerShell (as Administrator)
![1](/assets/public-5/3.png)
2.  Review the [code on GitHub](https://github.com/jeroen66124/Winstart/blob/main/winstart.ps1) before executing
![1](/assets/public-5/2.png)
3.  Copy the [one-liner](https://github.com/jeroen66124/Winstart/blob/main/README.md#one-liner) from the README **OR** [Download](https://github.com/jeroen66124/Winstart/blob/main/winstart.ps1) the script
![1](/assets/public-5/4.png)

## Step 2: Customize the script to your preference

## Closing

Cool, you're set up! The RPCS3 emulator opens up a world of possibilities for playing PlayStation 3 games on your PC. By following this guide, you can set up the emulator, configure it, and relive classic gaming moments from the comfort of your computer. 
