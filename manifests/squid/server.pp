# This role builds puppet master server

class profiles::squid::server {
  include 'squid'

  $squid_basics       = hiera_hash('roles::squid::server::basics::cache_mem', {})
  $squid_cache_dir    = hiera_hash('roles::squid::server::cache_dir',         {})
  $squid_acls         = hiera_hash('roles::squid::server::acls',          {})
  $squid_http_accesses  = hiera_hash('roles::squid::server::http_accesses',          {})

  class { '::squid':
    cache_mem => lookup ('roles::squid::server::basics::cache_mem')
  }
  
  create_resources('::squid', 'roles::squid::server::basics::cache_mem')
  create_resources('::squid::cache_dir', $squid_cache_dir)
  create_resources('::squid::acl',  $squid_acls)
  create_resources('::squid::http_access',  $squid_http_accesses)

}
