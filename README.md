Oracle SOA Suite 12c Docker Image
=================================

This image contains **Oracle SOA Suite 12c** (*Quickstart*)
installed on **JDK 7**, and **Oracle Linux 7.1**.

## Installation

```
docker pull jeqo/oracle-soa-12c
```

Build using [Packer](https://packer.io/)

## How to use it

This image just contains software installed, it does not contain a
domain created.

To create a domain you could check "samples" directory. It contains
a *Dockerfile* with steps to run "container-scripts/create-soa-domain.py" WLST script.

You could create your own domain creation script and run Dockerfile.

[Samples](https://github.com/jeqo/oracle-soa-12c-docker/tree/master/samples/12c-domain)
