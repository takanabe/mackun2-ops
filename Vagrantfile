# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu14_04"
  config.vm.hostname = "local.mackun2"

  # VirtualBox VM name setting
  config.vm.provider "virtualbox" do |v|
    v.name = "local.mackun2"
  end

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.data_bags_path = "./data_bags"
    chef.add_recipe "mackun2-users"
    chef.add_recipe "mackun2-hostsfile"
    chef.add_recipe "openssh"
    chef.add_recipe "mackun2-sudo"

    # Set attribute to overide sshd_config
    chef.json = {
      "openssh" => {
        "server" => {
          "permit_empty_passwords" => "yes",
          "use_p_a_m" => "no"
        }
      }
    }
  end
end
