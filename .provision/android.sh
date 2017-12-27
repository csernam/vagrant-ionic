# !/bin/bash

ANDROID_SDK_FILENAME=sdk-tools-linux-3859397.zip
ANDROID_SDK=https://dl.google.com/android/repository/$ANDROID_SDK_FILENAME

GRADLE_FILENAME=gradle-4.4.1-bin.zip
GRADLE=https://services.gradle.org/distributions/$GRADLE_FILENAME

sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk ant expect

wget $GRADLE
sudo mkdir /opt/gradle
sudo unzip -d /opt/gradle $GRADLE_FILENAME
sudo ln -sf /opt/gradle/gradle-4.4.1/bin/gradle /usr/bin/gradle

wget $ANDROID_SDK
unzip $ANDROID_SDK_FILENAME -d ~/android-sdk-linux
sudo chown -R vagrant ~/android-sdk-linux/

echo "ANDROID_HOME=~/android-sdk-linux" >> /home/vagrant/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/" >> /home/vagrant/.bashrc
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> /home/vagrant/.bashrc
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

expect -c '
set timeout -1   ;
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --no-ui --use-sdk-wrapper --filter tools,platform-tools,build-tools-26.0.0 
expect {
    "Accept?" { exp_send "y\r" ; exp_continue }
    eof
}
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u -a --no-ui --use-sdk-wrapper --filter "android-26"
expect {
    "Accept?" { exp_send "y\r" ; exp_continue }
    eof
}
'
echo "*************************************************************************"
echo "***********************INSTALL COMPLETE**********************************"
echo "*************************************************************************"
echo "*                    Run vagrant ssh to start"
echo "*              Run exit and vagrant halt to shutdown"
echo "*************************************************************************"
echo "*                 Based on periphore/ionic-box                          *"
echo "*************************************************************************"
