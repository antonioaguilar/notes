# Bash scripts

## Syntax highlight in bash (Ubuntu)

```bash
sudo apt-get install python-pygments
```

```bash
alias ccat='pygmentize'
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

