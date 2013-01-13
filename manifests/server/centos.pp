# == Class: nfs::server::centos
#
# Setup nfs server on centos
#
# === Variables
#
# === Authors
#
# Author Name Maxence Dunnewind (<maxence@dunnewind.net>)
#
# === Copyright
#
# Copyright 2013 Maxence Dunnewind
#
class nfs::server::centos {
  Package['nfs-utils'] -> Service['nfs-kernel-server']

  Nfs::Export <| |> ~> Service['nfs-kernel-server']

  package { 'nfs-kernel-server': ensure => present }

  service { 'nfs-kernel-server':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
    pattern    => 'rpc.mountd',
  }

}
