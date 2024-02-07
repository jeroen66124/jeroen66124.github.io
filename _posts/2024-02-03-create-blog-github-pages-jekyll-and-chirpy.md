---
title: How to create your own blog with GitHub Pages and Jekyll (hosted for free!)
date: 2024-02-03 17:00:00 +0200
categories: [Blogging]
tags: [blogging, blog, GitHub, pages, setup, jekyll, markdown, easy, publishing, Chirpy, share, social]
math: false
mermaid: false
image:
  path: /assets/public-6/1.jpg
  alt: Creating a Markdown blog with Jekyll
---

## Showcase
![1](/assets/public-6/2.png)
_Using the Chirpy theme for Jekyll to create a modern blog_

> This guide provides basic instructions on how to create a Jekyll blog, hosted with GitHub Pages, while using the Chirpy theme. If you want to use any other theme, you can browse them at [Jekyll Themes](https://jekyllrb.com/docs/themes/), but be aware that instructions may differ
{: .prompt-tip }

## Introduction
The basic instructions below will cover creating a modern and relatively easy to maintain blog. It can be applied to all sorts of topics, but is mainly used for documentation regarding IT projects. All documentation can be found at the Chirpy theme [wiki](https://github.com/cotes2020/jekyll-theme-chirpy/wiki).

## Prerequisites
Here's what you'll need to get started:
- [x] Domain name
- [x] GitHub account
- [x] DNS knowledge (basics)
- [x] Markdown knowledge (basics)

## Step 1: Set up your repository
1. Sign in to GitHub and use [this](https://github.com/cotes2020/chirpy-starter/generate) link to generate a public repository and name it USERNAME.github.io, where USERNAME represents your GitHub username
![1](/assets/public-6/3.png)
2. Once the reposistory has been created, go to Settings > Code and automation > Pages
![1](/assets/public-6/4.png)
3. Under Build and deployment > Source > select Deploy from a branch
4. Under Build and Deployment > Branch > select main > Select / (root) > Save
![1](/assets/public-6/5.png)

## Step 2: Set up your domain name
> We will be setting up an Apex domain (such as example.com), if you want to use a subdomain (such as blog.example.com), follow [this](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/about-custom-domains-and-github-pages#using-a-subdomain-for-your-github-pages-site) link for more information
{: .prompt-warning }

1. Go to your domain name provider portal, and add the following DNS records. One 'A' (IPv4) and 'AAAA' (IPv6) record should be sufficient, but you can add more for redundancy (changes to DNS can take up to 24 hours to effect!)
```
A     185.199.108.153
A     185.199.109.153
A     185.199.110.153
A     185.199.111.153
AAAA  2606:50c0:8000::153
AAAA  2606:50c0:8001::153
AAAA  2606:50c0:8002::153
AAAA  2606:50c0:8003::153
CNAME username.github.io
```
![1](/assets/public-6/6.png)
![1](/assets/public-6/7.png)
2. Go to GitHub > Repository > Settings > Code and automation > Pages > Custom domain > Fill in domain name > Save
3. Enable Enforce HTTPS for improved security, the certificate will be provided for free by Let's Encrypt
![1](/assets/public-6/8.png)

## Step 3: Set up your Chirpy theme
1. Most of the configurations can be modified by going to your repository and editing the *_config.yml* file. If you want to have an example of the configuration file, please view the YAML contents of the theme [here](https://github.com/cotes2020/jekyll-theme-chirpy/blob/master/_config.yml)
2. These folders can be changed accordingly:
  - `/_data`{: .filepath} = Modify the Contact & Share buttons
  - `/_posts`{: .filepath} = Create and Remove Posts (Markdown)
  - `/_tabs`{: .filepath} = Modify the About page (don't touch the other files)
  - `/assets`{: .filepath} = Modify Favicons and Upload images (Recommended to put avatar here too)
3. If you want to have an example of the structure and usage of these folders, please view [my repository](https://github.com/jeroen66124/jeroen66124.github.io) on GitHub
4. Make sure to check for a new version of Chirpy every once in a while by following the [Upgrade Guide](https://github.com/cotes2020/jekyll-theme-chirpy/wiki/Upgrade-Guide#upgrade-from-starter). this will fix bugs and add new features down the line

> When writing your first blog post, please be aware that Chirpy has slightly modified the usage of Markdown. I strongly recommend reading the [Text and Typography](https://chirpy.cotes.page/posts/text-and-typography/) documentation to make yourself familiar with its formatting
{: .prompt-tip }

## Closing
Cool stuff, I hope you got it running! Chirpy is a straight-forward Jekyll theme to start your own (freely hosted) blog through GitHub Pages. Now go write and share what you have always wanted to!
