# InfluxDB

### Measure query execution time using CLI

```bash
time influx -host '192.168.33.100' -database 'mydb' -execute 'select * from memory_stats LIMIT 100'
```

