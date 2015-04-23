# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :vector do |node|
    bridge = ENV['VAGRANT_BRIDGE']
    bridge ||= 'eth0'

    env  = ENV['PUPPET_ENV']
    env ||= 'dev'

    node.vm.box = 'ubuntu-14.10_puppet-3.7.3' 
    node.vm.network :public_network, :bridge => bridge
    node.vm.hostname = 'vector.local'
  
    node.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
    end

    node.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'manifests'
      puppet.manifest_file  = 'default.pp'
      puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment=#{env}"
    end
  end

end
