class account {
  include account::user
  include account::group

  Class['account::group']
  -> Class['account::user']
}

class account::group {
  group { 'mikkumiku':
    ensure => present,
    gid => 3939,
  }
}
class account::user {
  user {
    'kter':
      ensure => present,
      gid => 'mikkumiku',
      home => '/home/kter',
      managehome => true,
      shell => '/bin/bash',
  }

  file {
    '/home/kter/.ssh/authorized_keys':
      owner => kter,
      group => mikkumiku,
      mode => 600,
      ensure => present,
      #source => 'puppet:///authorized_keys',
      require => [User['kter'], File['/home/kter/.ssh']]
  }

  file {
    '/home/kter/.ssh':
      ensure=> directory,
      require => User['kter']
  } 
  
}


#class account {
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
