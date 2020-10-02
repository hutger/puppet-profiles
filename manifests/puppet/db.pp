# Puppet DB profile to configure PuppetDB

class profiles::puppet::db {
  include 'profiles::base_linux'
  include 'puppetdb'
}
