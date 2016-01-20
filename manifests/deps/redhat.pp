# == Class: awscli::deps::redhat
#
# This module manages awscli dependencies for redhat $::osfamily.
#
class awscli::deps::redhat (
  $manage_epel = false,
) {
  if $manage_epel {
    include ::epel
    Package { require => Class['epel'] }
  }
  #so the package from epel actually puts python-pip as pip command in path
  #puppet expects python-pip

  file{'/usr/bin/pip-python':
    ensure => 'link',
    target => '/usr/bin/pip',
  }

  if ! defined(Package['python-devel']) {
    package { 'python-devel':
      ensure  => installed,
      require => File['/usr/bin/pip-python']
    }
  }
  if ! defined(Package['python-pip']) {
    package { 'python-pip':
      ensure  => installed,
      require => File['/usr/bin/pip-python']
    }
  }
}
