include stdlib

class spark (
	$mode,
	$master_node,
	$master_recovery_zookeeper = $spark::params::master_recovery_zookeeper,
	$max_worker_ram = $spark::params::max_worker_ram,
	$max_worker_cores = $spark::params::max_worker_cores,
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
