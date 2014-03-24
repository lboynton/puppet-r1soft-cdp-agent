class serverbackup_cdp::server(
    $admin_username = 'admin',
    $admin_password = 'r1soft'
) {
    package { 'serverbackup-enterprise':
        ensure  => installed,
        require => Class['serverbackup_cdp::repo'],
    }

    class { 'serverbackup_cdp::server::user':
        username    => $admin_username,
        password    => $admin_password,
        notify      => Service['cdp-server'],
        require     => Package['serverbackup-enterprise'],
    }

    service { 'cdp-server':
        ensure      => running,
        enable      => true,
        require     => Package['serverbackup-enterprise'],
    }
}