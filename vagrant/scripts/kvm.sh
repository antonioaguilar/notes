#!/bin/bash

# Install KVM and QEMU

apt-get -y update

apt-get install -y cpu-checker

egrep -c '(vmx|svm)' /proc/cpuinfo

# check if KVM can run on virtual machine
# kvm-ok

apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

# only members of the libvirt and kvm user groups can run virtual machines
adduser vagrant libvirt
adduser vagrant kvm

# verify installation
virsh list --all

COMMENT='
qemu-system-x86_64 \
    -enable-kvm \
    -cpu host \
    -m 1024 \
    -netdev user \
    -nographic \
    -cdrom alpine-virt-3.16.1-x86_64.iso

-smp cores=2,threads=4 \
-drive file=alpine.qcow2,media=disk \
'
