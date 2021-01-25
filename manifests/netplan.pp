# Base profile containg all the configuration
class profiles::netplan (
    $version = hiera('profiles::netplan::version', 2 ),
    $renderer = hiera('profiles::netplan::renderer', 'networkd'),
    $config_file = hiera('profiles::netplan::config_file', '/etc/netplan/01-custom.yaml'),
    $purge_config = hiera('profiles::netplan::purge_config', true),
    $netplan_apply = hiera('profiles::netplan::netplan_apply', true),
){
  class { 'netplan':
    version       => $version,
    renderer      => $renderer,
    config_file   => $config_file,
    purge_config  => $purge_config,
    netplan_apply => $netplan_apply,
  }

  $ethernets = hiera_hash('profiles::netplan::ethernets', {})
  create_resources('netplan::ethernets', $ethernets)

  $bridges = hiera_hash('profiles::netplan::bridges', {})
  create_resources('netplan::bridges', $bridges)
}
