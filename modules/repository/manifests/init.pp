class repository {
  exec { 'install additional repos':
    unless => '/bin/ls -l /etc/yum.repos.d/ | /bin/grep "remi.repo"',
    command => '/bin/rpm -Uvh http://remi.kazukioishi.net/enterprise/remi-release-6.rpm --force',
  }
}
