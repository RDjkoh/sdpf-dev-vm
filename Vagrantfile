# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 4096
	vb.gui = false
  end
  
  config.ssh.username = "ubuntu"
  
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
	# add/update repos
	# oracle java
	sudo -E add-apt-repository ppa:webupd8team/java
	
	# docker
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo -E add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	
	# nodejs
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash
	
	# update package repo
	sudo -E apt-get -qq update
	
	# agree to java license
	echo debconf shared/accepted-oracle-license-v1-1 select true | \
      sudo -E /usr/bin/debconf-set-selections
    echo debconf shared/accepted-oracle-license-v1-1 seen true | \
      sudo -E /usr/bin/debconf-set-selections
    sudo mkdir -p /var/cache/oracle-jdk8-installer
    echo verbose=off >> /var/cache/oracle-jdk8-installer/wgetrc
	# install java
    sudo -E apt-get -qq install -y oracle-java8-installer
    sudo ln --force -s /usr/lib/jvm/java-8-oracle/ /usr/lib/jvm/default-java
	# set JAVA_HOME
	export JAVA_HOME=/usr/lib/jvm/java-8-oracle
    export PATHADD=$JAVA_HOME/bin
    export PATH=$PATH:$PATHADD
  
    # install docker
	apt-cache policy docker-ce
	sudo -E apt-get -qq install -y docker-ce
	sudo usermod -aG docker ubuntu
	
	# install maven
	sudo -E apt-get -qq install -y maven
	
	# install git
	sudo -E apt-get -qq install -y git
	
	# install nodejs
    sudo -E apt-get -qq install -y nodejs
	
	# install awscli
	sudo -E apt-get -qq install -y awscli
    
	# install npm, aws sam local
	# npm environments wouldn't initialize in vagrant provisioning
	# npm install commands wouldn't run in the env setting script, so...
	/bin/bash /vagrant/config/npm.sh
	npm install npm --global
	npm install -g aws-sam-local
	
  SHELL
end
