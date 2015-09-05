Example of Image with SOA Domain
================================

This sample creates a Domain that includes **SOA** and **OSB** templates:

```
addTemplate('.../osb/common/templates/wls/oracle.osb_template_12.1.3.jar')
addTemplate('.../soa/common/templates/wls/oracle.soa_template_12.1.3.jar')
```

and it is a *"Compact"* Domain (all components on Admin Server)

```
readTemplate('.../wlserver/common/templates/wls/wls.jar', DOMAIN_MODE)
```

To build your image, run:

```
docker build -t soa_host .
```

Once your image is built, run your image:

```
docker run -d -p 7001:7001 soa_host
```

This command will run *"startWebLogic.sh"* and map *7001* port to your *localhost*.
