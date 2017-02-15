class calico::configure {

  file { $calico::config_dir :
    ensure  => directory,
    require => Package[$calico::package_name]
  }

  file { "${calico::config_dir}/${calico::config_file}" :
    ensure  => file,
    content => template('calico/felix.cfg.erb'),
  }

}
