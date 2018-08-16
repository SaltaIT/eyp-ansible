class ansible::config inherits ansible {

  file { '/etc/ansible/ansible.cfg':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    cotent => template("${module_name}/ansiblecfg.erb"),
  }

}
