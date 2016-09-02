Oracle SOA Provisioning
============================

Oracle SOA Provisioning repository based on the following tools:

- [Packer](https://packer.io/): Machine/Container image builder

- [Ansible](http://www.ansible.com/): Automation tool to provision configurations.

Builders
--------

Images are built by Packer using the following virtualization platforms:

- [VirtualBox](http://virtualbox.org/)

- [Docker](http://docker.com/)

Images Repositories
-------------------

Images are pushed to the following repositories:

- [Atlas](http://atlas.hashicorp.com/): Here are stored Vagrant Boxes using
VirtualBox provider.

- [Docker Hub](https://hub.docker.com/): Here are stored Docker images.

Versions
--------

- **oracle-soa-12c**

  - Atlas: [https://atlas.hashicorp.com/jeqo/boxes/oracle-soa-12c](https://atlas.hashicorp.com/jeqo/boxes/oracle-soa-12c)

  - Docker Hub: [https://hub.docker.com/r/jeqo/oracle-soa-12c/](https://hub.docker.com/r/jeqo/oracle-soa-12c/)

Directory Structure
-------------------

- samples: Usage samples.

Before Run
----------

Install Ansible Roles

```bash
ansible-galaxy install -f -p ./roles -r roles.yml
```

**IMPORTANT**: Download required installers, depending on your version and releases:

- /roles/[role_name]/files/[file_name].download
