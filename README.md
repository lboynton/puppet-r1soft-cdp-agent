
Puppet R1Soft CDP Agent module
==============

Tested on CentOS 6 and Ubuntu 12.04.2 LTS.
Adapted to Ubuntu/Debian from lboynton/r1soft_cdp_agent.

Usage
--------------
Simply specify the IP address or hostname of the CDP master to the `key_server` parameter.

	class { 'r1soft_cdp_agent':
		key_server => 'http://192.168.0.25:8080',
	}

Issues
--------------
Key generation will return successful even if not.
