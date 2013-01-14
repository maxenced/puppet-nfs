# == Class: nfs::inria::idmap
#
# Setup Idmap process
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
class nfs::inria::idmap {
    $serv = $::operatingsystem ? {
        /CentOS/ => 'nfs',
        default  => 'nfs-common'
    }

    $req = $::operatingsystem ? {
        /CentOS/ => 'nfs-utils',
        default  => 'nfs-common'
    }

    service { $serv :
        ensure  => running,
        require => Package[$req]
    }

    file { '/etc/idmapd.conf':
        ensure  => present,
        content => template('nfs/idmapd.conf.erb'),
        notify  => Service[$serv]
    }
}
