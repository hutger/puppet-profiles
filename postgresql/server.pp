# modules/profile/manifests/postgresql/server.pp

class profile::postgresql::server (
  Optional[Hash]  $profile::postgresql::server::dbs = undef, 
){
  include '::postgresql::server'
  include '::postgresql::server::contrib'
  include '::postgresql::globals'

  $dbs = hiera_hash('profile::postgresql::server::dbs', {})
  create_resources('::postgresql::server::db', $dbs)

}
