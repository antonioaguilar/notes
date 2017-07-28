# ElasticSearch

## Increase Virtual Memory Map count

set max_map_count value (Linux)

```
sudo sysctl -w vm.max_map_count=262144
```

## Install Java on Ubuntu
```bash
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -qq update

echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

sudo apt-get -qq -y install oracle-java8-installer
echo 'Done';

```

Note: If ```add-apt-repository``` command is not found. You need to install: ```apt-get install software-properties-common```

## Install ElasticSearch

Download the Official [ElasticSearch](https://www.elastic.co/downloads/elasticsearch) Distribution


## ElasticSearch Network Settings

```yaml
network.host: _eth0_
http.compression: true

# enable CORS settings
http.cors.enabled: true
http.cors.allow-origin: "*"
http.cors.allow-methods: "OPTIONS, HEAD, GET, POST, PUT, DELETE"
http.cors.allow-headers: "X-Requested-With, X-Auth-Token, Content-Type, Content-Lenght, Authorization"
```

## Run ElasticSearch as Root

```bash
bin/elasticsearch -Des.insecure.allow.root=true
```

## List available indices in ES server

```bash 
GET /_cat/indices
```

## List 1000 data items in ES server

```bash
GET /_search/?size=1000&pretty=1
```

## Download or upload an index to ElasticSearch 

```bash
npm install -g elasticdump@1.1.4
```

Upload an index:

```bash
elasticdump --bulk=true --input=data.json --output=http://localhost:9200/
```

Download an index:

```bash
elasticdump --all=true --input=http://localhost:9200 --output=backup.json
```
