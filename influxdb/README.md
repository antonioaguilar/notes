# InfluxDB

### Run InfluxDB in Docker

```
# use default configuration
docker run -it -d --rm --name="influxdb" -p 8086:8086 -v influxdb:/var/lib/influxdb influxdb
```

```
# use extended configuration
docker run -it -d --rm --name="influxdb" -p 8086:8086 \
-v $(pwd)/influxdb.conf:/etc/influxdb/influxdb.conf:ro \
-v influxdb:/var/lib/influxdb \
influxdb
```

### Utility scripts for InfluxDB

```
alias influx-query='curl -s -k -XPOST http://localhost:8086/query --data-urlencode'
```

```
alias influx-write="curl -s -k -XPOST http://localhost:8086/write?$1 --data-binary $2"
```

### Measure query execution time using CLI

```bash
time influx -host '192.168.33.100' -database 'mydb' -execute 'select * from memory_stats LIMIT 100'
```

