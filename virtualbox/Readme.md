# VirtualBox tips

## Install VirtualBox (Ubuntu)

Edit ```/etc/apt/sources.list``` and include the following line:

```bash
deb http://download.virtualbox.org/virtualbox/debian xenial contrib
```

Download VirtualBox public key:

```bash
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
```

```bash
sudo apt-get update
```

Install VirtualBox and the host kernel modules 

```bash
sudo apt-get install linux-headers-$(uname -r) build-essential virtualbox-5.1 dkms
```

Create a ```vboxusers``` group and include your current user <user>

```bash
sudo adduser <user> vboxusers
```

Download and install the Extension pack

```bash
wget http://download.virtualbox.org/virtualbox/5.1.8/Oracle_VM_VirtualBox_Extension_Pack-5.1.8-111374.vbox-extpack
```

```bash
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.1.8-111374.vbox-extpack
```

Add an alias to your ```~/.bashrc``` config:

```bash
alias vm='VBoxManage'
```

## Create Virtual Machine (Ubuntu)


```bash



```
