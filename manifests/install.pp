class nfs::install {

  case $::operatingsystem {
      /Debian|Ubuntu/ : { package { 'nfs-common': ensure => present } }
      /CentOS/ : { package { 'nfs-common': ensure => present } }
  }

}
