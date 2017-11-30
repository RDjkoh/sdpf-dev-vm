## sdpf-dev-vm
Ubuntu VM defined by Vagrant. Installs Java, Maven, Git, Docker, node.js, npm, AWS CLI and AWS SAM Local on an Ubuntu image. 
### Installation
#### Prerequisites 
[Vagrant](https://www.vagrantup.com/docs/installation/) | [VirtualBox](https://www.virtualbox.org/) | [Git](https://git-scm.com/download/) (Use Git Bash on Windows hosts) 

#### Usage
Provision the VM. Takes about 10 minutes, 15-20 if you don't have the base Ubuntu image. Run the following command at the root of the repo. 
```bash
vagrant up
```
After the VM finishes provisoning, SSH into VM.
```bash
vagrant ssh
```
In the VM, validate stack.
```bash
# Oracle Java 
java -version
# Maven
mvn -v
# Git
git --version
# Docker
docker info
# node.js
node -v
# npm
npm -v
# AWS CLI
aws --version
# AWS SAM Local
sam -v
```
Exiting the SSH session will take you back to the host. From there, you can stop the VM. This closes the VM but does not delete it. 
```bash
vagrant halt
```
You can delete the VM and its resources by running this instead. 
```bash
vagrant destroy
```
The repo folder mounts to /vagrant/ on the VM. ie. the config/ folder of this repo will be at /vagrant/config/. 