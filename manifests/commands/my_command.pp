define puppet::commands::my_command (
  String $command = '/bin/echo Hello, Puppet!',
  Optional[String] $cwd = undef,
  Optional[Array[String]|Hash] $environment = undef,
) {
  exec { "run_${title}_command":
    command     => $command,
    path        => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
    cwd         => $cwd,
    environment => $environment,
    logoutput   => true,
    timeout     => 0,
  }
}
