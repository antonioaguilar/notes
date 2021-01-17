# Linux Stuff

### Assorted linux commands 

Find the max number of open files in your system:

```bash
sudo service --status-all

sudo ls /etc/init.d
 
sudo systemctl --failedsystemctl --failed

sudo netstat -tap | grep LISTEN

sudo smem -tap 

sudo smem -ap 

sudo smem -w

# pacman search for package
pacman -Ss net-tools

sudo pactman -S net-tools
```

### Change the booting Linux kernel 

Find the list of configured Kernels in GRUB:
```
awk '/menuentry/ && /class/ {count++; print count-1"****"$0 }' /boot/grub/grub.cfg
```

Edit the `/etc/default/grub` via `sed`. Note: replace the X with the number you got from the awk command above:

```
sudo sed -i  's/GRUB_DEFAULT=0/GRUB_DEFAULT=X/g' /etc/default/grub; sudo update-grub
```


### Linux Optimization

### Get disk space (find largest files)

```
# install the program
sudo apt-get install ncdu

# scan the home folder
ncdu ~

# scan the disk remotely
ssh -C user@system.com ncdu -o- / | ./ncdu -f-
```

### Configuring ```ulimit``` on Ubuntu

Find the max number of open files in your system:

```
cat /proc/sys/fs/file-max
```

Check the current file limit:

```
ulimit -n
```

*Note: ```systemd``` has a standard limit of 1024 and regardless of what you set at the system level the ```systemd``` level will always take precedence. The fix for this is to change the systemd open file limit by editing ```/etc/systemd/system.conf```*


Edit ```sudo nano /etc/systemd/system.conf``` and add:

```
DefaultLimitNOFILE=65000
```

Edit ```sudo nano /etc/security/limits.conf``` and add:

```
*    soft nofile 65000
*    hard nofile 65000
root soft nofile 65000
root hard nofile 65000
```

Edit ```sudo nano /etc/pam.d/common-session``` and add:

```
session required pam_limits.so
```

Edit ```sudo nano /etc/pam.d/common-session-noninteractive``` and add:

```
session required pam_limits.so
```

Run the following command:

```
sudo sysctl -w net.core.somaxconn=65000
```

Edit ```sudo nano /etc/sysctl.conf``` and add:

```
vm.overcommit_memory = 1
```

Logout user or reboot system for settings to take effect.

Edit ```nginx.conf``` and increase the number of network connections:

```
events {
    worker_connections 65000;
    use epoll;
    multi_accept on;
}
```

### Create ASCII text banner

```
$ sudo apt-get install -f figlet
```

```
$ showfigfonts

$ figlet "Antonio"
    _          _              _
   / \   _ __ | |_ ___  _ __ (_) ___
  / _ \ | '_ \| __/ _ \| '_ \| |/ _ \
 / ___ \| | | | || (_) | | | | | (_) |
/_/   \_\_| |_|\__\___/|_| |_|_|\___/

$ figlet -f block "Antonio"

  _|_|                _|                          _|
_|    _|  _|_|_|    _|_|_|_|    _|_|    _|_|_|          _|_|
_|_|_|_|  _|    _|    _|      _|    _|  _|    _|  _|  _|    _|
_|    _|  _|    _|    _|      _|    _|  _|    _|  _|  _|    _|
_|    _|  _|    _|      _|_|    _|_|    _|    _|  _|    _|_|

```

### Get the hostname

```
hostname --fqdn
```

```
hostname -i
```
