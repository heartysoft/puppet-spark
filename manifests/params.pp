class spark::params {
	$master_port = '7077'
	$version = 'spark-1.1.0-bin-hadoop1'
	$download_url = "http://d3kbcqa49mib13.cloudfront.net/${version}.tgz"
	$download_dir = '/tmp'
	$install_method = 'wget'
	$install_dir = '/var/lib/spark'
	$tarball = "${version}.tgz"
	$max_worker_ram = undef
	$max_worker_cores = undef
	$master_recovery_zookeeper = undef
}