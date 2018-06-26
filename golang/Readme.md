# Golang Notes

## Configure Go to use HTTP proxy 

Go programs understand environment variables `http_proxy` and `no_proxy`, but that's not enough because `go get` uses source control managers for retrieving code. So you have to set HTTP proxy settings for `git`:

```
git config --global http.proxy http://proxy.mycompany:80
```

You can set these environment variables in your `bash_profile` or `.bashrc`, but if you want to limit their usage to go, you can run it like this:

```
http_proxy=http://proxy.mycompany:80 go get code.google.com/p/go.crypto/bcrypt
```

If that's what you always want, set this alias to avoid typing proxy part every time:

```
alias go='http_proxy=http://proxy.mycompany:80 go'
```

From now on you can use go normally, but it uses your HTTP proxy.

## Go enviroment variables

```
# if using gvm
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin

```

## Cross-compilation of Go programs

```
# compiles a linux executable
export GOOS=linux; export GOARCH=amd64; go build
```

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
  - `gvm install go1.10.1 -B`
- Set it as default version:
  - `gvm use go1.10.1 --default`
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
  - `gvm install go1.10.1 -B`
- Set it as default version:
  - `gvm use go1.10.1 --default`
- Check if go is installed correctly:
  - `gvm list`
  - `go version` or `go help`
  - `go env`
  


## Go code snippets

```
// GetLocalIP returns the non loopback local IP of the host
func GetLocalIP() string {
    addrs, err := net.InterfaceAddrs()
    if err != nil {
        return ""
    }
    for _, address := range addrs {
        // check the address type and if it is not a loopback the display it
        if ipnet, ok := address.(*net.IPNet); ok && !ipnet.IP.IsLoopback() {
            if ipnet.IP.To4() != nil {
                return ipnet.IP.String()
            }
        }
    }
    return ""
}
```
