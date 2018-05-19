# InfluxDB

### Change timestamp format

```
# human friendly format
precision rfc3339
```

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

### Run Kapacitor in Docker
```
docker run -it -d --rm --name="kapacitor" -p 9092:9092 \
-v influxdb:/var/lib/influxdb \
kapacitor
```

```
docker run -it -d --rm --name="kapacitor" -p 9092:9092 \
-v $(pwd)/kapacitor.conf:/etc/kapacitor/kapacitor.conf:ro \
-v influxdb:/var/lib/influxdb \
kapacitor
```

### Utility scripts for InfluxDB

```
alias influx-query='_query() { curl -s -k -XPOST http://localhost:8086/query --data-urlencode "$1" | jq; }; _query'
alias influx-write='_write() { curl -s -k -XPOST http://localhost:8086/write?$1 --data-binary "$2" | jq; }; _write'
```




```
alias influx-write="curl -s -k -XPOST http://localhost:8086/write?$1 --data-binary $2"
```

### Measure query execution time using CLI

```bash
time influx -host '192.168.33.100' -database 'mydb' -execute 'select * from memory_stats LIMIT 100'
```

