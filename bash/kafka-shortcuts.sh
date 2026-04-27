# docker kafka aliases
export KAFKAJS_NO_PARTITIONER_WARNING=1
export DOCKER_CLI_HINTS=false
alias kafka-topics.sh="docker exec -it kafka-broker kafka-topics.sh --bootstrap-server localhost:9092"
alias kafka-console-consumer.sh="docker exec -it kafka-broker kafka-console-consumer.sh --bootstrap-server localhost:9092"
alias kafka-console-producer.sh="docker exec -it kafka-broker kafka-console-producer.sh --bootstrap-server localhost:9092"
alias kafka-delete-records.sh="docker exec -it kafka-broker kafka-delete-records.sh --bootstrap-server localhost:9092"
alias kafka-consumer-groups.sh="docker exec -it kafka-broker kafka-consumer-groups.sh --bootstrap-server localhost:9092"
alias kafka-tty-consumer.sh="docker exec -i kafka-broker kafka-console-consumer.sh --bootstrap-server localhost:9092"
alias kafka-tty-producer.sh="docker exec -i kafka-broker kafka-console-producer.sh --bootstrap-server localhost:9092"
alias kafka-streams-application-reset.sh="docker exec -i kafka-broker kafka-streams-application-reset.sh --bootstrap-server localhost:9092"

# docker kafka functions
kafka-redirect() { kafka-tty-consumer.sh --from-beginning --topic $1 | pv | kafka-tty-producer.sh --topic $2; }