---
title: How to run a full Bitcoin node the easy way with Umbrel OS (and self-host a bunch of other apps!)
date: 2023-05-06 19:00:00 +0200
categories: [Bitcoin]
tags: [bitcoin, full, node, umbrel, self-host, decentralized, peer-to-peer, cryptocurrency, Web3, transactions, blockchain, mempool, liberty, VMware, ESXi, Ubuntu, server, synchronization, hypervisor, bare-metal, self-host, self-hosting]
math: false
mermaid: false
image:
  path: /assets/public-2/31.jpg
  alt: First time setup screen of Umbrel OS
---

## Showcase

![1](/assets/public-2/34.png)
_Umbrel OS home screen after installation_

{% include embed/youtube.html id='Uu1TuE6RdKM' %}

> This guide is written with the ESXi type-1 hypervisor in mind, but can also be applied to a bare-metal installation. If you want to install Umbrel OS on bare-metal, start the guide from the [Set up Ubuntu Server](https://vskills.nl/posts/run-full-bitcoin-node-umbrel-os/#step-2-set-up-ubuntu-server) section. Although this post focuses on running a Bitcoin Node, Umbrel OS also has the option to self-host other apps, which can be done through own research
{: .prompt-tip }

## Introduction
I've always been interested in Bitcoin and the way it operates. Ever since I read **[Mastering Bitcoin - Programming the Open Blockchain](https://github.com/bitcoinbook/bitcoinbook)** by Andreas Antonopoulos, I felt the need to run a full bitcoin node and be a contributor to the bitcoin network. Running a full bitcoin node is an relatively easy way to make the network more secure, and also enables you to connect your Bitcoin (and lightning) wallets to your own node. The bitcoin ecosystem has matured alot throughout the years and the software has too, follow me along on this guide and join the [growing network of validators](https://www.bitrawr.com/terminal/bitcoin-node-map)!

What is a full Bitcoin node? Let me explain the basics:

• A node is a computer connected to other computers which follows rules and shares information
• A ‘full node’ is a computer in Bitcoin’s peer-to-peer network which hosts and synchronises a copy of the entire Bitcoin blockchain
• Nodes are essential for keeping a cryptocurrency network running

## Prerequisites
Here's what you'll need to get started:
- [x] Latest [Ubuntu Server ISO](https://ubuntu.com/download/server)
- [x] Access to an ESXi host (optional)
- [x] 600+ GB of fast storage available (check the [current blockchain size](https://blockchair.com/bitcoin/charts/blockchain-size) to adjust storage size accordingly)
- [x] Minimum Dual-Core CPU & 2GB RAM
- [x] Stable internet connection

## Step 1: Set up Virtual Machine

To upload an ISO image to your ESXi host, follow these steps:

1.  Browse to the FQDN / IP of the ESXi host and log in to the VMware Host Client (or vSphere Client if you are running a cluster)
2.  Navigate to Storage > Datastore > Datastore browser and create a new folder named "Operating Systems" or any other name you'd like
3.  Upload the Ubuntu Server ISO image to the "Operating Systems" folder by dragging and dropping it into the browser window and wait for the upload to complete

To create a new Virtual Machine, follow these steps:

4.  Navigate to Host > Create/Register VM > Create a new virtual machine and click "Next"
2.  Type in the name of your VM, I went with "Umbrel", and select the other three options like shown below:
![1](/assets/public-2/3.png)
4.  Select the preferred Datastore, in my case I went with "datastore0" because I have multiple datastores
![1](/assets/public-2/4.png)
5.  Customize the settings exactly like shown in the screenshots below and click on "Next"
![1](/assets/public-2/5.png)
![1](/assets/public-2/6.png)
6.  Confirm the settings once more and click on "Finish" 
![1](/assets/public-2/7.png)

## Step 2: Set up Ubuntu Server

Now that your Virtual Machine is ready, you'll need to install Ubuntu Server Link on it

1.  To turn on the Virtual Machine, click on the "Power On" button
![1](/assets/public-2/8.png)
2.  It should automatically load the GRUB bootloader, select "Try or Install Ubuntu Server" and wait for it to load
![1](/assets/public-2/9.png)
![1](/assets/public-2/10.png)
3.  Select your preferred language, I chose for English
![1](/assets/public-2/11.png)
4.  Select "Continue without updating" to save some time
![1](/assets/public-2/12.png)
5.  Select "Done" five times to use the default options on the Keyboard, Installation, Network, Proxy and Mirror configuration screens
6.  Select "Done" on the Guided storage configuration screen and make sure to "Use an entire disk", you can also "Encrypt the LVM group with LUKS" if you prefer to ecnrypt your installation
![1](/assets/public-2/18.png)
7.  Select "Done" and "Continue" on the Storage configuration screen
![1](/assets/public-2/20.png)
8.  Specify your name, server name, username and password on the Profile setup screen
![1](/assets/public-2/21.png)
9.  Select "Skip for now" and "Continue" on the Upgrade to Ubuntu Pro screen
![1](/assets/public-2/22.png)
10. Enable the "Install OpenSSH server" option and select "Done" on the SSH Setup screen
![1](/assets/public-2/23.png)
11. Select "Done" on the Featured Server Snaps screen, we don't need any
12. Wait for the server to install and select "Reboot Now" once it's done
![1](/assets/public-2/26.png)
13. Once rebooted, login with your username and password
![1](/assets/public-2/27.png)

14. Now you can install Umbrel OS by executing the following command:
```bash
curl -L https://umbrel.sh | bash
```
It will ask for your password like shown below:
![1](/assets/public-2/28.png)
15. When it is done installing, visit http://umbrel.local or the IP address to access the web UI
![1](/assets/public-2/30.png)

## Step 3: Set up Umbrel OS

It is now time to set up our very own Bitcoin node and start syncing. You can also explore the other apps in the store, the possibilities are endless with Umbrel OS!

1.  To get started, click on "Start" on the setup screen
![1](/assets/public-2/31.png)
2.  Fill in your preferred username and password and click "Create"
![1](/assets/public-2/32.png)
3.  Once your account is created, click on "Next"
![1](/assets/public-2/33.png)
4.  You can now go ahead and install your Bitcoin Node app by clicking on it
![1](/assets/public-2/34.png)
5.  Click on "Install" and wait until it gives the option to "Open" the app
![1](/assets/public-2/35.png)
![1](/assets/public-2/36.png)
6.  When the app has opened, it will immediatly start syncing the entire Bitcoin blockchain. This is a lengthy process and can take multiple days depending on your internet speed.
![1](/assets/public-2/37.png)

## Step 4: Set up Pruning Mode (Optional)

If you want to reduce the storage space used, you might be interested in Pruning Old Blocks. This means that you can save storage by pruning (deleting) old blocks and keeping only a limited copy of the blockchain.

1.  Go to kebab menu > Advanced Settings 
![1](/assets/public-2/38.png)
2.  Scroll down and enable "Prune Old Blocks", use the slider to choose the size of the blockchain you want to store
![1](/assets/public-2/39.png)

## Step 5: Set up Lightning Node (Optional)

If you want to make use of the [Lightning Network](https://academy.binance.com/en/articles/what-is-lightning-network), it allows you to make ultra cheap and almost instant Bitcoin transactions. By running a Lightning node, you can not only self-custody your Bitcoin on Lightning, but also earn sats by routing payments on the network.

1.  Install the Lighting Node app from the store
2.  This will merge both Bitcoin and Lightning apps and enable Lightning Network functionality
3.  Open a channel and explore the wicked world of the Lightning Network
4.  Profit? (Have fun exploring the rabbit-hole)

## Step 6: Set up other recommended self-hosted Apps (Optional)

## Closing

And that's it! With these steps, you can set up your own remote gaming setup using Steam Link, Playnite, and a Raspberry Pi. Enjoy your gaming sessions from the comfort of your couch or bed, without having to be right in front of your PC. Whether you want to play your favorite games on a larger screen, or just want the flexibility to game from anywhere in your home, this project is a great way to achieve both. So, grab your Raspberry Pi, install Steam Link and Playnite, and start gaming!
