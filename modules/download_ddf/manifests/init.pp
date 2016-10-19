#mod 'jproyo-archive'
#mod 'funthomas424242-karaf'

class download_ddf {

#exec { 
#	"/usr/bin/wget -o karaf.tar.gz http://www.apache.org/dyn/closer.lua/karaf/4.0.7/apache-karaf-4.0.7.tar.gz && rm apache* && tar --strip-components=1 -C /opt/karaf -xzf karaf.tar.gz"  :
#        alias => "karaf",
#        cwd => "/tmp",
#    }


#archive { 'karaf':
#  ensure => present,
#  url    => ' http://www.apache.org/dyn/closer.lua/karaf/4.0.7/apache-karaf-4.0.7.tar.gz',
#  target => '/opt',

#}
exec { 
       "/usr/bin/wget -o ddf.zip http://artifacts.codice.org/service/local/artifact/maven/content?g=org.codice.ddf&a=ddf&v=2.9.2&r=releases&e=zip":
        alias => "ddf",
        cwd => "/tmp",
    }

}
