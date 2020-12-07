# This role builds puppet master server

class profiles::squid::server {
  #include 'squid'

#  $squid_server       = hiera_hash('roles::squid::server', {})
  $cache_mem          = hiera('roles::squid::server::cache_mem', {value_type => String, default_value => '512 MB'})
  $workers            = hiera('roles::squid::server::workers', {value_type => String, default_value => '3'})
  $coredump_dir       = hiera('roles::squid::server::coredump_dir', {value_type => String, default_value => ''})
  $http_ports          = hiera('roles::squid::server::http_ports', {value_type => String, default_value => '3128'})


  $squid_http_port    = hiera_hash('roles::squid::server::http_port',         {})
  $squid_cache_dir    = hiera_hash('roles::squid::server::cache_dir',         {})
  $squid_acls         = hiera_hash('roles::squid::server::acls',          {})
  $squid_http_accesses  = hiera_hash('roles::squid::server::http_accesses',          {})

  class { 'squid':
    cache_mem    => $cache_mem,
    workers      => $workers,
    coredump_dir => $coredump_dir,
    http_ports   => $http_ports
  }

#create_resources('::squid', $squid_server)
  create_resources('::squid::http_port', $squid_http_port)
  create_resources('::squid::cache_dir', $squid_cache_dir)
  create_resources('::squid::acl',  $squid_acls)
  create_resources('::squid::http_access',  $squid_http_accesses)

}
