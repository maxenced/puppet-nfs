# == Class: nfs::server
#
# Installs and manages NFS server.
#
# === Examples
#
# include nfs::server
#
# === Authors
#
# Sergey Stankevich
#
class nfs::server {

  # Compatibility check
  $compatible = [ 'Debian', 'Ubuntu', 'CentOS' ]
  if ! ($::operatingsystem in $compatible) {
    fail("Module is not compatible with ${::operatingsystem}")
  }

  case $::operatingsystem {
      /Debian|Ubuntu/ : { include nfs::server::debian }
      /CentOS/        : { include nfs::server::centos }
  }

  include concat::setup

  concat { '/etc/exports':
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    notify => Service['nfs-kernel-server'],
  }

}
