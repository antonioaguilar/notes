# Golang Notes

## Install Go in Mac OS

### Install [gvm](https://github.com/moovweb/gvm)

```
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
``` 

### Install Mac OS Requirements

```
xcode-select --install
brew update
brew install mercurial
```

### Install old Go 1.4 version first

Go 1.4 version is needed by ```GVM``` to work

```
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
export CGO_ENABLED=0
```

### Install the latest version of Go

- Check the latest releases of Go: 
  - `gvm listall`
- Install the latest version (use the `-B` binary flag):
  - `gvm install go1.9.2 -B`
- Set it as default version:
  - `gvm use go1.9.2 --default`
- Check if go is installed correctly:
  - `gvm list`
  - `go version` or `go help`


# Install Go in Ubuntu

## Install [gvm](https://github.com/moovweb/gvm)

```
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
``` 

### Install required packages for gvm

```
sudo apt-get install curl git mercurial make binutils bison gcc build-essential
```

### Install old Go 1.4 version first

Go 1.4 version is needed by ```GVM``` to work

```
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
```

### Install the latest version of Go

- Check the latest releases of Go: 
  - `gvm listall`
- Install the latest version (use the `-B` binary flag):
  - `gvm install go1.9.2 -B`
- Set it as default version:
  - `gvm use go1.9.2 --default`
- Check if go is installed correctly:
  - `gvm list`
  - `go version` or `go help`
