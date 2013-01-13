# == Define: nfs::export
#
# Exports NFS share.
#
# === Parameters
#
# [*ensure*]
#  present / absent. Default: present
#
# [*export*]
#  A hash of hosts and options for an export. Allows one to specify
#  a single nfs export with multiple hosts & options per host
#
# === Examples
#
# include nfs::server
#
# nfs::export { '/data/nfs':
#   export => {
#     # host           options
#     '10.1.1.0/24' => 'rw,sync,no_root_squash,no_subtree_check',
#     '192.168.1.1' => 'ro,async',
#   },
# }
#
# === Authors
#
# Sergey Stankevich
# Steffen L. Norgren
#
define nfs::export (
  $ensure = present,
  $export = {},
  $order  = '10'
) {

  concat::fragment { "nfs_export_${name}":
    ensure  => $ensure,
    target  => '/etc/exports',
    order   => $order,
    content => template('nfs/exports.erb'),
  }

}
