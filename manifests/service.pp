
class spark::service(
	$install_dir = $spark::install_dir,
	$mode = $spark::mode,
	$master_node = $spark::master_node
	){

	if $mode == 'master' {
		file { '/etc/init.d/spark':
			ensure => present,
			content => template('spark/init.d.master.erb'),
			mode => '0755',
		}
	} else {
		file { '/etc/init.d/spark':
			ensure => present,
			content => template('spark/init.d.worker.erb'),
			mode => '0755',
		}
	}

	service { 'spark':
		ensure => running,
		enable => true,
		require => File['/etc/init.d/spark'],
	}
}