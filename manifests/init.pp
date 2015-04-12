include stdlib

class spark (
	$mode,
	$master_node,
	$master_recovery_zookeeper = $spark::params::master_recovery_zookeeper,
	$max_worker_ram = $spark::params::max_worker_ram,
	$max_worker_cores = $spark::params::max_worker_cores,
	$master_port = $spark::params::master_port,
	$version = $spark::params::version,
	$download_url = "http://d3kbcqa49mib13.cloudfront.net/${version}.tgz", #related to version...can't find a way to stash this in params
	$download_dir = $spark::params::install_dir,
	$install_method = $spark::params::install_method,
	$install_dir = $spark::params::install_dir,
	$tarball = "${version}.tgz"
	) inherits spark::params {
	
	anchor {'spark::begin:':} ->
	class {'spark::install': } ~>
	class {'spark::service': }->
	anchor {'spark::end:': }
}
