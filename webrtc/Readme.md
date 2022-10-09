## Chrome Flags

Like the rest of Chrome, there’s a focus on automated tests.

For manual development and testing, here are some command line flags that are useful for WebRTC-related testing:

* `--allow-file-access-from-files` allows getUserMedia() to be called from file:// URLs.

* `--disable-gesture-requirement-for-media-playback` removes the need to tap a <video> element to start it playing on Android.

* `--use-fake-ui-for-media-stream` avoids the need to grant camera/microphone permissions.

* `--use-fake-device-for-media-stream` feeds a test pattern to getUserMedia() instead of live camera input.

* `--use-file-for-fake-video-capture=path/to/file.y4m` feeds a Y4M test file to getUserMedia() instead of live camera input.


### Other resources

This information source from the following url:

http://peter.sh/experiments/chromium-command-line-switches/

And also in the chromium source:

https://source.chromium.org/chromium/chromium/src/+/main:media/base/media_switches.cc

### Simulate Capture with a Fake Stream (test video and audio signal)

```
--use-fake-device-for-media-stream
```

### Suppress the Permission Dialog

```
--use-fake-ui-for-media-stream
```

### Use a raw video file rather than test media stream

```
--use-fake-ui-for-media-stream
```

See my bash alias for an example...

__NOTE:__ No audio as far as I can tell.


### Debug Logging

```
--enable-logging --v=1 --vmodule=*source*/talk/*=3
```

### Bash Alias

```sh
# initialise the chrome alias
alias chrome="rm -rf $HOME/.config/chrome-test && google-chrome --console --no-first-run --user-data-dir=$HOME/.config/chrome-test --use-fake-device-for-media-stream --use-file-for-fake-video-capture=/home/doehlman/testvideo.y4m --enable-logging --v=1 --vmodule=*third_party/libjingle/*=3,*=0"
```

## WebRTC Project Source Files of Interest

### Constraints Available in Chrome

```
/talk/app/webrtc/mediaconstraintsinterface.h
```

## Debugging in Firefox

Starting firefox with logging (for data channels and sctp in this case):

```
NSPR_LOG_MODULES=datachannel:5,sctp:5 /opt/browsers/firefox/stable/firefox http://localhost:9966/
```
