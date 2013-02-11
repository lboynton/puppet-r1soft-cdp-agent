class r1soft_cdp_agent::repo {
	yumrepo { 'r1soft':
		baseurl		=> 'http://repo.r1soft.com/yum/stable/$basearch/',
		descr		=> 'R1Soft Repository Server',
		enabled		=> 1,
		gpgcheck	=> 0,
		name		=> 'r1soft',
	}
}