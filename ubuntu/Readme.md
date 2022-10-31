# Ubuntu

## Disable IPv6 in Ubuntu

Open /etc/sysctl.conf and add following lines.

```bash
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
```

Then run `sudo sysctl -p`

```bash
cat /proc/sys/net/ipv6/conf/all/disable_ipv6
```

If it returns 0, then ipv6 is not completely disabled. May be you need to reboot OS which is something not desired on server.

So just run following command to disable manually.

```bash
echo "1" > /proc/sys/net/ipv6/conf/all/disable_ipv6
You can test again to see if its disabled.
```

## Install KVM

```bash
# check whether the Ubuntu system supports virtualization
# outcome greater than 0 implies that virtualization is supported
egrep -c '(vmx|svm)' /proc/cpuinfo

# install cpu check tools
sudo apt-get update
sudo apt-get install -y cpu-checker msr-tools

# check if system support virtualizarion, should output:
# INFO: /dev/kvm exists
# KVM acceleration can be used
sudo kvm-ok

# install KVM and related tools
sudo apt-get install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager

# check if the virtualization daemon, should say: Active: active (running) ...
sudo systemctl status libvirtd

# enable the virtualization deemon on boot
sudo systemctl enable --now libvirtd

# check if the KVM modules are loaded
# for intel processors we should see: "kvm_intel" else "kvm_amd" for AMD processors
lsmod | grep -i kvm

# configure KVM permissions
sudo chmod 666 /dev/kvm

# KVM should be now installed and ready
```

## Install Linux Alpine Distro in Qemu

```bash
# download the latest Alpine image
wget https://dl-cdn.alpinelinux.org/alpine/v3.12/releases/x86_64/alpine-standard-3.12.3-x86_64.iso

# create a disk image if you want to install Alpine Linux
qemu-img create -f qcow2 alpine.qcow2 8G

# start QEMU and load Alpine as an ISO image and install on the disk image created
# tip: can use "-nographic" or "-curses"
qemu-system-x86_64 -nographic -enable-kvm -m 512 -nic user -boot d -cdrom alpine-standard-3.12.3-x86_64.iso -hda alpine.qcow2

qemu-system-x86_64 -curses -enable-kvm -m 512 -nic user -boot d -cdrom alpine-virt-3.12.3-x86_64.iso -hda alpine.qcow2

```

## Configure dnsmasq

Configure `*` wildcard domains:

```
# create file 
~/.dnsmasq/dnsmasq.conf

# add hosts
address=/.example.com/192.168.50.6

# this will match all *.example.com domains
```


