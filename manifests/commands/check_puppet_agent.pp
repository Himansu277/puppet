define puppet::commands::check_puppet_agent (
  String $command = 'puppet agent --test --no-daemonize --color=false',
  Optional[String] $cwd = undef,
  Optional[Array[String]|Hash] $environment = undef,
) {
  exec { "run_${title}_agent_check":
    command     => $command,
    path        => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
    cwd         => $cwd,
    environment => $environment,
    logoutput   => true,
    timeout     => 0,
  }
}
