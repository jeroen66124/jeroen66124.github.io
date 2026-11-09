# Minimal Launcher for Android TV

A minimal home screen for the Philips 43PUS8505/12 (Android TV 9), or any other Android TV.

- A clock, and an app grid with TV banners. Apps without a banner show their icon and name.
- Weather in the top right, followed by two buttons: launcher settings (sliders icon) and TV settings (gear).
- You can rearrange apps, and hide any app, including system apps.
- An accessibility service makes the remote's **Home** button open this launcher. It never intercepts buttons, so volume and the D-pad, including holding them down, work exactly as before.

## Remote controls

| Where | Button | What it does |
|---|---|---|
| App tile | OK | Opens the app |
| App tile | Hold OK, or Menu/Options | Opens a menu: **Move**, **Hide app**, **App info** |
| Moving an app | Arrow keys | Moves the app (left/right one place, up/down one row) |
| Moving an app | OK or Back | Puts the app down. The new order is saved. |
| Input icon | OK | Opens the TV's own input picker (Android TV's standard `com.android.tv.action.VIEW_INPUTS`): Kanalen, HDMI 1–4 and YPbPr, with unconnected inputs dimmed. The Home redirect leaves this panel alone. |
| Sliders icon | OK | Opens **Launcher settings** (hidden apps, weather location, Home button status) |
| Gear | OK | Opens the TV's own settings |
| Anywhere | Home | Returns to this launcher and selects the first app |

The weather isn't selectable. It refreshes every 30 minutes and whenever you return to the home screen after that.

Hidden apps are listed under **Launcher settings → Hidden apps**. Select one there to put it back on the home screen.

## Build

The build tools aren't in the repository. After cloning, run `setup.bat` once on Windows. It downloads JDK 17 and the Android SDK into the `tools` folder, asks you to accept the Android SDK licences, and writes `local.properties`. Together with the first build it downloads about 1 GB and uses about 1.6 GB of disk space, and nothing is written to C:. If it stops partway, run it again: finished steps are skipped.

Then run `build.bat`. The first build also downloads Gradle and the libraries. The APK is written to `app/build/outputs/apk/debug/app-debug.apk`.

| Folder | Contents |
|---|---|
| `tools\jdk-17` | Eclipse Temurin JDK 17 |
| `tools\android-sdk` | Android SDK: platform 35, build-tools 34, platform-tools (adb) |
| `tools\gradle-home` | Gradle's downloads and caches (`GRADLE_USER_HOME`) |

`build.bat` with no arguments builds the debug APK. Any arguments replace the default task and are passed on to Gradle, so include the task: for example `build.bat clean assembleDebug`. `adb.bat` runs the adb in the tools folder.

Alternatively, open the project folder in Android Studio (Ladybug or newer), let Gradle sync, and choose **Build → Build App Bundle(s) / APK(s) → Build APK(s)**.

Debug builds are signed with the key in `%USERPROFILE%\.android\debug.keystore`. Keep that file: a build signed with a different key can't be installed over the launcher on the TV until the launcher is uninstalled, which clears its settings.

## Install on the TV

1. **Turn on developer options.** On the TV, go to Settings → Android settings → Device preferences → About. Select **Build** seven times.
2. **Turn on network debugging.** Go to Device preferences → Developer options and turn on **USB debugging**. Some firmware calls it **Network debugging**. Note the TV's IP address under Network & Internet.
3. Install the APK from your PC. The first time, approve the "Allow debugging" prompt on the TV. Without adb on your PATH, use `adb.bat` from the project folder in place of `adb` in the commands below.

```bash
adb connect 192.168.1.50:5555
```

