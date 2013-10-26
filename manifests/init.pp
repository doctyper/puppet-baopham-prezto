# == Class: prezto
#
# This is the prezto module. It installs prezto for a user and changes
# their shell to zsh. It has been tested under Ubuntu.
#
# This module is based on acme/ohmyzsh
#
# prezto is a community-driven framework for managing your zsh configuration: https://github.com/sorin-ionescu/prezto
#
# === Parameters
#
# None.
#
# === Examples
#
# class { 'prezto': }
# prezto::install { 'username': }
#
#
class prezto {
  if(!defined(Package['git'])) {
    package { 'git':
      ensure => present,
    }
  }

  if(!defined(Package['zsh'])) {
    package { 'zsh':
      ensure => present,
    }
  }

}
