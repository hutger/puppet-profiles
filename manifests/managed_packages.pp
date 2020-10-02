# This profile manages packages provided in hiera data to be installed
#
# Parameters:
#
# [*packages*]
#   List of packages to install. By default is empty array.
#
# [*provider*]
#   Provider to use to install packages. Defaults to YUM. Value manipulated based on the OS name fact.

class profiles::managed_packages (
  $packages = [],
) {

  case $facts['os']['name'] {
    'Windows':           { $provider = 'chocolatey' } # Apply the solaris class
    'RedHat', 'CentOS':  { $provider = 'yum'  } # Apply the redhat class
    /^(Debian|Ubuntu)$/: { $provider = 'apt'  } # Apply the debian class
    default:             { $provider = 'yum' } # Apply the generic class
  }

  if ($packages) {
    package { $packages:
      ensure   => 'installed',
      provider => $provider,
    }
  }
}
