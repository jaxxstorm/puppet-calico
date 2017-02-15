# Private params class
class calico::params {

  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        7, '7': {
          $package_name  = 'calico-felix'
          $service_name  = 'calico-felix'
        }
        default: { fail('Calico is only available for RHEL 7') }
      }
    }
    default: { fail('Unsupported OS') }
  }

  $config_dir  = '/etc/calico'
  $config_file = 'felix.cfg'
}
