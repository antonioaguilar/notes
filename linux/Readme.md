# Linux Performance Tips

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


Edit ````sudo nano /etc/systemd/system.conf``` and add:

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
$ figlet "Antonio"
    _          _              _
   / \   _ __ | |_ ___  _ __ (_) ___
  / _ \ | '_ \| __/ _ \| '_ \| |/ _ \
 / ___ \| | | | || (_) | | | | | (_) |
/_/   \_\_| |_|\__\___/|_| |_|_|\___/
```

### Get the hostname 

```
hostname --fqdn
```

```
hostname -i
```
