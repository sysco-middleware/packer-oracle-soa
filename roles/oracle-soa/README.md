Ansible Role: Oracle SOA Suite
==============================

Role aimed to install and configure Oracle SOA Suite. Currently it supports
12c releases (12.1.3, 12.2.1) and 11g releases (11.1.1.7)

Requirements
------------

- Java Development Kit installed, depending in SOA Suite version (e.g: Oracle JDK 8 on SOA 12.2.1)
- This role is only supported in Red Hat related OS (Centos, Oracle Linux).
- If you are not using _oracle_soa_quick_installation_ = yes, then you need to have Oracle WebLogic installed (you can use [oracle-weblogic](https://galaxy.ansible.com/sysco-middleware/oracle-weblogic/) role).

Role Variables
--------------

Defaults:

- _oracle_soa_version_: 12c
- _oracle_soa_quick_installation_: yes #only required in 12c
- _oracle_soa_installer_: path.jar # path to soa installer

Variables:

- _oracle_soa_user_: oraclefmw
- _oracle_soa_group_: ofmwinstall
- _oracle_soa_user_home_: "/opt/oraclefmw"
- _oracle_soa_oracle_home_: "/opt/oraclefmw/product/oracle_home"
- _oracle_soa_soa_home_: "{{ oracle_soa_oracle_home }}/soa"
- _oracle_soa_wls_home_: "{{ oracle_soa_oracle_home }}/wlserver"
- _oracle_soa_inventory_file_: "{{ oracle_soa_user_home }}/oraInst.loc"
- _oracle_soa_inventory_directory_: "/opt/oraclefmw/inventory"
- _oracle_soa_jdev_command_: jdev

- _oracle_soa_response_file_: "{{ oracle_soa_user_home }}/soa-install.rsp"

- _oracle_soa_already_installed_: false


Dependencies
------------

None.

Example Playbook
----------------

Refer to tests/test.yml

License
-------

MIT

Author Information
------------------

Jorge Quilcate (jorge.quilcate@sysco.no)
