# Security

## Create SSL/X509 Self-signed Certificates

### Generate Private Key (key.pem) and Certificate (cert.pem):

```bash
openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 -keyout key.pem -out cert.pem
```

### View Contents of Certificate (cert.pem):

```bash
openssl x509 -in cert.pem -text
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
