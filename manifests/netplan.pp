# Base profile containg all the configuration
class profiles::netplan (
    $version = hiera('netplan::version', 2 ),
    $renderer = hiera('netplan::renderer', 'networkd'),
    $config_file = hiera('config_file', '/etc/netplan/01-custom.yaml'),
    $purge_config = hiera('purge_config', 'true'),
    $netplan_apply = hiera('netplan_apply', 'true'),
    $ethernets = hiera('netplan::ethernets', {}),
){
  class { 'netplan':
    version     => $version,
    renderer    => $renderer,
    config_file => $config_file,
    ethernets   => $ethernets,
}
}
