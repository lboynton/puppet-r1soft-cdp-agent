class r1soft_cdp_agent(
    $key_server = undef,
    $key = undef
) {
    include r1soft_cdp_agent::repo
    include r1soft_cdp_agent::packages

    exec { 'get-module':
        command     => '/usr/bin/r1soft-setup --get-module --silent',
        subscribe   => Package['r1soft-cdp-enterprise-agent'],
        unless      => '/bin/grep hcpdriver /proc/modules',
        logoutput   => on_failure,
    }

    service { 'cdp-agent':
        ensure      => running,
        enable      => true,
        subscribe   => Exec['get-module'],
    }

    if ($key != undef) {
        r1soft_cdp_agent::key{$key:}
    }
    elsif ($key_server != undef)  {
        r1soft_cdp_agent::get_key{$key_server:}
    }
    
}

