# This role builds puppet master server

class profiles::squid::server {
  include 'squid'

  #$squid_server       = hiera_hash('roles::squid::server', {})
  #$squid_http_port    = hiera_hash('roles::squid::server::http_port',         {})
  $squid_cache_dir    = hiera_hash('roles::squid::server::cache_dir',         {})
  $squid_acls         = hiera_hash('roles::squid::server::acls',          {})
  $squid_http_accesses  = hiera_hash('roles::squid::server::http_accesses',          {})

  #create_resources('::squid', $squid_server)
  #create_resources('::squid::http_port', $squid_http_port)
  create_resources('::squid::cache_dir', $squid_cache_dir)
  create_resources('::squid::acl',  $squid_acls)
  create_resources('::squid::http_access',  $squid_http_accesses)

}
