# Bash scripts

## Useful ```screen``` commands:

* ctrl + a c - This command **c**reates a new screen session.
* ctrl + a n - Switch to the **n**ext screen session.
* ctrl + a p - Switch to the **p**revious screen session.
* ctrl + a d - This command **d**etaches a screen session (without killing the processes).
* screen -r <session> - Reconnect to an existing screen session.
* screen -ls - Lists the current screen sessions.
* exit - Closes a screen session.

## Get current IP from system

```bash
#!/usr/bin/env bash
/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'
```
use ```./getIP eth0```, this should return: ```192.168.10.33```

## Compress folder into multiple zip files

```bash
# compress folder into several 64MB zip files
zip -r -s 64 archive.zip folder-name
```

## Print string multiple times

Print message multiple times:

```bash
perl -E 'say "Hola mundo!\n" x 1000'
```

Print message with increment: 

```bash
for i in {01..09} {11..100}
do
  echo "Your user id: $(printf "%02d" $i)"
done
```

## Get the size of a directory
```
du -sh
```

## Capture all terminal output

```bash
script terminal-session.txt
Script started, file is terminal-session.txt
```

the ```script``` command will start logging all the terminal output to the ```terminal-session.txt``` file. To save the session, just type ```exit```:

```bash
exit
Script done, file is terminal-session.txt
```

## Get primary IP address 

```bash
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
```

## Syntax highlight in bash (Ubuntu)

```bash
sudo apt-get install python-pygments
```

```bash
alias ccat='pygmentize -g'
```

## Copy all files and folders but ```exclude``` other

```bash
rsync -av --progress sourcefolder /destinationfolder --exclude thefoldertoexclude
```

## Run command every N seconds

Install ```watch``` command in terminal (e.g. ```brew install watch```)

Example: Run ```tree``` command every second:
```bash
watch -n1 tree -h ./some-dir
```

## Create Zip folder with password

```
zip -er archive.zip /path/to/directory/
```

## Find and rename list of files (multiple file rename)

```bash
find . -type f -name '*.spec.js' -execdir mv {} {}_renamed ';'
```
this will find and rename all files with ```.spec.js``` extension to ```<file>.spec.js_renamed```

## Command line tools to copy to clipboard

```bash
sudo apt-get install xsel
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
```

## Count files in directory by extension

```bash
#!/bin/bash

shopt -s nullglob

for ext in jpg png gif; do
  files=( *."$ext" )
  printf 'number of %s files: %d\n' "$ext" "${#files[@]}"

  # now we can loop over all the files having the current extension
  for f in "${files[@]}"; do
    # anything else you like with these files
  done

done
```

