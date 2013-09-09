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

        package { "linux-headers-${kernelrelease}":
            ensure  => installed,
            require => Class['r1soft_cdp_agent::repo'],
            before => Package['r1soft-cdp-enterprise-agent'],
        }
    }

    package { 'r1soft-cdp-enterprise-agent':
        ensure  => installed,
        require => Class['r1soft_cdp_agent::repo'],
    }
}


