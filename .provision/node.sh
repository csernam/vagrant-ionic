# !/bin/bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile

nvm install node
nvm install 8
nvm alias default 8
npm i -g ionic cordova

