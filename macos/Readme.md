## Mac OS Tips

## Turn On/OFF iTunes sync auto backup

Type or paste the following exactly into the Terminal:
```bash

# to disable auto backup
defaults write com.apple.iTunes DeviceBackupsDisabled -bool true


# to re-enable auto backup
defaults write com.apple.iTunes DeviceBackupsDisabled -bool false
```

## Increase Key Repeat rate

You can also change the preference keys directly:
```bash
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```
The changes aren't applied until you log out and back in. KeyRepeat can't be set between 2 (30 ms) and 1 (15 ms) though.

## 1. Show hidden files
```defaults write com.apple.finder AppleShowAllFiles YES```

## 2. System Preferences Shortcut
To setup a keyboard shortcut to open System Preferences:

* Open *System Preferences* > *Keyboard* > *Shortcuts* > *Application Shortcuts*
* Create a new shortcut named: *System Preferences...* (Note: the three dots are important) then add the shortcut key: ```OPTION +CMD + ,```

## 3. Enable three finger dragging in El Capitan

```
system preferences > accessibility > mouse & trackpad > trackpad options > enable dragging > three finger drag
```


## 4. Installing El Capitan in a USB stick

* Connect to your Mac a properly formatted 8GB (or larger) drive, and rename the drive```Untitled```. (The Terminal command used here assumes the drive is named ```Untitled```) Also, make sure the El Capitan installer, called Install El Capitan.app, is in its default location in your main Applications folder (```/Applications```). This means that if you moved it before installing El Capitan, you need to move it back before making your installer disk.

* Copy and paste this command in the terminal (Note: it will ask you for password to run command):
```bash
sudo /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app --nointeraction
```

## Shortcut to unhide or unminimize a window

* press ⌘ ⇥ (Command-Tab) to select the app you want to unhide
* press the ⌥ (Option) key, and let go of the ⌘ key, that should unminimized the app window

## Disable the Dashboard

Type or paste the following exactly into the Terminal window:

```defaults write com.apple.dashboard mcx-disabled -boolean YES```

```killall Dock```

