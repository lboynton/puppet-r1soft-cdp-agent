class serverbackup_cdp::server {
    package { 'serverbackup-enterprise':
        ensure  => installed,
        require => Class['serverbackup_cdp::repo'],
    }

    service { 'cdp-server':
        ensure      => running,
        enable      => true,
        require     => Package['serverbackup-enterprise'],
    }
}