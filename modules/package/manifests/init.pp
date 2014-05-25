class package {
  package {
    [
      'vim-enhanced',
      'zsh',
      'tmux',
      'git',
      'tree',
      'wget',
      'nload',
      'htop',
      'tcpdump',
      'telnet'
      ]:
        ensure => present;
  }
  
  exec { 'yum Group Install':
    unless  => '/usr/bin/yum grouplist "Development tools" | /bin/grep "^Installed Groups"',
    command => '/usr/bin/yum -y groupinstall "Development tools"',
  }
  file { "/etc/selinux/config":
    mode      => 644,
    owner   => root,
    group => root,
    source     => "puppet:///modules/selinux/config"
  }
}