```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

## Turn on the Home button service

On the TV, go to Settings → Android settings → Device preferences → Accessibility. Select **Minimal Launcher – Home button** and turn it on.

You can also do it over adb. This command **replaces** the list of enabled accessibility services, so check what is already on first with `adb shell settings get secure enabled_accessibility_services`.

```bash
adb shell settings put secure enabled_accessibility_services dev.minimal.tvlauncher/.HomeButtonService
```

```bash
adb shell settings put secure accessibility_enabled 1
```

**Launcher settings** shows whether the service is on.

### How the Home redirect works

When you press Home, the TV opens its stock launcher (`com.google.android.tvlauncher`). The service notices that screen change and brings this launcher to the front about 0.15 seconds later. The same happens whenever the stock launcher opens for another reason, such as at start-up.

The service doesn't intercept any buttons. An earlier version used Android's key filter to catch Home directly. On the 43PUS8505 (Android 12) the Home key never reached the filter, and an active filter stops Android from auto-repeating held keys. Holding volume only moved it one step. Without the filter, holding works as normal: tested at 17 steps for a 1.2-second hold, the same as with the service off.

**Launcher settings → Replace the TV's own home screen with this launcher** switches the redirect on or off. Turn it off if you want to use the stock launcher for a while.

### Optional: make it the real default home

The TV doesn't offer a setting to change the default home app. If you disable the stock launcher, Android uses this one as home without the service. This is reversible, but some Google TV features that depend on the stock launcher (such as recommendation rows) stop working until you re-enable it:

```bash
adb shell pm disable-user --user 0 com.google.android.tvlauncher
```

To undo it:

```bash
adb shell pm enable com.google.android.tvlauncher
```

Check the package name first with `adb shell cmd package resolve-activity -c android.intent.category.HOME -a android.intent.action.MAIN`.

## Music controls

While music plays in Spotify, Radio op TV or any other app that publishes a media session, a card appears above the apps. It shows the song, artist, album art and app, with previous, play/pause and next buttons. The card is the first row of the app grid: it fades in while the app rows slide down, and it scrolls out of view with the apps when you move down. Up from the top app row selects the card. OK opens the playing app at its player screen, and Right moves to the buttons. Previous and next only appear when the app supports them (a radio stream may only offer play/pause).

**Spotify Connect.** When the music plays on another device, such as Spotify on a laptop, the TV's Spotify app only mirrors it. It ignores play, pause and skip from Android, including the remote's media keys. The card then shows "Spotify · on another device" without buttons, and OK opens Spotify's player screen.

After you pause or stop, the card stays for two minutes so you can resume, then slides away. It only appears for music the launcher saw playing. Opening Spotify, which loads your last track paused, doesn't bring it up.

The card needs notification access, which lets the launcher see other apps' media sessions. It doesn't read your notifications. The Philips settings don't show this option, so grant it once over adb:

```bash
adb shell cmd notification allow_listener dev.minimal.tvlauncher/dev.minimal.tvlauncher.MediaListenerService
```

Launcher settings shows whether access has been granted.

## Weather

The weather comes from [Open-Meteo](https://open-meteo.com), which needs no API key. By default, the location is estimated from the TV's public IP address via [ipwho.is](https://ipwho.is). That estimate can be a nearby town. To set a fixed city, open Launcher settings, select **Location** and type a city such as `Heemskerk`. The city is entered in a dialog, so the keyboard closes when you're done. The temperature unit (°C or °F) is set in Launcher settings.

## Project layout

| File | Purpose |
|---|---|
| `LauncherActivity.kt` | Home screen: clock, weather, gear, app grid, hide menu |
| `AppRepository.kt` | Finds every launchable TV and phone app, one entry per package |
| `AppAdapter.kt` | Grid tiles with banner or icon, focus zoom, hold-OK and Menu handling |
| `SettingsActivity.kt` | Hidden apps, weather location and unit, Home service status |
| `HomeButtonService.kt` | Accessibility service that replaces the stock home screen with this launcher |
| `WeatherClient.kt` | Open-Meteo and IP location lookups |
| `MediaWidget.kt` | Music card: follows media sessions, shows the controls, 2-minute pause grace |
| `MediaListenerService.kt` | Empty notification listener that grants access to media sessions |
| `Prefs.kt` | Saved settings, app order and hidden apps |
