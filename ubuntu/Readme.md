# Ubuntu

## Configure dnsmasq

Configure `*` wildcard domains:

```
# create file 
~/.dnsmasq/dnsmasq.conf

# add hosts
address=/.example.com/192.168.50.6

# this will match all *.example.com domains
```


