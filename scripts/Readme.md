# Command line tools and tips 

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

## List all JSON data

```bash
jq . file.json
```

## Query attributes JSON data

```bash
jq .events file.json
```

## Query attributes inside array that contains a matching value

```bash
jq '.events[] | select(.channel | contains("SETTINGS"))' file.json
```
where ```events``` is the array and ```channel``` is the inner attribute, e.g. ```event[0].channel```

## Count the number of elements in array (length)

```bash
jq '.events | length' file.json
```
