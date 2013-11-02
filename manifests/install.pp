# == Class: prezto::install
#
# This is the prezto module. It installs oh-my-zsh for a user and changes
# their shell to zsh. It has been tested under Ubuntu.
#
# This module is based on acme/ohmyzsh
#
# prezto is a community-driven framework for managing your zsh configuration: https://github.com/sorin-ionescu/prezto
#
# === Parameters
#
#   [*git_repo*]
#     Set which prezto git repo to download
#     Default: git://github.com/sorin-ionescu/prezto.git
#
# === Examples
#
# class { 'prezto': }
# prezto::install { 'username': 
#   git_repo => 'git://github.com/baopham/prezto.git'
# }
#
#
define prezto::install($git_repo = 'git://github.com/sorin-ionescu/prezto.git') {
  exec { 'prezto::git clone':
    creates => "/home/${name}/.zprezto",
    command => "/usr/bin/git clone --recursive ${git_repo} /home/${name}/.zprezto",
    user    => $name,
    require => [Package['git'], Package['zsh']]
  }

  exec { 'prezto::zsh runcoms':
    command  => template("prezto/runcoms.erb"),
    user    => $name,
    require => Exec['prezto::git clone'],
    onlyif => "test ! -L /home/${name}/.zpreztorc || test ! -L /home/${name}/.zshrc || test ! -L /home/${name}/.zshenv"
  }

  user { "prezto::user ${name}":
    ensure  => present,
    name    => $name,
    shell   => '/usr/bin/zsh',
    require => Package['zsh'],
  }
}
