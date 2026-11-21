package { 'nagios4':
  ensure => installed,
}

service { 'nagios4':
  ensure  => running,
  enable  => true,
  require => Package['nagios4'],
}
