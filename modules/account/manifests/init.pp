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
      source => 'puppet:///modules/authorized_keys/kter',
      require => [User['kter'], File['/home/kter/.ssh']]
  }

  file {
    '/home/kter/.ssh':
      owner => kter,
      group => mikkumiku,
      mode => 700,
      ensure=> directory,
      require => User['kter']
  } 
  
}

