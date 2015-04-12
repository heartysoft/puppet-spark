class spark::params {
	$master_port = '7077'
	$version = 'spark-1.1.1-bin-hadoop1'
	$download_dir = '/tmp'
	$install_method = 'wget'
	$install_dir = '/var/lib/spark'
	$max_worker_ram = undef
	$max_worker_cores = undef
	$master_recovery_zookeeper = undef
}