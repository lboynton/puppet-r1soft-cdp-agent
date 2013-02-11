class r1soft_cdp_agent(
    $key_server = undef
) {
	include r1soft_cdp_agent::repo
	include r1soft_cdp_agent::packages

    exec { 'get-module':
        command     => '/usr/bin/r1soft-setup --get-module --silent',
		subscribe   => Package['r1soft-cdp-enterprise-agent'],
		refreshonly => true,
	}

    service { 'cdp-agent':
		ensure      => running,
		enable      => true,
		subscribe   => Exec['get-module'],
	}

    if defined($key_server) {
        r1soft_cdp_agent::key($key_server)
    }
}