# == Class: nfs
#
# Installs and manages NFS client services.
#
# === Examples
#
# include nfs
#
# === Authors
#
# Sergey Stankevich
#
class nfs {

  # Compatibility check
  $compatible = [ 'Debian', 'Ubuntu', 'CentOS' ]
  if ! ($::operatingsystem in $compatible) {
    fail("Module is not compatible with ${::operatingsystem}")
  }

  Class['nfs::install'] -> Class['nfs::config']

  include nfs::install
  include nfs::config

}
