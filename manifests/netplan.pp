# Base profile containg all the configuration
class profiles::netplan (
    $version = hiera('profiles::netplan::version', 2 ),
    $renderer = hiera('profiles::netplan::renderer', 'networkd'),
    $config_file = hiera('profiles::netplan::config_file', '/etc/netplan/01-custom.yaml'),
    $purge_config = hiera('profiles::netplan::purge_config', 'true'),
    $netplan_apply = hiera('profiles::netplan::netplan_apply', 'true'),
    $ethernets = hiera_hash('profiles::netplan::ethernets', {}),
){
  class { 'netplan':
    version     => $version,
    renderer    => $renderer,
    config_file => $config_file,
    ethernets   => $ethernets,
  }

  $ethernets = hiera_hash('profiles::netplan::ethernets', {})
  create_resources('netplan::ethernets', $ethernets)
}
