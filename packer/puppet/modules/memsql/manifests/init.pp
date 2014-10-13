class memsql (

  $version = $memsql::version,
  $license = $memsql::license,
  $memsql_src_dir = $memsql::memsql_src_dir,
  $memsql_bin_dir = $memsql::memsql_bin_dir,
) inherits memsql::params {

  include wget
  include gcc

  $memsql_pkg_name = "memsqlbin_amd64.tar.gz"
  $memsql_pkg      = "${memsql_src_dir}/${memsql_pkg_name}"

  # execute 'apt-get update'
  exec { 'apt-update':                    # exec resource named 'apt-update'
    command => '/usr/bin/apt-get update'  # command this resource will run
  }

  file { $memsql_src_dir:
    ensure => directory,
  }

  exec { 'get-memsql-pkg':
    command => "wget http://download.memsql.com/${license}/${memsql_pkg_name}",
    unless  => "test -f ${memsql_pkg}",
    cwd     => $memsql_src_dir,
    path    => '/bin:/usr/bin',
    require => [File[$memsql_src_dir],Class['wget']], 
  }

  exec { 'unpack-memsql':
    command => "tar --strip-components 1 -xzf ${memsql_pkg}",
    cwd     => $memsql_src_dir,
    path    => '/bin:/usr/bin',
    unless  => "test -f ${memsql_src_dir}/Makefile",
    require => Exec['get-memsql-pkg'],
  }

  exec { 'check_system': 
    command  => "./check_system",
    provider => shell,
    cwd      => $memsql_src_dir,
    require  => [ Exec['unpack-memsql'],Class['gcc']],
  }

  # install mysql-client
  package { 'mysql-client':
    require => Exec['apt-update'],        # require 'apt-update' before installing
    ensure => installed,
  }
  
}
