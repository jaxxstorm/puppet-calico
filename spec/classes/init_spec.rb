require 'spec_helper'

describe 'calico', :type => :class do

  RSpec.configure do |c|
    c.default_facts = {
      :architecture               => 'x86_64',
      :operatingsystem            => 'CentOS',
      :osfamily                   => 'RedHat',
      :operatingsystemrelease     => '7.2',
      :operatingsystemmajrelease  => '7',
      :kernel                     => 'Linux',
    }
  end

  # defaults
  context 'defaults' do
    it { should compile }
  end
  
  context "should install calico package" do
    it { should contain_package('calico-felix').with(:ensure => 'installed') }
  end

  context "should ensure service running" do
    it { should contain_service('calico-felix').with(:ensure => 'running', :enable => true) }
  end

  context "should ensure config dir exists" do
    it { should contain_file('/etc/calico').with(:ensure => 'directory')}
  end

  context "should ensure config_file exist" do
    it { should contain_file('/etc/calico/felix.cfg').with(:ensure => 'file').that_notifies('Service[calico-felix]') }
  end

  context "config_etcd_endpoints" do
    let(:params) {{ 'etcd_endpoints' => ['https://etcd1:2379', 'http://etcd2:4001']}}
    it { should contain_file('/etc/calico/felix.cfg').with_content(/https:\/\/etcd1:2379,http:\/\/etcd2:4001/) }
  end

  context "config_etcd_ssl" do
    let(:params) {{ 
      'etcd_keyfile'  => '/path/to/file.key',
      'etcd_certfile' => '/path/to/file.pem',
      'etcd_cafile'   => '/path/to/ca.pem'
    }}
    it { should contain_file('/etc/calico/felix.cfg').with_content(/EtcdKeyFile = \"\/path\/to\/file.key\"\nEtcdCertFile = \"\/path\/to\/file.pem\"\n/) }
  end

  context "config_chain_insertmode" do
    let(:params) {{ 'chain_insertmode' => 'insert' }}
    it { should contain_file('/etc/calico/felix.cfg').with_content(/ChainInsertMode = \"insert\"/) }
  end


end

