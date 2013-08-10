# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "search_oceana"
  config.vm.network :forwarded_port, guest: 4568, host: 12310

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :tz => "Asia/Tokyo",
    }
    chef.add_recipe "timezone-ii"
  end
  config.berkshelf.enabled = true
end
