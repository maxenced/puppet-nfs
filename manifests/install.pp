class nfs::install {

  case $::operatingsystem {
      /CentOS/        : { package { 'nfs-utils' : ensure => present } }
      default         : { package { 'nfs-common': ensure => present } }
  }

}
