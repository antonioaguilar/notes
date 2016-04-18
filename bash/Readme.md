# Bash scripts

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

