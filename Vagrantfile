
Vagrant.configure("2") do |config|
  config.vm.hostname = "my-app"
  config.package.name = "my-app.box"

  # Base box
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.synced_folder "srv/", "/srv/"
  config.vm.network :forwarded_port, guest: 80, host: 3000

  config.vm.provision :salt do |salt|
    salt.minion_config = "srv/minion"
    salt.run_highstate = true
    salt.verbose = true
  end

end
