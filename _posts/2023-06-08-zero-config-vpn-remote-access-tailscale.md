---
title: How to set up a zero config VPN for remote access to your homelab with Tailscale
date: 2023-06-08 21:00:00 +0200
categories: [VPN]
tags: [VPN, Tailscale, WireGuard, config, zero, easy, remote, access, homelab, secure, network, subnet, service, open-source]
math: false
mermaid: false
image:
  path: /assets/public-3/1.jpg
  alt: Tailscale software used for easy remote access
---

## Showcase
![1](/assets/public-3/2.jpg)
_Tailscale using the Subnet Routing feature to expose all internal devices to the VPN_

> This guide is written with the use of Photon OS (small open-source Linux distro from VMware), but can also be applied to Docker Desktop, Ubuntu Server and all sorts of other environments where Docker is possible. You can adjust the instructions rather easily to make it applicable to your situation. If you want to skip the OS installaton and only want to know how to set up Tailscale, start the guide from the [Set up Tailscale](https://vskills.nl/posts/zero-config-vpn-remote-access-tailscale/#step-2-set-up-tailscale) section
{: .prompt-tip }

## Introduction
I recently began with my path towards the [VCP-DCV](https://www.vmware.com/learning/certification/vcp-dcv.html) certification. During this learning process, I felt the need to bring my Homelab to the next level. The enablement of remote access is inevitable when it comes to upgrading your lab so I searched for an easy-to-use solution that did not cause me any headaches (I still dislike configuring networks!). Tailscale was the most modern and straight-forward option to tackle this problem.

## Prerequisites
Here's what you'll need to get started:
- [x] Latest [Photon OS ISO](https://github.com/vmware/photon/wiki/Downloading-Photon-OS#downloading-photon-os-50-ga) (any flavour works)
- [x] Docker & Docker Compose installed (Photon OS comes pre-installed with Docker!)
- [x] Tailscale account for the necessary credentials

## Step 1: Set up Photon OS

Boot from the Photon OS ISO image on your virtual machine or bare-metal machine

1.  Once you are in the boot menu, select "Install"
![1](/assets/public-3/3.png)
2.  Accept the VMware license agreement
![1](/assets/public-3/4.png)
3.  Select your installation disk, mine shows up as a "Virtual Disk" because it is virtualized 
![1](/assets/public-3/5.png)
4.  Configure the network automatically through DHCP 
![1](/assets/public-3/6.png)
5.  If you are running Photon OS on bare-metal or a non-VMware hypervisor, select "Generic".
    If you are running Photon OS through a VMware hypervisor, select "VMware hypervisor optimized".
![1](/assets/public-3/7.png)
6.  Choose your hostname, this will also be the name shown in the Tailscale admin console
![1](/assets/public-3/8.png)
7.  Set a strong root password and don't forget it!
![1](/assets/public-3/9.png)
8.  Start the Installation by selecting "Yes" to confirm
![1](/assets/public-3/10.png)
9.  The installation will not take more than a few minutes to complete
![1](/assets/public-3/11.png)
10. Press any key to reboot after the installation is done
![1](/assets/public-3/12.png)
11. Once rebooted, login with your root account
![1](/assets/public-3/13.png)
12. Update Photon OS, Install docker-compose and preferably Nano
```bash
tdnf update -y && tdnf install docker-compose -y && tdnf install nano -y
```
![1](/assets/public-3/14.png)
![1](/assets/public-3/15.png)
13. When all is done, make the Docker service start automatically on boot
```bash
systemctl start docker && systemctl enable docker
``` 
![1](/assets/public-3/16.png)

## Step 2: Set up Tailscale

You may want to follow this section with an SSH session for easy copy-and-pasting, view the [Permitting Root Login with SSH](https://vmware.github.io/photon/assets/files/html/3.0/photon_troubleshoot/permitting-root-login-with-ssh.html) documentation to do so

1. Create a docker-compose.yml configuration file and open it
```bash
touch docker-compose.yml && nano docker-compose.yml
```
![1](/assets/public-3/17.png)
2. Once the file is created and opened, go to [Tailscale Keys](https://login.tailscale.com/admin/settings/keys) > Generate auth key > Generate key
![1](/assets/public-3/18.png)
3. Copy the key somewhere safe, it won't be shown again!
![1](/assets/public-3/19.png)
4. Go back to your terminal and copy the following configuration to your docker-compose.yml file.
   Replace the **tskey-auth** with your own key and make sure the **TS_ROUTES** variable matches your subnet
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
![1](/assets/public-3/20.png)
Press **CTRL + O** to save, **CTRL + X** to exit Nano
5. Start the docker container with the following command and wait for it to finish
```bash
docker-compose up -d
```
![1](/assets/public-3/21.png)
6. Check if your Tailscale container shows up in the [admin console](https://login.tailscale.com/admin/machines)
![1](/assets/public-3/22.png)
7. Disable the key expiry so you do not have to set it up again after 90 days
![1](/assets/public-3/23.png)
8. Go to the same settings menu and go to > Edit route settings...
![1](/assets/public-3/24.png)
9. Enable subnet routing to expose all internal devices instead of only the machine Docker is running on
![1](/assets/public-3/25.png)
10. Download the Tailscale client on all your compatible devices and connect easily to your home network!
![1](/assets/public-3/26.png)

Check out all the other [Tailscale features](https://tailscale.com/kb/1169/features/) such as Split DNS, Exit Nodes, Tailscale SSH and much more!

## Closing

You are done! With these instructions, you can set up your own zero config VPN in ~30 minutes or less. Never worry about security measures such as port forwarding ever again when it comes to your Homelab.
