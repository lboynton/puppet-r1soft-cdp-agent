
Puppet R1Soft CDP Agent module
==============

Tested on CentOS 6.

Usage
--------------
Simply specify the IP address or hostname of the CDP master to the `key_server` parameter.

	class { 'r1soft_cdp_agent':
		key_server => '192.168.0.25',
	}
