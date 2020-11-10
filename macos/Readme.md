## Mac OS Tips

## Get IP address from terminal CLI

```
ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'
```

## Disable creating .DS_store files in MacOS

```
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
```

## Mac Navigation Shortcuts

Google Chrome
* Use TAB +/- UP/DOWN keys to navigate between page results
* Use CTRL+CMD+ENTER to open link in a tab (background)

## Show hidden files

```defaults write com.apple.finder AppleShowAllFiles YES```

Finder, it is now possible to use the shortcut:

``` CMD + SHIFT + .```

## Enable git / bash completion

```bash
brew install bash-completion
```

## Enable color highlighting via ccat

Install python's pygments package:

```
sudo easy_install Pygments
```
Add an alias in ```.bash_profile``` to ```ccat``` using ```pygmentize -g```:

```
alias ccat='pygmentize -g'
```

## Flush and DNS cache

```
sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;
```

## Take screenshot without shadow behind

To take a screenshot of specific window:

* CMD + SHIFT + 4 + SPACE

You can disable the shadow added when capturing an entire window by executing the following command from the Terminal:

```bash
defaults write com.apple.screencapture disable-shadow -bool TRUE
```
You'll need to reboot or restart the UIServer for the changes to take effect:

```bash
killall SystemUIServer
```
You can undo this preference and re-enable shadows by executing the following:

```bash
defaults write com.apple.screencapture disable-shadow -bool FALSE; killall SystemUIServer
```
## Take screenshot and save as different image format

You can use the following file types: tiff, pdf, png, bmp or pict.

```
defaults write com.apple.screencapture type pdf
killall SystemUIServer
```

## Turn On/OFF iTunes sync auto backup

Type or paste the following exactly into the Terminal:
```bash

# to disable auto backup
defaults write com.apple.iTunes DeviceBackupsDisabled -bool true


# to re-enable auto backup
defaults write com.apple.iTunes DeviceBackupsDisabled -bool false
```

## Turn ON/OFF iTunes automatic launch when connecting headsets (bluetooth/headphones)

```bash
# turn off
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

# this also works
sudo pkill -9 rcd

# turn on
launchctl load -w /System/Library/LaunchAgents/com.apple.rcd.plist

```

## Increase Key Repeat rate

You can also change the preference keys directly:
```bash
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```
The changes aren't applied until you log out and back in. KeyRepeat can't be set between 2 (30 ms) and 1 (15 ms) though.


## 2. System Preferences Shortcut
To setup a keyboard shortcut to open System Preferences:

* Open *System Preferences* > *Keyboard* > *Shortcuts* > *Application Shortcuts*
* Create a new shortcut named: *System Preferences...* (Note: the three dots are important) then add the shortcut key: ```OPTION +CMD + ,```

## Enable three finger dragging in Mac OS

```
system preferences > accessibility > mouse & trackpad > trackpad options > enable dragging > three finger drag
```

## Disable the Dashboard

Type or paste the following exactly into the Terminal window:

```defaults write com.apple.dashboard mcx-disabled -boolean YES```

```killall Dock```

## Disable SIP (System Integrity Protection) 

Boot into recovery mode (e.g. restart the Mac and hold `CMD+R` while booting). Open a terminal under utilities menu

```
# check the status
csrutil status

# disable the feature
csrutil disable

# re-enable the feature
csrutil enable
```

## Disable spotlight indexing

```
sudo mdutil -a -i off
```
