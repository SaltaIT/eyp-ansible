class ansible (
                $manage_package        = true,
                $package_ensure        = 'installed',
                $roles_path            = [],
                $host_key_checking     = false,
                $retry_files_enabled   = false,
                $log_path              = '/var/log/ansible.log',
                $manage_logrotate      = true,
                $logrotation_ensure    = 'present',
                $logrotation_frequency = 'daily',
                $logrotation_rotate    = '30',
                $logrotation_size      = '100M',
              ) inherits ansible::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::ansible::install': }
  -> class { '::ansible::config': }
  -> Class['::ansible']

}
