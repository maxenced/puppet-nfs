# == Class: nfs::inria::server
#
# Setup inria exports
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
class nfs::inria::server {
    include nfs::server
    include nfs::inria::idmap

    file { '/srv/opennebula-storage':
        ensure => directory
    }

    nfs::export { '/srv/opennebula-storage':
        export => {
            '131.254.204.44'   => 'rw,sync,no_root_squash',
            '131.254.204.0/25' => 'rw,async,no_root_squash,no_subtree_check',
        }
    }

    user { 'oneadmin':
        ensure     => present,
        uid        => '502',
        gid        => '502',
        home       => '/home/oneadmin',
        shell      => '/bin/false',
        managehome => true
    }

    group { 'one':
        ensure => present,
        gid    => '502'
    }
}
