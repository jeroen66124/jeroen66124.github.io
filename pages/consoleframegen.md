---
title: Console Frame Generation
layout: default
last_modified_date: 13-11-2026
---

Stream PlayStation 5 games that run on 30 FPS to a Windows PC with **chiaki-ng** and double them to 60 FPS with **Lossless Scaling** frame generation.

1. **Download the tools**  
   [chiaki-ng](https://github.com/streetpea/chiaki-ng/releases/latest){:target="_blank"}<br>
   [Lossless Scaling](https://store.steampowered.com/app/993090/Lossless_Scaling/){:target="_blank"}
2. **Prepare the setup**

   - Connect both the PS5 and the PC with **Ethernet**
   - Connect the DualSense to the PC with **USB**
   - Set the Display refresh rate to **120 Hz** (or any multiple of 60) to avoid stutters
   - Enable Remote Play on the PS5 under ***`Settings > System > Remote Play`***
   - Register the console in chiaki-ng, it should be discovered automatically
3. **Configure chiaki-ng**

   | Tab | Setting | Value |
   |:----|:--------|:------|
   | Video | Hardware Decoder | **Vulkan** + **Zero-Copy** (d3d11va if you see glitches) |
   | Video | Window Type | **Fullscreen** (windowed if capture fails) |
   | Video | Vertical Sync | **Off** |
   | Video | Render Preset | **Fast** |
   | Video | Frame Delivery | **Direct Mapping** |
   | Video | Renderer Backend | **Vulkan** |
   | Stream | Resolution | **1080p** |
   | Stream | FPS | **30 FPS** |
   | Stream | Bitrate | **100 Mbps** |
   | Stream | Codec | **H265** |

   Match the FPS of the stream to the FPS of the game. A 60 FPS stream of a 30 FPS game contains duplicate frames that break frame generation.
4. **Configure Lossless Scaling**

   | Section | Setting | Value |
   |:--------|:--------|:------|
   | Frame Generation | Type | **LSFG 3.1** |
   | Frame Generation | Mode | **Fixed**, multiplier **2** (e.g. times 4 for 120 FPS) |
   | Frame Generation | Flow scale | **100** |
   | Frame Generation | Performance | **Off** |
   | Capture | Capture API | **DXGI** (WGC if capture glitches) |
   | Capture | Queue target | **0** |
   | Rendering | Sync mode | **Off (Allow tearing)** |
   | Rendering | Max frame latency | **1** |
   | Rendering | Draw FPS | **On** |
5. **Start streaming**

   - Start the stream in chiaki-ng, then press ***`Ctrl+Alt+S`*** in Lossless Scaling
   - The FPS counter should read ***`30/60`***. If the first number is 60, the stream isn't set to 30 FPS
   - Frame generation needs GPU headroom. At high usage, frames queue up and add delay, so lower the **Flow scale** and or enable **Performance** mode.
