# == Class: nfs::server::debian
#
# Nfs server setup for debian
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
class nfs::server::debian {
  Package['nfs-kernel-server'] -> Service['nfs-kernel-server']

  Nfs::Export <| |> ~> Service['nfs-kernel-server']

  package { ['nfs-kernel-server', 'nfs-common']: ensure => present }

  service { 'nfs-kernel-server':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
    pattern    => 'rpc.mountd',
  }
}
