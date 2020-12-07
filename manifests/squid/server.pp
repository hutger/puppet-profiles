# This role builds puppet master server

class profiles::squid::server {
  include 'squid'

  $squid_basics   = hiera_hash('roles::squid::server::basics',   {})
  #$squid_frontends         = hiera_hash('roles::squid::server::frontends',         {})
  #$squid_backends          = hiera_hash('roles::squid::server::backends',          {})

  create_resources('::squid', $squid_basics)
  #create_resources('::squid::frontend', $squid_frontends)
  #create_resources('::squid::backend',  $squid_backends)
}
