mod 'puppetlabs-java_ks'
mod 'camptocamp-openssl'

class run_bash {
  file {
    'my_bash_script':
      ensure => 'file',
      source => 'puppet:///modules/run_bash/my_bash_script.sh',
      path => '/usr/local/bin/my_bash_script.sh',
      owner => 'root',
      group => 'root',
      mode  => '0744', # Use 0700 if it is sensitive
      notify => Exec['run_my_script'],
  }
  exec {
    'run_my_script':
     command => '/usr/local/bin/my_bash_script.sh',
     refreshonly => true,
  }

  x509_request { '/home/user/ddf-2.9.2/etc/certs/localhost.csr': }

  openssl::export::pkcs12 { 'foo':
     ensure   => 'present',
     basedir  => '/path/to/dir',
     pkey     => '/here/is/my/private.key',
     cert     => '/home/user/ddf-2.9.2/etc/certs/localhost.crt',
     in_pass  => 'changeit',
     out_pass => 'changeit',
  }

  java_ks { 'puppetca:keystore':
    ensure       => latest,
    certificate  => '/home/user/ddf-2.9.2/etc/keystores/serverKeystore.jks',
    target       => '/home/user/ddf-2.9.2/etc/keystores/serverKeystore.jks',
    password     => 'changeit',
    trustcacerts => true,
  }
}

