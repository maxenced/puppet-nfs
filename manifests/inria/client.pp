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


    mount { '/srv':
        ensure  => mounted,
        device  => 'bonfire-disk:/srv/opennebula-storage',
        fstype  => 'nfs',
        options => 'rw,intr,noatime',
        atboot  => true,
    }
}
