# This role builds puppet master server

class profiles::squid::server {
  include 'squid'

  $squid_basics     = hiera_hash('roles::squid::server::basics',   {})
  $squid_cache_dir  = hiera_hash('roles::squid::server::cache_dir',         {})
  #$squid_backends          = hiera_hash('roles::squid::server::backends',          {})

  create_resources('::squid', $squid_basics)
  create_resources('::squid::cache_dir', $squid_cache_dir)
  #create_resources('::squid::backend',  $squid_backends)
}
