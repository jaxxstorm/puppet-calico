# puppet-calico

[![Build Status](https://travis-ci.org/jaxxstorm/puppet-calico.svg?branch=master)](https://travis-ci.org/jaxxstorm/puppet-calico)

#### Table of Contents

1. [Module Description - What the module does and why it is useful](#module-description)
2. [Setup - The basics of getting started with puppet-calico](#setup)
    * [What puppet-calico affects](#what-puppet-calico-affects)
    * [Beginning with puppet-calico](#beginning-with-puppet-calico)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)


## Module description

This module installs and configures the calico-felix daemon on your system

## Setup

### What puppet-calico affects

  * puppet-calico will ensure the calico-felix package is installed
  * puppet-calico will ensure the service is started and running
  * puppet-calico will modify the config file for calico-felix

### Beginning with puppet-calico

Simply include the calico module like so:

```puppet
  include ::calico
```

You may want to use a class include if you wish to override parameters:

```puppet
  class { '::calico' :
		config_dir => '/etc/calico-felix'
  }
```

## Usage

### I just want to manage calico, what's the minimum I need

```puppet
  include ::calico
```

### I want to set different etcd endpoints

Set the etcd_endpoints param

```puppet
  ::calico {
    etcd_endpoints => ['https://etcd1:2379','http://etcd2:4001'],
  }
```

## Reference

### Classes

#### Public Classes
  * [`calico`](#calico): Installs and configures calico in your environment.

#### Private Classes
  * [`calico::install`]: Installs the required calico package
  * [`calico::configure`]: Configures calico's required directories
  * [`calico::service`]: Manages the calico service
  

### `calico`

#### Parameters

##### `package_name` [String]

Specifies the package to install for calico

##### `package_ensure` [String]

Specifies the version of the calico package to install (default: calico-felix)

##### `service_name` [String]

Specifies the calico service to manage (default: calico-felix)

##### `service_ensure` [String]

Specifies the state of the calico service (running, stopped - default: running)

##### `service_enable` [Bool]

Specifies whether the calico service should be enabled on startup (true, false - default: true)

##### `config_dir` [String]

Specifies the path to the configuration directory for calico (default: `/etc/calico`)

##### `config_file` [String]

Specifies the name of a configuration file for calico (default: `felix.cfg`)

##### `calico_hostname` [String]

Specifies a calico/felix hostname in the config file (default: `::hostname`)

##### `etcd_endpoints` [Array]

Specifies etcd endpoints to connect to (default: `['http://localhost:2379']`)

##### `etcd_keyfile` [String]

Specifies the path to a private key when connecting to etcd over SSL (default: `undef`)

##### `etcd_certfile` [String]

Specifies the path to a certfile when connecting to etcd over SSL (default: `undef`)

##### `etcd_cafile` [String]

Specifies the path to a cafile when connecting to etcd over SSL (default: `undef`)

## Limitations
