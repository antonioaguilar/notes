# Cloud Platforms

## Cloud Foundry

#### Install the Cloud Foundry CLI

```
# install on Mac OS
brew update
brew tap cloudfoundry/tap
brew install cf-cli

# install on Linux
curl -s -k -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | \
    tar -zx && \
    mv cf /usr/local/bin
    
# install the community repo and plugins
cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org && \
    cf install-plugin -f -r CF-Community "report-users" && \
    cf install-plugin -f -r CF-Community "copyenv" && \
    cf install-plugin -f -r CF-Community "top" && \
    cf install-plugin -f -r CF-Community "autopilot" && \
    cf install-plugin -f -r CF-Community "blue-green-deploy" && \
    cf install-plugin -f -r CF-Community "network-policy" && \
    cf install-plugin -f -r CF-Community "Targets" && \
    cf install-plugin -f -r CF-Community "deploy" && \
    cf install-plugin -f -r CF-Community "copy" && \
    cf install-plugin -f -r CF-Community "whoami-plugin" && \
    cf install-plugin -f -r CF-Community "sync" && \
    cf install-plugin -f -r CF-Community "do-all" && \
    cf install-plugin -f -r CF-Community "get-events" && \
    cf install-plugin -f -r CF-Community "docker-usage" && \
    cf install-plugin -f -r CF-Community "antifreeze" && \
    cf install-plugin -f -r CF-Community "wildcard_plugin"
```

### Updating a buildpack

```
git clone https://github.com/cloudfoundry/nodejs-buildpack.git

cd nodejs-buildpack

brew install direnv

source .envrc

(cd src/nodejs/vendor/github.com/cloudfoundry/libbuildpack/packager/buildpack-packager && go install)

# this creates a zip file (nodejs_buildpack-v1.6.27.zip)
buildpack-packager build -any-stack

cf update-buildpack nodejs_buildpack -p nodejs_buildpack-v1.6.27.zip
```

### Creating users and roles in CF

Note: In these examples the ORG: `pcfdev-org` and SPACE: `pcfdev-space`

```
# creates user 'Alice' with password 'wonderland'
cf create-user alice wonderland
 
# set the role developer 
cf set-space-role alice pcfdev-org pcfdev-space "SpaceDeveloper"

# change the password for user 'Alice'
cf passwd

# delete an user
cf delete-user alice -f

# view all users in the ORG and SPACE
cf space-users pcfdev-org pcfdev-space
```

#### Useful docs and guides

- [Using Docker in Cloud Foundry](https://docs.cloudfoundry.org/adminguide/docker.html)

#### Deploying NodeJS apps

* Adding `.cfignore` with `node_modules/` fixes several issues when deploying NodeJS apps in CF




## OpenShift (RedHat)

#### Install OpenShift CLI

```
brew update
brew install openshift-cli
```

#### Install local OpenShift instance (minishift)

```
brew update
brew cask install minishift

# Setting Up Minishift to Use VirtualBox (permanently)
minishift config set vm-driver virtualbox

# Setting Up Minishift to Use VirtualBox (temporarily)
minishift start --vm-driver virtualbox
```

#### User account management

```
# login as system admin
oc login -u system:admin

# list users
oc get identity

# location of cluster (master) config file
/var/lib/origin/openshift.local.config/master/master-config.yaml

# install apache utils for htpasswd tool
sudo apt-get install -y apache2-utils
```
