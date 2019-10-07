# Command line tools and tips

## Zip and exclude folders

```
# this will exlude the .git and node_modules folders
zip -r my-folder.zip my-folder -x "*.git*" -x "*node_modules*"
```

## Passing Bash variables in CURL command

```
# example 
SENSOR_VALUE=$(jot -r 1 1 100)
DEVICE_ID=$(openssl rand -hex 4)
curl -H "Content-Type: application-json" -X POST http://localhost:8080/ \
-d '{"id": "'"$DEVICE_ID"'", "temperature": '"$SENSOR_VALUE"' }'
```

## Generate Random Strings

```
openssl rand -hex 12

openssl rand -base64 12
```

## Generate Random numbers

```
# generate simple random integers

MIN=5
MAX=10

jot -r 1 $MIN $MAX
```

## jq - JSON processor

* Mac OS Install: ```brew install jq```
* Linux Install: ```sudo apt-get install jq```

Example JSON data:

```javascript
// file.json
{
  "events": [
    {
      "channel": "ACCOUNTS",
      "topic": "action.remove.account",
      "data": true,
      "timestamp": "2016-09-27T20:58:07.044Z",
    },
    {
      "channel": "SETTINGS",
      "topic": "settings.update",
      "data": true,
      "timestamp": "2016-09-27T20:58:05.891Z",
    }    
  ]
}
```

### List all JSON data

```bash
jq . file.json
```

### Query attributes JSON data

```bash
jq .events file.json
```

### Query attributes inside array that contains a matching value

```bash
jq '.events[] | select(.channel | contains("SETTINGS"))' file.json
```
where ```events``` is the array and ```channel``` is the inner attribute, e.g. ```event[0].channel```

### Count the number of elements in array (length)

```bash
jq '.events | length' file.json
```

### Sorting items

```bash
jq 'sort_by(.event.name)' file.json

```

### Read a Chrome HAR file and search for the Websocket messages only

```
sed '/^{/,/^}/!d' < file.har | jq '.. |."_webSocketMessages"? | select(. != null)'
```

## VirtualBox

### Resize virtualbox disk image

```bash
# Clone the .vmdk image to a .vdi.
VBoxManage clonehd virtualdisk.vmdk new-virtualdisk.vdi --format vdi
# Resize the new .vdi image (30720 == 30 GB).
VBoxManage modifyhd new-virtualdisk.vdi --resize 30720
# Optional; switch back to a .vmdk.
VBoxManage clonehd new-virtualdisk.vdi resized.vmdk --format vmdk
```
