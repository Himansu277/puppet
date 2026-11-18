# puppet
Daily command insertion repository for puppet automation tasks.

This repository is intended to keep useful Puppet commands and automation notes in one place.

## Install Puppet Agent (Ubuntu 20.04)

```bash
wget https://apt.puppet.com/puppet7-release-focal.deb && sudo dpkg -i puppet7-release-focal.deb && sudo apt-get update && sudo apt-get install -y puppet-agent
```

Verify the installation:

```bash
/opt/puppetlabs/bin/puppet --version
```

See [PUPPET_AWS_INSTALLATION.md](PUPPET_AWS_INSTALLATION.md) for additional operating systems and AWS-specific setup instructions.
