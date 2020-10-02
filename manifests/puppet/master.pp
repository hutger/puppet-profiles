# This role builds puppet master server

class profiles::puppet::master {
  include 'profiles::base_linux'
  include 'r10k'
  include 'hiera'
  include 'hiera::eyaml'

  cron { 'r10k_run':
    command => '/usr/bin/r10k deploy environment -p',
    user    => 'root',
    hour    => '*',
    minute  => '*/5',
  }
}
