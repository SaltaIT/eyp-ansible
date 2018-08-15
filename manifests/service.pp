class ansible::service inherits ansible {

  #
  validate_bool($ansible::manage_docker_service)
  validate_bool($ansible::manage_service)
  validate_bool($ansible::service_enable)

  validate_re($ansible::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${ansible::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $ansible::manage_docker_service)
  {
    if($ansible::manage_service)
    {
      service { $ansible::params::service_name:
        ensure => $ansible::service_ensure,
        enable => $ansible::service_enable,
      }
    }
  }
}
