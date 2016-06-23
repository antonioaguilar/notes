# Docker Engine & Docker Compose

### Remove all containers

```bash
# Remove all containers
docker rm $(docker ps -a -q)
```

### Remove all images

```bash
# Delete all images
docker rmi $(docker images -q)
```

### Remove all images and containers

```bash
#!/bin/bash
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
```


