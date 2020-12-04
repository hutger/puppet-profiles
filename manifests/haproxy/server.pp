# This role builds puppet master server

class profiles::haproxy::server {
  include 'profiles::base_linux'
  include 'haproxy'
}
