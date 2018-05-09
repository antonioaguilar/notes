# Docker CE

### Docker stop with glob patterns

```bash
# this will stop containers called: client-01, client-02 and so on ...
docker stop $(docker ps -q -f "name=client*")
```

### Remove all untagged images

``` bash
# better way!
docker system prune -f
```

``` bash
# removes all untagged <none> images
docker rmi -f $(docker images | grep "^<none>" | awk '{print $3}');
```

### Docker Stats with Container Names

```bash
docker stats $(docker ps --format '{{.Names}}')

# setup as alias
alias ds='docker stats $(docker ps --format {{.Names}})'
```

### Disable the default Docker proxy service

Create a file named ```/etc/docker/daemon.json``` if it does not exist, and add the "userland-proxy": false setting.

```json
{
  "userland-proxy": false
}
```

After saving the file, restart the daemon using:

```
sudo service docker restart
```

>_Note: Disabling the default docker proxy service allows faster port mapping (when using large port ranges in containers)._

### Import / Export container images

```
#for not running docker, use save:
docker save <dockernameortag> | gzip > mycontainer.tgz

#for running or paused docker, use export:
docker export <dockernameortag> | gzip > mycontainer.tgz

#load
gunzip -c mycontainer.tgz | docker load
```

### Install Docker CE on Ubuntu

```
sudo apt-get update

sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

curl -kfsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install -y docker-ce

# post-installation steps
sudo groupadd docker

sudo usermod -aG docker $USER

# edit grub config
sudo nano /etc/default/grub

# add this line
GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"

# update grub
sudo update-grub

```

### Start the Docker daemon

```
# using systemctl
sudo systemctl start docker

# using a service
sudo service docker start
```

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
