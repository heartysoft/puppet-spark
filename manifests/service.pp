
class spark::service(
	$install_dir = $spark::install_dir,
	$mode = $spark::mode,
	$master_node = $spark::master_node,
	$master_port = $spark::master_port,
	$max_worker_ram = $spark::max_worker_ram,
	$max_worker_cores = $spark::max_worker_cores,
	$master_recovery_zookeeper = $spark::master_recovery_zookeeper
	){

	if $mode == 'master' {
		
		file { "$install_dir/spark/conf/spark-env.sh":
			ensure => present,
			content => template('spark/spark-env.sh.master.erb'),
			mode => '0755',
			notify => Service['spark'],
		}
		->
		file { '/etc/init.d/spark':
			ensure => present,
			content => template('spark/init.d.master.erb'),
			mode => '0755',
			notify => Service['spark'],
		}
	} else {
		file { '/etc/init.d/spark':
			ensure => present,
			content => template('spark/init.d.worker.erb'),
			mode => '0755',
			notify => Service['spark'],
		}
	}

	service { 'spark':
		ensure => running,
		enable => true,
		require => File['/etc/init.d/spark'],
	}
}