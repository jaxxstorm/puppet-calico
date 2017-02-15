# Install and manage calico
#
# @example Including the class
#   include ::calico
#
# @param [String] package_name the calico package to install
# @param [String] package_ensure the package status for calico
# @param [String] service_name the calico service to manage
# @param [String] service_ensure the status of the calico service
# @param [Bool]   service_enable the startup status of the calico service
# @param [String] config_dir the config directory for calico
# @param [String] config_file the config file name for calico
# @param [String] calico_hostname the hostname to set in the config file
# @param [Array]  etcd_endpoint an array of etcd endpoint to connect to
# @param [String] etcd_keyfile path to a keyfile for etcd connectivity
# @param [String] etcd_certfile path to a cert file for etcd connectivity
# @param [String] etcd_cafile path to a ca file for etcd connectivity
class calico (
  $package_name     = $calico::params::package_name,
  $package_ensure   = 'installed',
  $service_name     = $calico::params::service_name,
  $service_ensure   = 'running',
  $service_enable   = true,
  $config_dir       = $calico::params::config_dir,
  $config_file      = $calico::params::config_file,
  # config options
  $calico_hostname  = "${::fqdn}",
  $etcd_endpoints   = ['http://localhost:2379'],
  $etcd_keyfile     = undef,
  $etcd_certfile    = undef,
  $etcd_cafile      = undef
) inherits calico::params {

  class  { 'calico::install': } ->
  class  { 'calico::configure': } ->
  class  { 'calico::service': }

}
