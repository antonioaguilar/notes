# Ubuntu

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

# KVM should be now installed and ready
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


