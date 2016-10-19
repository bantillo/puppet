class karaf {
	file { "/etc/apache-karaf-4.0.7.tar.gz":
		ensure => 'file',
		source => "puppet:///modules/karaf/apache-karaf-4.0.7.tar.gz",
	}
	exec { 'tar -xf /etc/apache-karaf-4.0.7.tar.gz':
  		cwd     => '/etc',
  		creates => '/etc/karaf',
  		path    => ['/usr/bin', '/usr/sbin',],
	}
}



