#!/bin/bash

# install KVM and related tools
sudo apt-get install -y qemu qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

# check if the virtualization daemon, should say: Active: active (running) ...
sudo systemctl status libvirtd

# enable the virtualization deemon on boot
sudo systemctl enable --now libvirtd

# check if the KVM modules are loaded
# for intel processors we should see: "kvm_intel" else "kvm_amd" for AMD processors
lsmod | grep -i kvm

# configure KVM permissions
sudo chmod 666 /dev/kvm
