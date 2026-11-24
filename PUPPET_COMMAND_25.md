# Command 25: Install Puppet Agent on Ubuntu 20.04

Add the Puppet 7 package repository, install the agent, and verify the installation:

```bash
wget https://apt.puppet.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt-get update
sudo apt-get install -y puppet-agent
/opt/puppetlabs/bin/puppet --version
```

This command is for Ubuntu 20.04 (Focal). Run it on a trusted host with sudo privileges.
