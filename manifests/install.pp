
class spark::install(
	$install_dir = $spark::install_dir,
	$install_method = $spark::install_method,
	$download_url = $spark::download_url,
	$download_dir = $spark::download_dir,
	$version = $spark::version,
	$tarball = $spark::tarball
) {

	file { [$install_dir, $download_dir] :
		ensure => directory
	}

	if $install_method == 'cp' {
		file{ "${download_dir}/${tarball}" :
			ensure => present,
        	source => "puppet:///modules/spark/$tarball",
        	mode => 744,
        	require => File[$download_dir],
        	before => Exec['extract-spark'],
		}
	} else {
		exec { 'download-spark':
	      command => "/usr/bin/wget -O ${download_dir}/${tarball} ${download_url}",
	      creates => "${download_dir}/${tarball}",
	      require => File[$download_dir],
	      before => Exec['extract-spark'],
	    }
	}
	
    exec { 'extract-spark':
		command => "/bin/chmod a+x ${download_dir}/${tarball} && /bin/tar -xzf ${download_dir}/${tarball} -C ${install_dir}",
		creates => "${install_dir}/${version}",
		require => File[$install_dir],
	}

	file { "${install_dir}/spark":
		ensure => link,
		target => "${install_dir}/${version}",
		require => Exec['extract-spark'],
		before => File['/etc/init.d/spark'],
	}

}