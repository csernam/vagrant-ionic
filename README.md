# vagrant-ionic
Vagrant box for Ionic developers

# Introduction
Instead of building a virtual machine from scratch, which would be a slow and tedious process, Vagrant uses a base image to quickly clone a virtual machine.
These base images are known as "boxes" in Vagrant. This is a prepackaged development environment to work with your Ionic projects.

# Installed software

- Ubuntu 14.04 64 LTS (Trusty Tahr)
- JDK 8
- Ionic
- Cordova
- Android SDK
- Gradle
- Node
- NPM
- ...

# How to run
> Setup prerequisites:

>- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
>- Install [Vagrant](https://www.vagrantup.com/)
>- Install vagrant-vbguest plugin `vagrant plugin install vagrant-vbguest`
>- Install vagrant fsnotify plugin `vagrant plugin install vagrant-fsnotify`

>Setup Vagrant box:

>1. `git clone https://github.com/csernam/vagrant-ionic`
>2. `vagrant up`
>3. `vagrant ssh`

# Tips & Issues
### Host machine
This box has been tested only in Windows 10 and VirtualBox. It's recommended to run vagrant with Administration privileges.

### node_modules issues
Having Windows as a host system, some errors could be raised during npm install in your Ionic project directory. These errors are related to the fact that you can't translate symlinks to a Windows shared folder. After many attempts, I managed to install it using yarn (you can try with `npm i --no-bin-links` also):
```javascript
npm install -g yarn
rm -rf node_modules
yarn install --no-bin-links
npm rebuild node-sass
```

### Live-reload
Although this box is configured to share your vagrant folder with the guest SO, live-reloading is not working due to some issue related to filesystem changes notifications in VirtualBox. To get this live-reload I decided to install [fsnotify](https://github.com/adrienkohlbecker/vagrant-fsnotify) plugin.
Just open a new console and run:
```javascript
vagrant fsnotify
```

### Ionic serve
After `ionic serve`, the browser is not automatic launched on the Vagrant box. Access your box at http://192.168.2.2 opening your host browser.
