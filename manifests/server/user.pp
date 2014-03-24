class serverbackup_cdp::server::user(
    $username,
    $password
) {
    exec { 'set-user':
        command => "serverbackup-setup --user ${username} --pass ${password}",
        creates => '/usr/sbin/r1soft/conf/.user_set',
        path    => '/usr/bin:/usr/sbin:/bin'
    }
}