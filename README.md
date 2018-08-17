# ansible

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What ansible affects](#what-ansible-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ansible](#beginning-with-ansible)
4. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
    * [Contributing](#contributing)

## Overview

ansible basic installation/configuration

## Module Description

This module ins intended to automate ansible's installation and basic setup

## Setup

### What ansible affects

* Uses eyp-epel to install and enable EPEL
* Installs via packaging system ansible
* Manages ansible's general configuration file: **/etc/ansible/ansible.cfg**

### Setup Requirements

This module requires pluginsync enabled

### Beginning with ansible

Include ansible class to install it:

```puppet
class { 'ansible': }
```

## Reference

### ansible

* **manage_package**: Whether or not this module shall manage ansible's package (default: true)
* **package_ensure**: Expected package status (default: 'installed')
* **roles_path**: List of additional paths to search for roles in (default: [])
* **host_key_checking**: SSH key host checking (default: false)
* **retry_files_enabled**: Whether or not when a playbook fails a .retry file shall be created in ~/ (default: false)
* **log_path**: Log file for ansible (default: '/var/log/ansible.log')
* **manage_logrotate**: Whether or not to add logrotate config (default: true)
* **logrotation_ensure**: Controls logrotate configutation files status (default: 'present')
* **logrotation_frequency**: Logrotation frequency (default: 'daily')
* **logrotation_size**: Max log size (default: '100M')
* **logrotation_rotate**: Log retention (default: '30')

## Limitations

RHEL 7 only

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
