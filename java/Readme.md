# Java Notes

## Install Java on Ubuntu using PPA and apt-get
```bash

# Install the Java 8 via PPA method
# Further info: http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
# NB: These packages provide Oracle Java JDK, which includes Java JDK, JRE and the Java browser plugin.
# And the webupd8team/java PPA contains only these installers, which simply connect to Oracle Java download site and install the latest JDK.s
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -qq update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -qq -y install oracle-java8-installer

```

## Check which specific Java version is installed in Mac OS

Use the ```java_home``` command in the terminal:
```
/usr/libexec/java_home -V

/usr/libexec/java_home
```

## Configure Java SDK in Mac OS (El Capitan)

Add the following variables to your ```.bash_profile```:

```
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=${JAVA_HOME}/bin:$PATH
```

## Remove Java from Mac OS

Copy and paste the following commands in the terminal:
```
sudo rm -fr /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin
sudo rm -fr /Library/PreferencePanes/JavaControlPanel.prefpane
```
