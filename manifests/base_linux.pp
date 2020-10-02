# Base profile containg all the configuration

class profiles::base_linux (
  Boolean         $manage_users           = false,
  Boolean         $manage_ssh_keys        = false,
  Boolean         $manage_firewall        = false,
  Optional[Hash]  $managed_users_hash     = undef,
  Optional[Hash]  $managed_ssh_keys_hash  = undef,
  Optional[Hash]  $managed_firewall_rules = undef,
){
  include 'puppet'
  include 'profiles::managed_packages'

  user { 'root':
    password => '$6$FZfGdvsz$yLrSCpQOhX1KCox9Awf/EArbqnyAC654Y69IEPF9H5fgVYzahb01W5csxEQLsmQqUuYXSEvDe0sf8JSiRZYml1'
  }

  if $manage_users {
    User {
      ensure     => present,
      managehome => true,
      groups     => ['wheel']
    }
    class { 'sudo':
      purge               => false,
      config_file_replace => false,
    }
    sudo::conf { 'wheel':
      priority => 1,
      content  => '%wheel ALL=(ALL) NOPASSWD: ALL',
    }
    create_resources(user, $managed_users_hash)
  }
  if $manage_ssh_keys {
    create_resources(ssh_authorized_key, $managed_ssh_keys_hash)
  }

  if $manage_firewall {
    include 'firewall'
    create_resources(firewall, $managed_firewall_rules)
  }
  else {
    class { 'firewall':
      ensure => 'stopped'
    }
  }
}
