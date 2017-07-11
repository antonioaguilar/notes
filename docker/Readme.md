# Docker Engine & Docker Compose

### Enable Docker Remote API

You need to enable Docker Remote API. To do so you need to:

* Include this line: ```DOCKER_OPTS='-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock'``` to your ```/etc/default/docker``` config file in Ubuntu
* Restart the Docker service using: ```sudo service docker restart```
* Open your browser and verify you can connect to http://localhost:2375/_ping

### Running Docker in Ubuntu

When running Docker in Ubuntu, it is neccesary add users to docker group:

```
sudo usermod -aG docker $(whoami)
```

### Get the size of all containers, images and volumes

```
docker system df -v
```

### Run and auto remove a container

```
docker run -it --privileged --rm --net=host <container-name>
```

### Connect to a container via ```bash```:

```
docker exec -it <container-name> bash
```

### Stop all running containers

```bash
# stop all containers
docker stop $(docker ps -aq)
```

### Remove all containers

```bash
# remove all containers
docker rm $(docker ps -a -q)
```

### Remove all images

```bash
# remove all images
docker rmi $(docker images -q)
```

### Remove all images and containers

```bash
# remove everything
docker rm $(docker ps -a -q); docker rmi $(docker images -q);
```

### Remove all untagged images

``` bash
# removes all untagged <none> images
docker rmi -f $(docker images | grep "^<none>" | awk '{print $3}');
```

### Remove previous Docker Machine installations

```bash
#!/bin/bash

# Uninstall Script

if [ "${USER}" != "root" ]; then
	echo "$0 must be run as root!"
	exit 2
fi

while true; do
  read -p "Remove all Docker Machine VMs? (Y/N): " yn
  case $yn in
    [Yy]* ) docker-machine rm -f $(docker-machine ls -q); break;;
    [Nn]* ) break;;
    * ) echo "Please answer yes or no."; exit 1;;
  esac
done

echo "Removing Applications..."
rm -rf /Applications/Docker

echo "Removing docker binaries..."
rm -f /usr/local/bin/docker
rm -f /usr/local/bin/docker-machine
rm -r /usr/local/bin/docker-machine-driver*
rm -f /usr/local/bin/docker-compose

echo "Removing boot2docker.iso"
rm -rf /usr/local/share/boot2docker

echo "Forget packages"
pkgutil --forget io.docker.pkg.docker
pkgutil --forget io.docker.pkg.dockercompose
pkgutil --forget io.docker.pkg.dockermachine
pkgutil --forget io.boot2dockeriso.pkg.boot2dockeriso

echo "All Done!"
```
