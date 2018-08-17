class ansible (
                $manage_package        = true,
                $package_ensure        = 'installed',
                $roles_path            = [],
                $host_key_checking     = false,
                $retry_files_enabled   = false,
                $log_path              = '/var/log/ansible.log',
              ) inherits ansible::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::ansible::install': }
  -> class { '::ansible::config': }
  -> Class['::ansible']

}
