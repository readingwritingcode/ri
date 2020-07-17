#prerequisites
##docker v1.18+
#see: https://docs.docker.com/engine/install/ubuntu/
##Docker Compose v1.23+
#see https://docs.docker.com/compose/install/
#nodejs and npm
##see:https://github.com/nodesource/distributions/blob/master/README.md
#set up enought virtual memori for elastich
#firts, see how much memory have the system
cat /etc/sysctl.conf | grep -i vm.max_map_count
## if result is: "vm.max_map_count=2621144"; else do:
echo "vm.max_map_count=2621144" >> /etc/sysctl.conf
source /etc/sysctl.conf
##python requeriments
#test python version work on the system
python3 --version #ouput maybe 3.X if not same 3.6, do:
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.6 # see:https://python-guide-es.readthedocs.io/es/latest/starting/install3/linux.html
#https://www.tecmint.com/install-python-in-ubuntu/
which python3.6 #/path/to/binarie/python3.6
pip3 -version # ouput maybe 1x.x or 2x.x if not, do:
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py #see:https://pip.pypa.io/en/stable/installing/
pip --version
##install virtualenv
pip install virtualenv 
##create virtualenv, with python3.6
virtualenv --python=/usr/bin/python3.6 venvname
cd venvname
source /bin/activate
pip install build-essential python3.6-dev
#install inside virtual env cookiecutter:
pip install --user cookiecutter #see https://cookiecutter.readthedocs.io/en/1.7.2/installation.html
cookiecutter gh:inveniosoftware/cookiecutter-invenio-instance --checkout v3.3
#The cookiecutter initialisation procedure will prompt you with a series of questions aiming to customise your new instance, e.g. the name of your application.

#note: At the end of the initialisation, you will be warned to manually change some parts of the generated code marked with TODOs. These will be covered in the Final steps section of this quick start guide.

cd my-site #my-site is th firts promt element after execute cookiecuter installation, remember it
docker-compose up -d # this maybe promt errors asociated with ports related with postgresql or other software related to images, for fixed do:
sudo ss -lptn 'sport = :5432' # or the num of the port reported in the error; see: https://stackoverflow.com/questions/38249434/docker-postgres-failed-to-bind-tcp-0-0-0-05432-address-already-in-use
kill <pid>
#run many times as necesary
#run again
docker-compose up -d #output must be everything ok
#run installation scripts. if python are configured correctly never bad be happened
./scripts/bootstrap # remember that we are inside my-syte directory.build app, frontend and resolve dependencies
./scrips/setup
./script/server # this launch app in http:/127.0.0.1:5000/

#this is all for install basic invenio interface





