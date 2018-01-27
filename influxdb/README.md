# InfluxDB

### Run InfluxDB in Docker

```
docker run -it --rm --name="influxdb" -p 8086:8086 -v influxdb:/var/lib/influxdb influxdb
```

### Measure query execution time using CLI

```bash
time influx -host '192.168.33.100' -database 'mydb' -execute 'select * from memory_stats LIMIT 100'
```

