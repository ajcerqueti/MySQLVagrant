# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.hostname = "mysql"
    config.vm.box = "ubuntu/wily32"
    config.vm.network :forwarded_port, guest: 3306, host: 3306, host_ip: "127.0.0.1"
    config.vm.provision :shell, :path => "bootstrap.sh"
end