class ansible::install inherits ansible {

  if($ansible::manage_package)
  {

    if($ansible::params::include_epel)
    {
      include ::epel

      Package[$ansible::params::package_name] {
        require => Class['::epel'],
      }
    }

    package { $ansible::params::package_name:
      ensure => $ansible::package_ensure,
    }
  }

}
