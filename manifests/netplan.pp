# Base profile containg all the configuration
class profiles::netplan (
){
  include 'netplan'

  class { 'netplan':
    config_file   => '/etc/netplan/01-custom.yaml',
    ethernets     => {
      'ens5' => {
        'dhcp4' => false
      }
    },
    bridges       => {
       'br0' => {
          'dhcp4' => true,
          'interfaces' => [ens5]
       }
    },
    netplan_apply => true,
  }
}
