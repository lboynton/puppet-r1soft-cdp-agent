class serverbackup_cdp_agent::repo {
    case $operatingsystem {
        redhat, centos: {
            yumrepo { 'r1soft':
                baseurl     => 'http://repo.r1soft.com/yum/stable/$basearch/',
                descr       => 'R1Soft Repository Server',
                enabled     => 1,
                gpgcheck    => 0,
                name        => 'r1soft',
            }
        }
        ubuntu, debian: {
            apt::source { 'r1soft-stable':
                location    => 'http://repo.r1soft.com/apt',
                release     => 'stable',
                repos       => 'main',
                include_src => false,
                key         => 'B1D53877',
                key_source  => 'http://repo.r1soft.com/r1soft.asc',
            }
        }
    }
}
