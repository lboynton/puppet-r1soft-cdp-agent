define r1soft_cdp_agent::key {
    file { "/usr/sbin/r1soft/conf/server.allow/key":
        content => "${title}",
        notify      => Service['cdp-agent'],
        require     => Package['r1soft-cdp-enterprise-agent'],
    }
}
