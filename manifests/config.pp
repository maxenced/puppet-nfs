class nfs::config {

  if $::operatingsystem == 'Debian' {
    File['/etc/default/nfs-common'] {
      notify => Service['nfs-common'],
    }
  }

  file { '/etc/default/nfs-common':
    ensure => present,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/nfs/nfs-common',
  }

}
