#install python versions
sudo add-apt-repository ppa:deadsnake/ppa
sudo apt update
sudo apt install python3.6
#see: https://www.tecmint.com/install-python-in-ubuntu/

#install pip3
sudo apt install python3-pip

#install pipenv
pip3 install pipenv

#export thing to path
echo "export PATH="~/.local/bin:$PATH"" >> .bashrc

#install docker v1.18+
#see: https://docs.docker.com/engine/install/ubuntu/
sudo apt-get remove docker docker-engine docker.io containerd runc

#setup the repository
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

#add Docker official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#install docker engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

#post-installation steps for linux
#configuring linux hosts to work better with Docker

#creating docker group
sudo groupadd docker

#add your user to the docker group
sudo usermod -aG docker $USER

#activate changes to group
newgrp docker

#configure docker to start on boot
#***http proxie
#diferent storage engine
#loggin driver
#docker daemon listen for connections
#remote access
#specify DNS servers for docker
#allow to the remote API through a firewall

#INSTALL DOCKER COMPOSE
#see: https://docs.docker.com/compose/install/

#download the current stable version of docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

#INSTALL NODE
#SEE: https://github.com/nodesource/distributions/blob/master/README.md#debinstall
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

#enougth virtual memory
sudo nano /etc/sysctl.conf
#set: vm.max_map_count=262144
#install cokiecutter
pip install --user cookiecutter

#create folder for the proyect
mkdir my-site
cd my-site

#install especific python version inside
pipenv install python 3.6

# RUN COOKIE CUTTER INSIDE
cookiecutter gh:inveniosoftware/cookiecutter-invenio-instance --checkout v3.3

#activate virtual environment for manage dependencies
pipenv shell

#install dependencies manager
sudo apt-get install python3.6-dev

#activate scripts
./scripts/bootstrap

#build appc
./scripts/setup

#launch app
./scripts/server