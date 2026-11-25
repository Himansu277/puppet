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

## Install Terraform with Puppet

Run the repository's Terraform installation manifest:

```bash
sudo puppet apply terraform.pp
```

Verify the installation:

```bash
terraform version
```

See [PUPPET_COMMAND_22.md](PUPPET_COMMAND_22.md) for the Terraform command details, [PUPPET_COMMAND_26.md](PUPPET_COMMAND_26.md) for installing the AWS CLI on Ubuntu/Debian, and [PUPPET_AWS_INSTALLATION.md](PUPPET_AWS_INSTALLATION.md) for additional operating systems and AWS-specific setup.
