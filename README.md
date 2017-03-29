docker-squid
=====

Slim image (18MB) of Squid 3.5.22 running under Alpine Linux 3.5.

How to use
=========

```
docker run -p 3128:3128 dijk039/docker-squid
```

With bespoke configuration:

```
docker run  -v <configPath>/squid.conf:/etc/squid/squid.conf:ro \
            -v <configPath/cache:/var/cache/squid:rw \
            -v /var/log/squid:/var/log/squid:rw \
            -v /etc/localtime:/etc/localtime:ro \
            -p 3128:3128 \
            dijk039/docker-squid
```
