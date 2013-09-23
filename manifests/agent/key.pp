define serverbackup_cdp::agent::key {
    file { "/usr/sbin/r1soft/conf/server.allow/key":
        content => "${title}",
        notify      => Service['cdp-agent'],
        require     => Package['serverbackup-enterprise-agent'],
    }
}
