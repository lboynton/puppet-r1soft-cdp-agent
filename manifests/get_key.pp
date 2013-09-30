define serverbackup_cdp_agent::get_key {
    $server_filename = regsubst($name, '^(.*:)//([a-z0-9\-.]+)(:[0-9]+)?(.*)$','\2')
    exec { "/usr/bin/serverbackup-setup --get-key ${name}":
        creates     => "/usr/sbin/r1soft/conf/server.allow/${server_filename}",
        require     => [
            Package['serverbackup-enterprise-agent'],
            Exec['get-module'],
        ],
        logoutput   => on_failure,
        notify      => Service['cdp-agent'],
    }
}
