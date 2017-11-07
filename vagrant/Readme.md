# Vagrant configuration

## Create multiple Vagrant machines

Vagrantfile: 
```bash
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # this will create a range of vagrant machines from 11 to 15 (5 total)
  (11..15).each do |i|
    config.vm.define "vexo-#{i}" do |machine|
      
      machine.vm.box = "minimal/xenial64"
      
      machine.vm.hostname = "vexo-#{i}"
      machine.vm.network "private_network", ip: "192.168.33.#{i}"

      machine.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"
      machine.vm.provision "shell", inline: "cat ~vagrant/.ssh/id_rsa.pub >> ~vagrant/.ssh/authorized_keys"

      # machine.vm.provision "shell", path: "script.sh"

      # machine.vm.box_check_update = false

      machine.vm.provider "virtualbox" do |vm|
        vm.name = "vexo-#{i}"
        vm.gui = false
        vm.cpus = 4
        vm.memory = "1024"
      end
    end
  end  

end
```

Include any provisioning script (```script.sh```):

```bash
#!/bin/bash

apt-get update
apt-get install -y htop tree
```

Include the vagrant hosts in the HOSTS file (```/etc/hosts```)

```bash
127.0.0.1       localhost
255.255.255.255 broadcasthost
::1             localhost

192.168.33.11   vexo-11.vexo.com
192.168.33.12   vexo-12.vexo.com
```


## Enable Remote SSH to Vagrant Box

Include this line in the ```Vagrantfile`` configuration:

```ruby
config.vm.network :forwarded_port, guest: 22, host: 2222, host_ip: "0.0.0.0", id: "ssh", auto_correct: true
```

Then access the vagrant instance using: 

```
ssh vagrant@192.168.33.11
```
