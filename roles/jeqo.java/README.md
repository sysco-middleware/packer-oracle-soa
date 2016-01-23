java
====

java role to install and configure java from different providers (oracle, openjdk, azul) in linux distributions: el and ubuntu.

Requirements
------------

None.

Role Variables
--------------

These variables are required to define role's behavior:

- java_provider: openjdk # valid values: azul, oracle

- java_version: 8 # valid values: 7, 8

- java_type: jdk # valid values: jre (not supported with azul provider), jdk

Dependencies
------------

None

Example Playbook
----------------

Check tests directory:

    - hosts: test01
      roles:
        - role: java
          java_provider: openjdk
          java_version: 8
          java_type: jdk

License
-------

MIT

Author Information
------------------

jorge quilcate (quilcate.jorge@gmail.com)
