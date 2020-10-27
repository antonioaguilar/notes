# VirtualBox tips

### List virtual machines on system

```
# power off vm
VBoxManage controlvm vm-name poweroff

# List all available virtual machines
VBoxManage list vms

# List all running available virtual machines
VBoxManage list runningvms

# Clear unregistered or inaccessible virtual machines
# VBoxManage unregistervm <uuid|vmname> [--delete]
VBoxManage unregistervm {7aa11d6c-0fd2-43a9-6856-01c453712b7e}
```

### Clear all unused virtual media disks
```
vboxmanage setextradata global "GUI/RecentListCD"
```

### Configure the default VirtualBox images folder

Get the current folder: 

```
vboxmanage list systemproperties | grep folder
```

Change the folder: 

```
vboxmanage setproperty machinefolder /path/to/directory/
```
> This will not move already created VMs, it will affect only VMs which are created after the `machinefolder` property has been set.

### Remove virtualbox network adapters (host and NAT only)

```
VBoxManage hostonlyif remove vboxnet0
```

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

# create the VM instance
vm createvm --name "owc-release" --register

# configure VM settings
vm modifyvm "owc-release" --memory 2048 --acpi on --cpus 4 --vrde on --boot1 dvd --nic1 bridged --bridgeadapter1 eno1 --cableconnected1 on

# create hard drive
vm createhd --filename ~/VirtualBox\ VMs/owc-release/owc-release.vdi --size 20000

# select the controller
vm storagectl "owc-release" --name "IDE Controller" --add ide

# attach created drive
vm storageattach "owc-release" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium ~/VirtualBox\ VMs/owc-release/owc-release.vdi

# attach ISO image
vm storageattach "owc-release" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium ~/ubuntu-16.04.1-server-amd64.iso

```
