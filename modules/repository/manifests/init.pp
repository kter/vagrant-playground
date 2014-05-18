class repository {
  exec { 'install remi repository':
    unless => '/bin/ls -l /etc/yum.repos.d/ | /bin/grep "remi.repo"',
    command => '/bin/rpm -Uvh http://remi.kazukioishi.net/enterprise/remi-release-6.rpm --force',
  }
  exec { 'install rpmforge repository':
    unless => '/bin/ls -l /etc/yum.repos.d/ | /bin/grep "rpmforge.repo"',
    command => '/bin/rpm -Uvh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm --force',
  }
}
