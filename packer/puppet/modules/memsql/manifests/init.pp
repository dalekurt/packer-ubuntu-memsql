class memsql {

  # execute 'apt-get update'
  exec { 'apt-update':                    # exec resource named 'apt-update'
    command => '/usr/bin/apt-get update'  # command this resource will run
  }

  # install g++
  package { 'g++':
    require => Exec['apt-update'],        # require 'apt-update' before installing
    ensure => installed,
  }

  # install mysql-client
  package { 'mysql-client':
    require => Exec['apt-update'],        # require 'apt-update' before installing
    ensure => installed,
  }

  #
  file_line { 'debian_package':
    path => '/etc/apt/sources.list',
    line => 'deb http://debs.dev trusty main'
  }

}
