# Cassandra DB notes

### Install Cassandra via Docker

```
# pull the latest image
docker pull cassandra

# run the container
docker run -it --rm -d --name=cassy -p 9042:9042 -v cassy:/var/lib/cassandra cassandra

# connect to cassandra via cqlsh
docker run -it --rm --link cassy:cassandra cassandra cqlsh cassandra
```

### CQL commands

```
# list all keyspaces
DESCRIBE KEYSPACES;

# create keyspace "customers"
CREATE KEYSPACE customers
with replication = {'class':'SimpleStrategy','replication_factor':1};

```
