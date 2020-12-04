# This role builds puppet master server

class profiles::haproxy::server {
  include 'haproxy'

  $haproxy_balancer_members   = hiera_hash('roles::haproxy::server::balancermembers',   {})
  $haproxy_frontends         = hiera_hash('roles::haproxy::server::frontends',         {})
  $haproxy_backends          = hiera_hash('roles::haproxy::server::backends',          {})

  create_resources('::haproxy::balancermember', $haproxy_balancer_members)
  create_resources('::haproxy::frontend', $haproxy_frontends)
  create_resources('::haproxy::backend',  $haproxy_backends)
}
