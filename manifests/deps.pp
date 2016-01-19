# == Class: awscli::deps
#
# This module manages awscli dependencies and should *not* be called directly.
#
# === Authors
#
# Justin Downing <justin@downing.us>
#
# === Copyright
#
# Copyright 2014 Justin Downing
#
class awscli::deps (
  $manage_epel = true,
) {
  case $::osfamily {
    'Debian': {
      include awscli::deps::debian
    }
    'RedHat': {
      class{'awscli::deps::redhat':
        manage_epel => $awscli::deps::manage_epel,
      }
    }
    'Darwin': {
      include awscli::deps::osx
    }
    default:  { fail("The awscli module does not support ${::osfamily}") }
  }
}
