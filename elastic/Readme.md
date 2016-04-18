# ElasticSearch


## Install Java on Ubuntu
```bash
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -qq update

echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

sudo apt-get -qq -y install oracle-java8-installer
echo 'Done';

```

## Install ElasticSearch

* Download the Official [ElasticSearch](https://www.elastic.co/downloads/elasticsearch) Distribution
	- [Elasticsearch 2.3.1](https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.1/elasticsearch-2.3.1.tar.gz)

* Unzip platform files: 
	- ```tar -zxvf elasticsearch-2.3.1.tar.gz```


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
