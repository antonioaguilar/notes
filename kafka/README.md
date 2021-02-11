# Kafka

### Install 

```bash
# install Java
sudo apt-get install default-jre

# install ZooKeeper, it should run on port 2181
sudo apt-get install zookeeperd

# start/stop/restart zookeeper
sudo bin/zkServer.sh start|stop|restart

# download and install Kafka
mkdir -p ~/kafka && cd ~/kafka

wget https://downloads.apache.org/kafka/2.7.0/kafka_2.13-2.7.0.tgz

# untar the kafka binaries in the same folder
tar zxvf kafka_2.13-2.7.0.tgz --strip=1

# start Kafka (single node)
~/kafka/bin/kafka-server-start.sh ~/kafka/config/server.properties

# stop Kafka
~/kafka/bin/kafka-server-stop.sh ~/kafka/config/server.properties
```

### Usage

```bash
# create topic
./bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic topic-0

# delete topic
./bin/kafka-topics.sh --delete --zookeeper localhost:2181 --topic topic-0

# list topics
./bin/kafka-topics.sh --list --zookeeper localhost:2181

# produce some messages
./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic topic-0

# receive some messages
./bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic topic-0 --from-beginning

# get topic details
./bin/kafka-topics.sh --bootstrap-server=localhost:9092 --describe --topic topic-0
```
