# Puppet manifest: example commands

# This file adds two example classes:
# - puppet::run_example: runs a one-off command via exec
# - puppet::run_daily: ensures cron is present and schedules a daily command (midnight)

class puppet::run_example {
  exec { 'run-example-command':
    command => '/usr/bin/example --flag',
    path    => ['/bin', '/usr/bin'],
    unless  => '/usr/bin/test -f /var/run/run-example-command.done',
    notify  => Service['cron'],
  }
}

class puppet::run_daily {
  package { 'cron':
    ensure => installed,
  }

  cron { 'run-example-daily':
    command => '/usr/bin/example --flag',
    user    => 'root',
    minute  => '0',
    hour    => '0',
  }
}
