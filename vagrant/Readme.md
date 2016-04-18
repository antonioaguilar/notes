# Vagrant configuration

## Enable Remote SSH to Vagrant Box

Include this line in the ```Vagrantfile`` configuration:

```ruby
config.vm.network :forwarded_port, guest: 22, host: 2222, host_ip: "0.0.0.0", id: "ssh", auto_correct: true
```
