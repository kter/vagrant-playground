#include initial_install::package
#class {'package':}
include package
#include initial_setting
#
#class initial_install {
#  include initial_install::repository
#  include initial_install::package
#
#  Class['initial_install::repository']
#  -> Class['initial_install::package']
#}
#
#class initial_setting {
#  include initial_setting::user
#  include initial_setting::group
#
#  Class['initial_setting::group']
#  -> Class['initial_setting::user']
#}
#
#class initial_setting::group {
#  group { 'mikkumiku':
#    ensure => present,
#    gid => 3939,
#  }
#}
#class initial_setting::user {
#  user {
#    'kter':
#      ensure => present,
#      gid => 'mikkumiku',
#      home => '/home/kter',
#      managehome => true,
#      shell => '/bin/bash',
#  }
#
#  file {
#    '/home/kter/.ssh/authorized_keys':
#      owner => kter,
#      group => mikkumiku,
#      mode => 600,
#      ensure => present,
#      #source => 'puppet:///authorized_keys',
#      require => [User['kter'], File['/home/kter/.ssh']]
#  }
#
#  file {
#    '/home/kter/.ssh':
#      ensure=> directory,
#      require => User['kter']
#  } 
#  
#}
#class initial_install::repository {
#  exec { 'install additional repos':
#    unless => '/bin/ls -l /etc/yum.repos.d/ | /bin/grep "remi.repo"',
#    command => '/bin/rpm -Uvh http://remi.kazukioishi.net/enterprise/remi-release-6.rpm --force',
#  }
#}
#class initial_install::package {
#  package {
#    [
#      'vim-enhanced',
#      'zsh',
#      'tmux',
#      'git',
#      'tree',
#      'wget',
#      'nload',
#      'htop',
#      'tcpdump',
#      'telnet'
#      ]:
#        ensure => present;
#  }
#  
#  exec { 'yum Group Install':
#    unless  => '/usr/bin/yum grouplist "Development tools" | /bin/grep "^Installed Groups"',
#    command => '/usr/bin/yum -y groupinstall "Development tools"',
#  }
#}
