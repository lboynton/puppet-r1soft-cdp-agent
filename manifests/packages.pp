class r1soft_cdp_agent::packages {
    if $operatingsystem == ('redhat' or 'centos') {
        if !defined(Package['kernel-devel']) {
            package { 'kernel-devel':
                ensure => installed,
                before => Package['r1soft-cdp-enterprise-agent'],
            }
        }

        if !defined(Package['kernel-headers']) {
            package { 'kernel-headers':
                ensure => installed,
                before => Package['r1soft-cdp-enterprise-agent'],
            }
        }
    }
    
    if $operatingsystem == ('debian') {
        exec { "kernel headers":
            command => "apt-get install linux-headers-`uname -r` -y",
            onlyif => "dpkg-query -W linux-headers-`uname -r` 2>/dev/null|wc -l",
            before => Package['r1soft-cdp-enterprise-agent'],
            }       
    }

    package { 'r1soft-cdp-enterprise-agent':
        ensure  => installed,
        require => Class['r1soft_cdp_agent::repo'],
    }
}
