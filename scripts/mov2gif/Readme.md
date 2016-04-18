# mov2gif - Convert Mov to Gif

`mov2gif` is a shell script for converting "small" quicktime *.MOV files into GIFs that could be used in websites, online tutorials and screenshot demos. This script has been adapted from [gifify](https://github.com/jclem/gifify) and original credits to: [Jonathan Clem](https://github.com/jclem).

## Installation

### Install FFMpeg and ImageMagick Dependencies

1. ffmpeg: `brew install ffmpeg`
2. imagemagick: `brew install imagemagick`

### Download the 'mov2gif' script

Download the [mov2gif script](https://raw.githubusercontent.com/antonioaguilar/aws-scripts/master/mov2gif/mov2gif.sh) and make it available in your `PATH` or install using this `curl` script:

```sh
curl -o /usr/local/bin/mov2gif -O https://raw.githubusercontent.com/antonioaguilar/aws-scripts/master/mov2gif/mov2gif.sh && \
  chmod +x /usr/local/bin/mov2gif
```


## Usage

For usage options: `mov2gif --help`

```sh
Usage:
  mov2gif [options] filename

Options: (all optional)
  c CROP:   The x and y crops, from the top left of the image, i.e. 640:480
  o OUTPUT: The basename of the file to be output (default "output")
  r FPS:    Output at this (frame)rate (default 10)
  s SPEED:  Output using this speed modifier (default 1)
            NOTE: GIFs max out at 100fps depending on platform. For consistency,
            ensure that FPSxSPEED is not > ~60!
  p SCALE:  Rescale the output, e.g. 320:240
  x:        Remove the original file and resulting .gif once the script is complete

Example:
  mov2gif -c 240:80 -o mygif -x mymovie.mov
```

## Demo

![https://raw.githubusercontent.com/antonioaguilar/aws-scripts/master/mov2gif/demo.gif](https://raw.githubusercontent.com/antonioaguilar/aws-scripts/master/mov2gif/demo.gif)