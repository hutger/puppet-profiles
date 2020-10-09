# modules/profiles/manifests/postgresql/server.pp

class profiles::postgresql::server {
  include '::postgresql::server'
  include '::postgresql::server::contrib'
  include '::postgresql::globals'

  $dbs = hiera_hash('profiles::postgresql::server::dbs', {})
  create_resources('::postgresql::server::db', $dbs)

  $roles = hiera_hash('profiles::postgresql::server::roles', {})
  create_resources('::postgresql::server::role', $roles)
}

for i in puppet-hiera puppet-profiles puppet-roles
do
cd $i
git add *
git commit -m "Updating hiera"
git push
cd ..
done
