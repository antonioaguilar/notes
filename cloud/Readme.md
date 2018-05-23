# Cloud Platforms

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

## Cloud Foundry

#### Install Cloud Foundry CLI (via Brew)

```
brew update
brew tap cloudfoundry/tap
brew install cf-cli
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
