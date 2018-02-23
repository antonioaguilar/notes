# NATS tips and tricks

This script simulates sending some data to NATS via the nats-proxy:

```bash
#!/bin/bash

# simulate sensors sending some data to NATS
while true;
do
  SENSOR_1=$(jot -r 1 1 100)
  SENSOR_2=$(jot -r 1 500 550)
  SENSOR_ID=$(openssl rand -hex 4)
  echo "Sensor ID:$SENSOR_ID"
  curl -H "Content-Type: application-json" \
  -X POST http://localhost:7070/ -d \
  '{"__subject": "SENSOR.'"$SENSOR_ID"'", "temperature": '"$SENSOR_1"', "humidity": '"$SENSOR_2"' }'
  sleep 0.5
done;
```

