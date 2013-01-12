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

    mount { '/srv/opennebula-storage':
        ensure  => 'mounted',
        device  => 'bonfire-disk:/srv/opennebula-storage',
        fstype  => 'nfs',
        options => 'ro,rsize=32768,intr,noatime',
        atboot  => true,
        require => File['/srv/opennebula-storage']
    }
}
