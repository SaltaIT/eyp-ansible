class ansible::params {

  $package_name='ansible'
  $service_name='ansible'

  case $::osfamily
  {
    'redhat':
    {
      $include_epel=true
      case $::operatingsystemrelease
      {
        /^[7].*$/:
        {
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      case $::operatingsystem
      {
        'Ubuntu':
        {
          $include_epel=false
          case $::operatingsystemrelease
          {
            # /^18.*$/:
            # {
            # }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
