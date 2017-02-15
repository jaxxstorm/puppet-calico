class calico::install {

  package { $calico::package_name:
    ensure => $calico::package_ensure,
  }

}
