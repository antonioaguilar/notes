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
