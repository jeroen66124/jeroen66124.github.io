---
title: DRAFT - Creating a Remote Gaming Console-like Setup through Steam Link and Playnite with a Raspberry Pi
date: 2023-04-12 12:04:00 +0200
categories: [Gaming]
tags: [remote, gaming, steam, playnite, console, controller, Pi, Raspberry Pi, IoT, Internet of Things, ARM]
math: true
mermaid: true
image:
  path: /assets/steam-link-pi.jpg
  alt: Steam Link on Raspberry Pi used for Remote Gaming
---

## Introduction

In the last couple of weeks, I had the sudden urge of wanting to be able to play games from the couch again. Having owned both the Playstation 2 and 3 throughout my childhood introduced me to the simplicity of console gaming, just pick up the controller and play. To be able to do this with a desktop, requires some setting up however. This guide will you show you how to set this up and more.

### Steam Link

Steam already provides a really good solution to this problem, and it is called [Steam Link](https://en.wikipedia.org/wiki/Steam_Link). This used to be a piece of hardware that would allow you to stream your desktop games to a little box through either a cabled or wireless internet connection. The Steam Link hardware sadly got discontinued in 2018. Valve did actively continue the development of the software though and it suppports all major platforms. It is available for Windows, macOS, Linux, Android and iOS. We are going to focus on the Linux version because it's compatible with the Raspberry Pi.

### Playnite

Downloading the Steam Link app, connecting it your PC and play remotely would satisfy your needs if all your games were purchased on Steam. For me, this is not the case since every major game publisher has their own launcher nowadays (which is really annoying). Adding non-steam games to your Steam Library can work, but this does not work when the game goes through another launcher before executing. This is where Playnite comes in, it is an open source video game library manager with one simple goal: To provide a unified interface for all of your games. It also supports custom themes which we are going to use to create that console-like experience.

### Raspberry Pi

The Raspberry Pi is a debit card-sized low-cost computer that you can use for all sorts of stuff. It mainly runs Linux and is perfect for projects like this, because it only draws 5 watts of power. A regular smartphone charging cable should be enough and it also makes it portable friendly. I had an unused Raspberry Pi 3B laying around that was only used for collecting dust. When I started this project, I was able to give breath some life into it again!


- Chapter
  + Section
    * Paragraph

### ToDo list

- [ ] Job
  + [x] Step 1
  + [x] Step 2
  + [ ] Step 3

### Description list

Sun
: the star around which the earth orbits

Moon
: the natural satellite of the earth, visible by reflected light from the sun

## Block Quote

> This line shows the _block quote_.

## Prompts

> An example showing the `tip` type prompt.
{: .prompt-tip }

> An example showing the `info` type prompt.
{: .prompt-info }

> An example showing the `warning` type prompt.
{: .prompt-warning }

> An example showing the `danger` type prompt.
{: .prompt-danger }

## Tables

| Company                      | Contact          | Country |
|:-----------------------------|:-----------------|--------:|
| Alfreds Futterkiste          | Maria Anders     | Germany |
| Island Trading               | Helen Bennett    | UK      |
| Magazzini Alimentari Riuniti | Giovanni Rovelli | Italy   |

## Links

<http://127.0.0.1:4000>

## Footnote

Click the hook will locate the footnote[^footnote], and here is another footnote[^fn-nth-2].

## Inline code

This is an example of `Inline Code`.

## Filepath

Here is the `/path/to/the/file.extend`{: .filepath}.

## Code blocks

### Common

```
This is a common code snippet, without syntax highlight and line number.
```

### Specific Language

```bash
if [ $? -ne 0 ]; then
  echo "The command was not successful.";
  #do the needful / exit
fi;
```

### Specific filename

```sass
@import
  "colors/light-typography",
  "colors/dark-typography"
```
{: file='_sass/jekyll-theme-chirpy.scss'}

## Mathematics

The mathematics powered by [**MathJax**](https://www.mathjax.org/):

$$ \sum_{n=1}^\infty 1/n^2 = \frac{\pi^2}{6} $$

When $a \ne 0$, there are two solutions to $ax^2 + bx + c = 0$ and they are

$$ x = {-b \pm \sqrt{b^2-4ac} \over 2a} $$

## Mermaid SVG

```mermaid
 gantt
  title  Adding GANTT diagram functionality to mermaid
  apple :a, 2017-07-20, 1w
  banana :crit, b, 2017-07-23, 1d
  cherry :active, c, after b a, 1d
```

## Images

### Default (with caption)

![Image](/assets/steam-link-pi.jpg){: width="972" height="589" }
_Full screen width and center alignment_

### Left aligned

![Image](/assets/steam-link-pi.jpg){: width="972" height="589" .w-75 .normal}

### Float to left

![Image](/assets/steam-link-pi.jpg){: width="972" height="589" .w-50 .left}
Praesent maximus aliquam sapien. Sed vel neque in dolor pulvinar auctor. Maecenas pharetra, sem sit amet interdum posuere, tellus lacus eleifend magna, ac lobortis felis ipsum id sapien. Proin ornare rutrum metus, ac convallis diam volutpat sit amet. Phasellus volutpat, elit sit amet tincidunt mollis, felis mi scelerisque mauris, ut facilisis leo magna accumsan sapien. In rutrum vehicula nisl eget tempor. Nullam maximus ullamcorper libero non maximus. Integer ultricies velit id convallis varius. Praesent eu nisl eu urna finibus ultrices id nec ex. Mauris ac mattis quam. Fusce aliquam est nec sapien bibendum, vitae malesuada ligula condimentum.

### Float to right

![Image](/assets/steam-link-pi.jpg){: width="972" height="589" .w-50 .right}
Praesent maximus aliquam sapien. Sed vel neque in dolor pulvinar auctor. Maecenas pharetra, sem sit amet interdum posuere, tellus lacus eleifend magna, ac lobortis felis ipsum id sapien. Proin ornare rutrum metus, ac convallis diam volutpat sit amet. Phasellus volutpat, elit sit amet tincidunt mollis, felis mi scelerisque mauris, ut facilisis leo magna accumsan sapien. In rutrum vehicula nisl eget tempor. Nullam maximus ullamcorper libero non maximus. Integer ultricies velit id convallis varius. Praesent eu nisl eu urna finibus ultrices id nec ex. Mauris ac mattis quam. Fusce aliquam est nec sapien bibendum, vitae malesuada ligula condimentum.

### Dark/Light mode & Shadow

The image below will toggle dark/light mode based on theme preference, notice it has shadows.

![Image](/assets/steam-link-pi.jpg){: .light .w-75 .shadow .rounded-10 w='1212' h='668' }
![Image](/assets/steam-link-pi.jpg){: .dark .w-75 .shadow .rounded-10 w='1212' h='668' }

## Video

{% include embed/youtube.html id='Balreaj8Yqs' %}

## Reverse Footnote

[^footnote]: The footnote source
[^fn-nth-2]: The 2nd footnote source
