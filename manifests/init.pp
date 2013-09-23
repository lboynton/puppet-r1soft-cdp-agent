class serverbackup_cdp(
$key_server 		= $serverbackup_cdp::params::key_server,
$key 				= $serverbackup_cdp::params::key,
$install_agent	    = $serverbackup_cdp::params::install_agent
) inherits serverbackup_cdp::params  {

	# default class action is to install the server!
    include serverbackup_cdp::repo
	include serverbackup_cdp::server
	
    if $install_agent {
      class { 'serverbackup_cdp::agent':
        key_server => $key_server,
		key		   => $key,
		install_agent => $install_agent
      }
    }
	
	

}

