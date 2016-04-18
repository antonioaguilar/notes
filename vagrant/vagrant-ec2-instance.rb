# Custom Vagrant file to provision Amazon EC2 instances
# Requires the vagrant aws plugin
# To provision the instance, edit the 'bootstrap.sh'

Vagrant.configure("2") do |config|

  config.vm.provision :shell, path: "https://raw.githubusercontent.com/antonioaguilar/aws-scripts/master/vagrant/script-elasticsearch.sh"

  # This configuration is for our local box, when we use virtualbox as the provider
  config.vm.provider :virtualbox do |vb, override|
    override.vm.box = "precise64"
    override.vm.box_url = "http://files.vagrantup.com/precise64.box"
  end

  # This configuration is for our EC2 instance
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = "123456789123456789"
    aws.secret_access_key = "123456789123456789123456789"
    aws.keypair_name = "your-key"

    aws.tags = {
      'Name' => 'Vagrant',
    }

    aws.availability_zone = "eu-west-1b"
    aws.region = "eu-west-1"

    # configure the type of instance (e.g. reserved, spot, etc)
    aws.region_config "eu-west-1" do |region|
      region.spot_instance = true
      region.spot_max_price = "0.0032"
    end


    aws.ami = "ami-3907d64e"
    aws.instance_type = "t1.micro"
    aws.security_groups = ["your-security-group"]

    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = "~/.ssh/your-key.pem"
  end
end
