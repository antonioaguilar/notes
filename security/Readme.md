# Security

## Create SSL/X509 Self-signed Certificates

## Extract self-signed certificate from remote server

```bash
# extract certificate in PEM format
openssl s_client -connect 0.0.0.0:443 2>/dev/null </dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > cert.pem
```

### Generate key and cert using single command:

```bash
openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -sha256 -keyout key.pem -out cert.pem
```

### Generate cert using config file

Create a ```server.cnf``` configuration file:

```
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no
[req_distinguished_name]
C = US
ST = State
L = City
O = Company Ltd
OU = Unit
CN = company.com
[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1 = company.com
```

Generate the cert using the config file as option

```bash
openssl req -newkey rsa:4096 -days 3650 -nodes -x509 -sha256 -keyout key.pem -out cert.pem -config server.cnf
```

## Generate a one-line string from a key or certificate

```bash
awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' cert.pem

# paste string to memory
awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' key.pem | pbcopy
```

## Connect and test TLS servers

```
openssl s_client -connect 0.0.0.0:8443 -tls1_2  -cert ./cert.pem -key ./key.pem
```

## Encrypt / Decrypt files with OpenSSL

```
# encrypt file
openssl enc -blowfish -in file.txt -out file.blowfish

#decrypt the file
openssl enc -d -blowfish -in file.blowfish -out file.txt
```

## Check for Meltdown And Spectre Vulnerabilities (Ubuntu)

Find if your Ubuntu systems are patched or not patched using any one of the following commands:

```
grep CONFIG_PAGE_TABLE_ISOLATION=y /boot/config-`uname -r` && echo "patched :)" || echo "unpatched :("
```

```
grep cpu_insecure /proc/cpuinfo && echo "patched :)" || echo "unpatched :("
```

```
dmesg | grep "Kernel/User page tables isolation: enabled" && echo "patched :)" || echo "unpatched :(
```

If your Ubuntu system is not patched, you can install the latest dist upgrade:

```
sudo apt-get update
sudo apt-get dist-upgrade

# reboot your system for changes to take effect
sudo reboot
```

## Check Linux OS distro version

```bash
lsb_release -a
```

## View certificate details

```bash
openssl x509 -in cert.pem -text -noout
```

## Wireshark filters

Capture HTTP GET and POST requests
```
# captures both
http.request

# captures POST requests only
http.request.method == "POST"
```

## Capturing network packets from a remote host

Run tcpdump over ssh and use wireshark listen on the pipe

First, you need to run this script as ```sudo``` on the remote machine to enable tcpdump permissions:

```bash
#!/bin/bash
groupadd pcap
usermod -a -G pcap root
chgrp pcap /usr/sbin/tcpdump
chmod 750 /usr/sbin/tcpdump
setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
```

Then, create the named pipe:
```
mkfifo /tmp/remote
```
Start wireshark from the command line
```
wireshark -k -i /tmp/remote
```
Run tcpdump over ssh on your remote machine and redirect the packets to the named pipe:
```
ssh root@192.168.0.1 "tcpdump -s 0 -U -n -w - -i eth0 not port 22" > /tmp/remote
```

## Mounting a remote file system over SSH

In MacOS, install FUSE and SSHFS using brew:

```bash
brew cask install osxfuse
brew install homebrew/fuse/sshfs
```


## Installing NodeJS in corporate networks

Installing NVM without certificate check:

```
wget --no-check-certificate -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
```

Install Node packages over http:

```
npm config set registry http://registry.npmjs.org/
```

## Installing root/CA Certificates (Ubuntu)

Create a directory for extra CA certificates in /usr/share/ca-certificates:

```bash
sudo mkdir /usr/share/ca-certificates/extra
```

**Note: The CA certificate needs to be in .CRT format**

Copy the CA .crt file to this directory:

```bash
sudo cp mycert.crt /usr/share/ca-certificates/extra/mycert.crt
```

Ubuntu will automatically detect the added certificate in ```/usr/share/ca-certificates``` and configure ```/etc/ca-certificates.conf```:

**Note: You still have to select your CA .crt certificate from the list**

```bash
sudo dpkg-reconfigure ca-certificates
```
## Generating a new SSH key

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

## Check failed SSH auth attempts on your server

```bash
# list brute-force attempts
grep sshd.\*Failed /var/log/auth.log

# number of failed ssh login attempts
grep sshd.\*Failed /var/log/auth.log | wc -l

# list failed connections (i.e. no login attempted, could be a port scanner, etc)
grep sshd.*Did /var/log/auth.log

# view failed attempts in real-time
tail -f /var/log/auth.log | grep sshd.\*Failed
```
Note: you can improve security by installing ```fail2ban```:
```bash
sudo apt-get install fail2ban
```


## Copy public SSH key to server and enable SSH key only access

```bash
ssh-copy-id username@remote_host
```
Disable Password Authentication on your Server:

```bash
# edit ssh config
sudo nano /etc/ssh/sshd_config

# edit this line
PasswordAuthentication no

# restart SSH service
sudo service ssh restart
```

## Encoding/Decoding Self-signed Certificates

### View PEM / DER encoded certificates

```bash
# view der/cer type certificates
openssl x509 -in cert.cer -inform der -text
```

```bash
# view pem/crt type certificates
openssl x509 -in cert.pem -inform pem -text
```

### Convert PEM / DER certificates

```bash
# convert PEM to DER
openssl x509 -in cert.crt -outform der -out cert.der
```

```bash
# convert DER to PEM
openssl x509 -in cert.crt -inform der -outform pem -out cert.pem
```

### Combine Private Key and Certificate:

```bash
openssl req -new -newkey rsa:1024 -days 365 -nodes -x509 -keyout server.pem -out server.pem
```

## Hash a string with SHA256

```bash
echo -n 'Hello World!' | sha256sum
```

In Mac OS:
```bash
echo -n 'Hello World!' | shasum -a 256
```
## Hash a string using other algorithms

```bash
echo -n "foobar" | openssl dgst -sha256
```

For other algorithms you can replace: ```-sha256``` with ```-md5```, ```-sha1```, etc.

## Generate a predictable random string

```
# using 64 characters
date +%Y%d%m | sha256sum | head -c 64; echo

# using 32 characters
date +%Y%d%m | sha256sum | head -c 32; echo

# with Base64 encoding
date +%Y%d%m | sha256sum | base64 | head -c 32; echo

# randomise the string down to minute changes
date +%F-%M | sha256sum | head -c 64; echo

# using openssl, 32 characters
date +%Y%d%m | openssl sha256 | awk '{print $2}' | head -c 32; echo
```
