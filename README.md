Puppet Idera (formerly R1Soft) CDP Agent module
==============

Tested on Debian 7.0, CentOS 6 and Ubuntu 12.04.2 LTS.

Major Update - now supports install of CDP server - Please note the change in class behaviour below and change in class names

Usage
--------------
CDP Agent Only:

Simply specify the IP address or hostname of the CDP master to the `key_server` parameter.

```puppet
class { 'serverbackup_cdp::agent':
	key_server => 'http://192.168.0.25:8080',
}
```

Alternatively you can also specify the key directly.

```puppet
class { 'serverbackup_cdp::agent':
	key => 'xxxxxxxxx',
}
```

CDP Server Only:

```puppet
class { 'serverbackup_cdp':
}
```
or even simpler

```puppet
include serverbackup_cdp
```

CDP Agent & Server:
```puppet
class { 'serverbackup_cdp':
	install_agent => true,
	# and only one of the following
	key_server => 'http://192.168.0.25:8080',
	key => 'xxxxxxxxx',
}
```
