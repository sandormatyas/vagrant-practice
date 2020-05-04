Vagrant.configure("2") do |config| config.vm.box = "ubuntu/bionic64" 
    config.vm.provision "file", source: "./id_rsa.pub", destination: "ssh-keys/"
    config.vm.provision "shell", path: "provision.sh"
end
