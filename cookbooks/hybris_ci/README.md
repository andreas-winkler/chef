hybris_ci Cookbook
==================

Cookbook to install a typical hybris CI system

Requirements
------------

- `hybris_base` to provide install functionality, like java, unzip, ...
- `jenkins` - to elaborate the jenkins cookbook with the hybris settings

Attributes
----------
See `attributes/default.rb` for defaults generated per platform.

- `node['hybris']['jenkins']['install_method']` - installation method of jenkins, should not be changed
- `node['hybris']['jenkins']['httpPort']` - HTTP port of the Jenkins app server
- `node['hybris']['jenkins']['jvm_options']` - Java options for memory (e.g. Xmx, Xms for heap size) and so on


Usage
-----
#### hybris_ci::default
TODO: Write usage instructions for each cookbook.

This installs a Jenkins build server.


License and Authors
-------------------
Authors: andreas
