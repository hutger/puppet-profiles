# This role builds puppet master server

class profiles::haproxy::server {
  include 'haproxy'

  $haproxy_listen_services   = hiera_hash('roles::haproxy::server::listen_services',   {})
  $haproxy_frontends         = hiera_hash('roles::haproxy::server::frontends',         {})
  $haproxy_backends          = hiera_hash('roles::haproxy::server::backends',          {})

  #create_resources('::haproxy::listen',   $haproxy_listen_services)
  create_resources('::haproxy::frontend', $haproxy_frontends)
  #create_resources('::haproxy::backend',  $haproxy_backends)
}
