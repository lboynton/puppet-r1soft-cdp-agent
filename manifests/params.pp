class serverbackup_cdp::params{
  # If we have a top scope variable defined, use it, otherwise fall back to a
  # hardcoded value.
  $key_server = $::key_server ? {
  	undef => undef,
	default => $::key_server,
  }
  
  $key = $::key ? {
  	undef => undef,
	default => $::key,
  }
  
  # Since the top scope variable could be a string (if from an ENC), we might
  # need to convert it to a boolean.
  $install_agent = $::install_agent ? {
    undef   => false,
    default => $::install_agent,
  }
  if is_string($install_agent) {
    $safe_install_agent = str2bool($install_agent)
  } else {
    $safe_install_agent = $install_agent
  }
  
}