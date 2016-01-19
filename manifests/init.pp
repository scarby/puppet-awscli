# == Class: awscli
#
# Install awscli
#
# === Parameters
#
#  [$version]
#    Provides ability to change the version of awscli being installed.
#    Default: 'present'
#    This variable is required.
#
# === Examples
#
#  class { awscli: }
#
# === Authors
#
# Justin Downing <justin@downing.us>
#
# === Copyright
#
# Copyright 2014 Justin Downing
#
class awscli (
  $version      = 'present',
  $manage_epel = true
) {
  class{ 'awscli::deps':
    manage_epel => $awscli::manage_epel
  }

  package { 'awscli':
    ensure   => $version,
    provider => 'pip',
    require  => Class['awscli::deps'],
  }
}
