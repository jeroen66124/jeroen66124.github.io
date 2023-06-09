---
title: How to create a zero config VPN for remote access to your homelab with Tailscale
date: 2023-06-08 21:00:00 +0200
categories: [VPN]
tags: [VPN, Tailscale, WireGuard, config, zero, easy, remote, access, homelab, secure, network, service, open-source]
math: false
mermaid: false
image:
  path: /assets/public-3/1.jpg
  alt: Tailscale software used for easy remote access
---

## Showcase
![1](/assets/public-3/2.jpg)
_Tailscale using the Subnet Routing feature to expose all internal devices to the VPN_

> This guide is written with the use of Photon OS (small open-source Linux distro from VMware), but can also be applied to Docker Desktop, Ubuntu Server and all sorts of other environments where Docker is possible. If you want to know how to set up Tailscale, start the guide from the [Set up Tailscale](https://vskills.nl/posts/zero-config-vpn-remote-access-tailscale/#step-2-set-up-tailscale) section.
{: .prompt-tip }

## Introduction
I recently began with my path to the [VCP-DCV](https://www.vmware.com/learning/certification/vcp-dcv.html) certification. During this learning process, I felt the need to bring my Homelab to the next level. The enablement of remote access is inevitable when it comes to upgrading your lab so I searched for an easy-to-use solution that did not cause me any headaches (I still dislike configuring networks!). Tailscale was the most modern and straight-forward option to tackle this problem.

## Prerequisites
Here's what you'll need to get started:
- [x] Latest [Photon OS ISO](https://github.com/vmware/photon/wiki/Downloading-Photon-OS#downloading-photon-os-50-ga) (any flavour works)
- [x] Docker & Docker Compose installed (Photon OS comes pre-installed with both of these!)
- [x] Tailscale account for the necessary credentials

## Step 1: Set up Photon OS

Boot from the Photon OS ISO image on your virtual machine or bare-metal machine

1.  Type in the name of your VM, I went with "Umbrel", and select the other three setup options like shown below:
![1](/assets/public-2/3.png)
2.  Select the preferred Datastore, I went with "datastore0" because I have multiple datastores
![1](/assets/public-2/4.png)
3.  Customize the settings exactly like shown in the screenshots below and click on "Next"
![1](/assets/public-2/5.png)
![1](/assets/public-2/6.png)
4.  Confirm the settings once more and click on "Finish" 
![1](/assets/public-2/7.png)

## Step 2: Set up Tailscale

Now that your Virtual Machine is ready, you'll need to install Ubuntu Server

1.  To turn on the Virtual Machine, click the "Power On" button
![1](/assets/public-2/8.png)
2.  It should automatically load the GRUB bootloader, select "Try or Install Ubuntu Server" and wait for it to load
![1](/assets/public-2/9.png)
![1](/assets/public-2/10.png)

```bash
version: '3.3'
services:
    tailscale:
        container_name: tailscaled
        volumes:
            - '/var/lib/tailscale:/var/lib/tailscale'
            - '/dev/net/tun:/dev/net/tun'
        network_mode: host
        restart: always
        environment:
            - TS_AUTHKEY=tskey-auth-****
            - TS_ROUTES=192.168.1.0/24
            - TS_STATE_DIR=/var/lib/tailscale
        image: tailscale/tailscale
```

It will ask for your password like shown below:
![1](/assets/public-2/28.png)

## Closing

And that wraps it up! With these steps, you can set up your own Bitcoin and Lightning Node, self-host all sorts of different apps and improve your privacy while doing so. Jump into the world of Bitcoin and self-hosting with Umbrel OS, and explore this easy to use solution.
