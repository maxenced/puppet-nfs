# == Class: nfs::inria::client
#
# Client configuration for opennebula images
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
class nfs::inria::client {
    include nfs

    file { '/srv/opennebula-storage':
        ensure => directory
    }

    case $::hostname {
        /frontend/ : { $opts = 'rw,rsize=32768,wsize=32768,intr,noatime' }
        default    : { $opts = 'ro,rsize=32768,intr,noatime' }
    }

    mount { '/srv/cloud':
        ensure  => 'mounted',
        device  => 'bonfire-disk:/srv/opennebula-storage',
        fstype  => 'nfs',
        options => $opts,
        atboot  => true,
        require => File['/srv/opennebula-storage']
    }
}
