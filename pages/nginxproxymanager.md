---
title: Nginx Proxy Manager
layout: default
---

Get Let's Encrypt certificates for your selfhosted resources with Nginx Proxy Manager in combination with DuckDNS.

1. **DuckDNS**<br>
- Create a [DuckDNS](https://www.duckdns.org/){:target="_blank"} account with any Identity Provider available on the platform
- Once logged in, create a subdomain and point it towards the **local IP** you will host the Nginx Proxy Manager Docker container on (most commonly 192.168.x.x)
- Wait for the DNS record to propagate, this typically takes between 24-48 hours due to ISP caching
2. **Nginx Proxy Manager**<br>
- On the host where you will run the Docker container, create a docker-compose.yml file like shown [here](https://nginxproxymanager.com/setup/) and run it
- When it's running, browse to the web interface, log in, and go to the 'Certificates' tab
- Add Certificate > Let's Encrypt via DNS >
    - Domain Names: _example.duckdns.org_ + _*.example.duckdns.org_ (the wildcard is used to cover all future proxy hosts you create)
    - Key Type: leave the default
    - DNS Provider: DuckDNS
    - Credentials File Content: replace the _your-duckdns-token_ string with the token found in the DuckDNS portal
    - Propagation Seconds: leave the default
    - Save it and wait for it to acquire the certificates
- Go to the 'Hosts' tab > Proxy Hosts > Add Proxy Host > Fill in required Details > SSL > Select the _example.duckdns.org_ certificate
