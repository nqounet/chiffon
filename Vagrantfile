# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "chiffon"
  config.vm.box_url = "https://www.dropbox.com/s/i1t30g4f1sljxxo/chiffon"
  config.vm.network :forwarded_port, guest: 4568, host: 12310
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :tz => "Asia/Tokyo",
      :ntp => {
        :servers => ["ntp.nict.jp", "ntp.jst.mfeed.ad.jp"]
      }
    }
    chef.add_recipe "timezone-ii"
    chef.add_recipe "ntp"
  end
  config.berkshelf.enabled = true
end
