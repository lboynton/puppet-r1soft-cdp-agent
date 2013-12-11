Puppet Idera (formerly R1Soft) CDP Agent module
==============

Tested on Debian 7.0, CentOS 6 and Ubuntu 12.04.2 LTS.

Usage
--------------
Simply specify the IP address or hostname of the CDP master to the `key_server` parameter.

```puppet
class { 'serverbackup_cdp_agent':
	key_server => 'http://192.168.0.25:8080',
}
```

Alternatively you can also specify the key directly.

```puppet
class { 'serverbackup_cdp_agent':
	key => 'xxxxxxxxx',
}
```

Add `ensure => latest` as a class parameter to keep the agent up to date.