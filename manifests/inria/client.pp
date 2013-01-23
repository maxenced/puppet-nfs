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
    include nfs::inria::idmap


    $mnt = $::fqdn ? {
        /integration/ => '/srv/opennebula-storage-integration',
        default       => '/srv/opennebula-storage'
    }

    mount { '/srv':
        ensure  => mounted,
        device  => "bonfire-disk:${mnt}",
        fstype  => 'nfs',
        options => 'rw,intr,noatime,auto',
        atboot  => true,
    }
}
