## Command line tools to copy to clipboard

## Download a list of files using wget

```wget -q --show-progress -i urls.txt```

## Display listening network ports

```netstat -plunt``` or ```sudo lsof -i```

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
