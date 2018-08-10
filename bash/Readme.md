# Bash scripts

## Intercept network traffict 

```
sudo tcpflow -i any -C -g port 8080
```

## Copy a large file between two linux machines (using ```pv``` and ```netcat```)

On the remote machine:
```
nc -l -p 7000 | pv > file.tar
```

On the local machine:
```
pv file.tar | nc $REMOTE_IP 7000
```

## Copy large files or folders between two machines (faster than ```scp```)

On remote machine run:

```
nc -l -p 7000 | tar -xpf -
```

On local machine run:

```
tar -cf - * | nc $REMOTE_IP 7000
```

You can also use ```pv``` to monitor the progress of data through a pipe:

```
tar -cf - * | pv | nc $REMOTE_IP 7000
```

## Copy files locally to other volumes (faster than `cp`)

```
sudo rsync -vaE --progress /Volumes/SourceName /Volumes/DestinationName
```
The flags are:

* `-v` increases verbosity.
* `-a` applies archive settings to mirror the source files exactly, including symbolic links and permissions.
* `-E` copies extended attributes and resource forks (OS X only).
* `--progress` provides a count down and transfer statistics during the copy.
* `--dry-run` simulates the copy


## Search for text patterns using `grep`

```
grep -rwn '/path/to/folder/' -e 'pattern'

-r or -R is recursive,
-n is line number, and
-w stands for match the whole word.
-l (lower-case L) can be added to just give the file name of matching files.
```

Along with these, ```--exclude, --include, --exclude-dir``` flags could be used for efficient searching:

This will only search through those files which have .c or .h extensions:

```
grep --include=\*.{c,h} -rnw '/path/to/somewhere/' -e "pattern"
```

This will exclude searching all the files ending with .o extension:

```
grep --exclude=*.o -rnw '/path/to/somewhere/' -e "pattern"
```

For directories it's possible to exclude a particular directory(ies) through --exclude-dir parameter. For example, this will exclude the dirs dir1/, dir2/ and all of them matching *.dst/:

```
grep --exclude-dir={dir1,dir2,*.dst} -rnw '/path/to/somewhere/' -e "pattern"
```


## Search and replace text patterns

```
# works for most Linux distros
grep -rl someText somedir/ | xargs sed -i 's/someText/replacedText/g'

# for Mac OS only
grep -rl someText somedir/ | xargs sed -i "" "s/someText/replacedText/g"
```

## Find and delete files recursively with extension

```
# deletes all the *.log files 
find . -type f -name '*.log' -delete
```

## Useful ```screen``` commands:

* ctrl + a c - This command **c**reates a new screen session.
* ctrl + a n - Switch to the **n**ext screen session.
* ctrl + a p - Switch to the **p**revious screen session.
* ctrl + a d - This command **d**etaches a screen session (without killing the processes).
* screen -r <session> - Reconnect to an existing screen session.
* screen -ls - Lists the current screen sessions.
* exit - Closes a screen session.

Add this to your `~/.screenrc` to enable mouse scrolling and scroll bar history scrolling

```
shell -$SHELL
termcapinfo xterm* ti@:te@
```

## Get current IP from system

```bash
hostname -i
```

```bash
hostname --ip-address
```
Note: this works for all linux boxes (exluding Mac OS)

## Ping command with Timestamps

```bash
// outputs ping + timestamp
ping www.google.com | while read pong; do echo "$(date): $pong"; done;

// outputs ping + timestamp to a piped file
ping www.google.com | while read pong; do echo "$(date): $pong" >> ~/logs.txt; done;
```

## Compress folder into multiple zip files

```bash
# compress folder into several 64MB zip files
zip -r -s 64 archive.zip folder-name
```

## Secure copy files over SSH and exclude some files

```
scp -r [!.]* user@server:~
```
this will exclude files and folders starting with ```.*```

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

