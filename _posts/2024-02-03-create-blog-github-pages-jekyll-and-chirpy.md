---
title: How to create your own blog with GitHub Pages and Jekyll (hosted for free!)
date: 2024-02-03 17:00:00 +0200
categories: [Blogging]
tags: [blogging, blog, GitHub, pages, setup, jekyll, markdown, easy, publishing, Chirpy, share, social]
math: false
mermaid: false
image:
  path: /assets/public-6/1.jpg
  alt: Creating a custom Windows 11 image
---

## Showcase
![1](/assets/public-5/2.png)
_Using NTLite to remove unneeded App components_

> This guide will be written for Windows 10 and 11, but can be applied to all future Windows Operating Systems, compatible with NTLite, PowerShell and the Windows Package Manager. Keep in mind that this guide is just a proof of concept, **do not use it in production**. The steps can be adjusted to your liking, and should include enough information for it to be pretty straight-forward. 
{: .prompt-tip }

## Introduction
The information below will cover creating a clean and preconfigured Windows image, that (if correctly maintained) can save lots of time and reduce resources. It can be applied to both virtual and host machines, and is catered towards people who like to tinker with Windows installations and strip stuff out that is not needed. Most people are fine with either an post-install debloat tool or LTSC versions of Windows, but NTLite can go way deeper than that. 

## Prerequisites
Here's what you'll need to get started:
- [x] Domain name
- [x] GitHub account
- [x] Basic DNS knowledge
- [x] Basic Markdown knowledge

## Step 1: Set up NTLite
1. [Download](https://www.ntlite.com/download/) and Install NTLite, the Free version works just fine
![1](/assets/public-5/3.png)
2. [Download](https://www.microsoft.com/software-download) an Windows 10 or 11 ISO from Microsoft
![1](/assets/public-5/4.png)
3. Go to NTLite > Add > Image > Select ISO
![1](/assets/public-5/5.png)
4. Expand the ISO > Load your preferred image > Wait until loaded
![1](/assets/public-5/6.png)
![1](/assets/public-5/7.png)
5. Once the image is fully loaded, you can begin customizing
![1](/assets/public-5/8.png)

## Step 2: Customizing the image
1. Updates > Add > Latest online updates > Select > Enqueue
![1](/assets/public-5/9.png)
2. You can also add drivers and registry files if needed
![1](/assets/public-5/11.png)
![1](/assets/public-5/12.png)
3. Post-Setup > Add > Files, Commands, Templates such as:
- [Winstart](https://github.com/jeroen66124/Winstart/blob/main/winstart.ps1) (made by me)
- [Google Chrome](https://chromeenterprise.google/browser/download/#windows-tab)
- Disable hibernation
- Disable password expiry
![1](/assets/public-5/10.png)
4. Components > Apps, Multimedia, Remoting and Privacy such as:
![1](/assets/public-5/13.png)
![1](/assets/public-5/14.png)
![1](/assets/public-5/15.png)

## Step 3: Testing image in Virtual Machine
1. Create a Virtual Machine and mount the ISO
![1](/assets/public-5/28.png)

## Closing

Awesome, you're set! NTLite is a really handy tool to tweak every layer of Windows and customize it to your liking. By following this guide, you can create your own Windows image and have a clean installation always ready to go. 
