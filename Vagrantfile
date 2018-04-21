Vagrant.configure(2) do |config|
  config.vm.box = 'windows-2016-amd64'

  config.vm.provider 'virtualbox' do |vb|
    vb.linked_clone = true
    vb.memory = 4096
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
  config.vm.provision "shell", path: "ps.ps1", args: "provision-base.ps1"
  config.vm.provision "shell", path: "ps.ps1", args: "provision-unity.ps1"
end
