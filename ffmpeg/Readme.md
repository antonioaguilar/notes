# FFMPEG tricks and tips

# Convert files in batch

```
# converts all m4a audio files to mp3
for i in *.m4a;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -i "$i" "${name}.mp3"
done
```

