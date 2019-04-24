class ansible::config inherits ansible {

  file { '/etc/ansible/ansible.cfg':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/ansiblecfg.erb"),
  }

  if($ansible::manage_logrotate)
  {
    logrotate::logs { 'ansible':
      ensure       => $ansible::logrotation_ensure,
      log          => [ '/var/log/ansible.log', '/var/log/ansible-summary.log' ],
      create_mode  => '0644',
      create_owner => 'root',
      create_group => 'root',
      frequency    => $ansible::logrotation_frequency,
      rotate       => $ansible::logrotation_rotate,
      missingok    => true,
      compress     => true,
    }
  }
}
