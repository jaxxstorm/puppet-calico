class calico::service {

  service { $calico::service_name:
    ensure => $calico::service_ensure,
    enable => $calico::service_enable,
  }

}
