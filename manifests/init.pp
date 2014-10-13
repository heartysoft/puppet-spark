include stdlib

class spark (
	$mode,
	$master_node,
	$master_port = $spark::params::master_port,
	$version = $spark::params::version,
	$download_url = $spark::params::download_url,
	$download_dir = $spark::params::download_dir,
	$install_method = $spark::params::install_method,
	$install_dir = $spark::params::install_dir,
	$tarball = $spark::params::tarball
	) inherits spark::params {
	
	anchor {'spark::begin:':} ->
	class {'spark::install': } ~>
	class {'spark::service': }->
	anchor {'spark::end:': }
}
