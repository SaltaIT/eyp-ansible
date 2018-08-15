class ansible::install inherits ansible {

  if($ansible::manage_package)
  {
    package { $ansible::params::package_name:
      ensure => $ansible::package_ensure,
    }
  }

}
