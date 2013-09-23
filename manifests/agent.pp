class serverbackup_cdp::agent(
    $key_server = $serverbackup_cdp::params::key_server,
    $key = $serverbackup_cdp::params::key,
	$install_agent	    = $serverbackup_cdp::params::install_agent
) {
	if $install_agent {
		#noop because negative if on boolean not great in puppet
	} else {
    		include serverbackup_cdp::repo
	}
    include serverbackup_cdp::agent::packages

    exec { 'get-module':
        command     => '/usr/bin/serverbackup-setup --get-module --silent',
        subscribe   => Package['serverbackup-enterprise-agent'],
        unless      => '/bin/grep hcpdriver /proc/modules',
        logoutput   => on_failure,
    }

    service { 'cdp-agent':
        ensure      => running,
        enable      => true,
        subscribe   => Exec['get-module'],
    }

    if ($key != undef) {
        serverbackup_cdp::agent::key{$key:}
    }
    elsif ($key_server != undef)  {
        serverbackup_cdp::agent::get_key{$key_server:}
    }
}

