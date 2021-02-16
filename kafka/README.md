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

### Monitor Kafka JMX metrics

```bash
# get jmxterm cli from: https://docs.cyclopsgroup.org/jmxterm
java -jar jmxterm-1.0.2-uber.jar -h 


java -jar jmxterm-1.0.2-uber.jar
Delete /home/vagrant/.jmxterm_history if you encounter error right after launching me.
Welcome to JMX terminal. Type "help" for available commands.
$> open localhost:<JMX port>

$> beans # list all the available beans

$>info -b kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec

$>bean kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec
#bean is set to kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec

$>get *
#mbean = kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec:
Count = 15;

FifteenMinuteRate = 6.264897339698675E-4;

RateUnit = SECONDS;

MeanRate = 0.0034354099437672652;

OneMinuteRate = 1.444972454140978E-18;

FiveMinuteRate = 8.631314160226716E-6;

EventType = messages;

$>get FifteenMinuteRate
#mbean = kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec:
FifteenMinuteRate = 6.09326720126523E-4;
```
