# Using the Cloud Foundry API

### Latest API docs

* [Cloud Foundry API](https://apidocs.cloudfoundry.org/2.3.0/)

### API endpoint

```
curl -s -k https://api.fluxmq.com/v2/info | jq
```

### Get the OAuth token via the CF CLI

```
export CF_TOKEN=$(cf oauth-token)
```

### Authenticate

```
curl -s -k -X POST https://login.fluxmq.com/oauth/token \
-H 'Content-Type: application/x-www-form-urlencoded' \
-H 'Accept:application/json' \
-d "grant_type=password&username=alice%40fluxmq.com&password=wonderland" | jq
```

### List all the apps

```
# get the JSON blob
curl -s -k https://api.fluxmq.com/v2/apps -H "Authorization: $(cf oauth-token)" | jq

# display the names only
curl -s -k https://api.fluxmq.com/v2/apps -H "Authorization: $(cf oauth-token)" | jq -r .resources[].entity.name
```

### List all the orgs and spaces

```
# get all the orgs
curl -s -k https://api.fluxmq.com/v2/organizations -H "Authorization: $(cf oauth-token)" | jq -r .resources[].entity.name

# get all the spaces
curl -s -k https://api.fluxmq.com/v2/spaces -H "Authorization: $(cf oauth-token)" | jq -r .resources[].entity.name
```
### Scale an App

Find the GUID of the running app

```
# first find the guid of the app in the metadata propery
curl -s -k https://api.fluxmq.com/v2/apps -H "Authorization: $(cf oauth-token)" | jq -r .resources[]

# filter the guid only
curl -s -k https://api.fluxmq.com/v2/apps -H "Authorization: $(cf oauth-token)" | jq -r .resources[].metadata.guid
```

Send the scale parameters

> This command is only supported in CF API version 3

```
export APP_GUID="6c81d5f4-10f5-454b-a00c-0d03e769f7b1"

curl -s -k -X PUT https://api.fluxmq.com/v2/apps/6c81d5f4-10f5-454b-a00c-0d03e769f7b1/processes/web/scale \
-H "Authorization: $(cf oauth-token)" \
-d '{ "instances": 1, "memory_in_mb": 32, "disk_in_mb": 128 }'
```

> Use this command if using CF API version 2.x
```
export APP_GUID="6c81d5f4-10f5-454b-a00c-0d03e769f7b1"

curl -s -k -X PUT https://api.fluxmq.com/v2/apps/6c81d5f4-10f5-454b-a00c-0d03e769f7b1 \
-H "Authorization: $(cf oauth-token)" \
-d '{ "instances": 8, "memory": 32, "disk_quota": 128 }'
```
