# Kafka

## Using Docker Compose

Create a docker compose file ```broker.yml` using the configuration below:

```yml
# kafka broker without zookeeper (using KRaft)
services:
  kafka:
    image: "bitnami/kafka:latest"
    container_name: kafka-broker
    environment:
      - KAFKA_ENABLE_KRAFT=yes
      - ALLOW_PLAINTEXT_LISTENER=yes
      - KAFKA_CFG_NODE_ID=1
      - KAFKA_CFG_PROCESS_ROLES=broker,controller
      - KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER
      - KAFKA_CFG_INTER_BROKER_LISTENER_NAME=CLIENT
      - KAFKA_CFG_LISTENERS=CLIENT://:29092,EXTERNAL://:9092,CONTROLLER://:9093
      - KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=CONTROLLER:PLAINTEXT,CLIENT:PLAINTEXT,EXTERNAL:PLAINTEXT
      - KAFKA_CFG_ADVERTISED_LISTENERS=CLIENT://kafka:29092,EXTERNAL://localhost:9092
      - KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=1@127.0.0.1:9093
    ports:
      - "9092:9092"
volumes:
  kafka_data:
    driver: local
```

Run as:

```bash
docker-compose -f broker.yml up 
```

### Use the Kafka CLI via Docker

Configure the following aliases in ```.bashrc``:

```bash
# docker kafka scripts
export KAFKAJS_NO_PARTITIONER_WARNING=1
export DOCKER_CLI_HINTS=false

# kafka cli aliases
alias kafka-topics.sh="docker exec -it kafka-broker kafka-topics.sh --bootstrap-server localhost:9092"
alias kafka-console-consumer.sh="docker exec -it kafka-broker kafka-console-consumer.sh --bootstrap-server localhost:9092"
alias kafka-console-producer.sh="docker exec -it kafka-broker kafka-console-producer.sh --bootstrap-server localhost:9092"
alias kafka-delete-records.sh="docker exec -it kafka-broker kafka-delete-records.sh --bootstrap-server localhost:9092"
alias kafka-consumer-groups.sh="docker exec -it kafka-broker kafka-consumer-groups.sh --bootstrap-server localhost:9092"
alias kafka-tty-consumer.sh="docker exec -i kafka-broker kafka-console-consumer.sh --bootstrap-server localhost:9092"
alias kafka-tty-producer.sh="docker exec -i kafka-broker kafka-console-producer.sh --bootstrap-server localhost:9092"

# docker kafka functions
kafka-redirect() { kafka-tty-consumer.sh --topic $1 --from-beginning | kafka-tty-producer.sh --topic $2; }
```

Use the Kafka CLI commands as follows:

```bash
kafka-topics.sh --create --topic accounts --partitions 3

kafka-topics.sh --describe --topic accounts

kafka-topics.sh --list

kafka-topics.sh --delete --topic accounts

kafka-console-consumer.sh --topic accounts

kafka-console-consumer.sh --topic accounts --from-beginning

kafka-console-consumer.sh --topic accounts --partition 1
```

### Install using Java (outdated)

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

### Usage (needs ZooKeeper)

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
