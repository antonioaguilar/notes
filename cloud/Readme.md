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

#### Useful docs and guides

- [Using Docker in Cloud Foundry](https://docs.cloudfoundry.org/adminguide/docker.html)
-

#### Deploying NodeJS apps

* Adding `.cfignore` with `node_modules/` fixes several issues when deploying NodeJS apps in CF
