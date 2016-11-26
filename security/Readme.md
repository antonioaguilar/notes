# Security

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

## Create SSL/X509 Self-signed Certificates

### Generate Private Key (key.pem) and Certificate (cert.pem):

```bash
openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 -keyout key.pem -out cert.pem
```

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
