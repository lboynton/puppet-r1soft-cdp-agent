include serverbackup_cdp

service { 'iptables':
    ensure  => stopped,
    enable  => false,
}