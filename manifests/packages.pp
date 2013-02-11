class r1soft_cdp_agent::packages {
	if !defined(Package['kernel-devel']) {
		package { 'kernel-devel': ensure => installed }
	}

	if !defined(Package['kernel-headers']) {
		package { 'kernel-headers': ensure => installed }
	}

	package { 'cdp-enterprise-agent':
		ensure	=> installed,
		require	=> Class['r1soft_cdp_agent::repo'],
	}
}