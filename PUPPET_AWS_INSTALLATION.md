# Puppet Installation Commands for AWS

This document contains puppet installation commands optimized for AWS environments.

## Prerequisites
- AWS EC2 instance (Amazon Linux 2, Ubuntu, CentOS, or RHEL)
- Root or sudo access
- Internet connectivity

## 1. Amazon Linux 2

```bash
# Update system packages
sudo yum update -y

# Install puppet repository
sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-7.noarch.rpm

# Install puppet agent
sudo yum install -y puppet-agent

# Start puppet service
sudo systemctl start puppet
sudo systemctl enable puppet

# Verify installation
/opt/puppetlabs/bin/puppet --version
```

## 2. Ubuntu / Debian

```bash
# Update system packages
sudo apt-get update -y

# Install wget and add puppet repository
sudo apt-get install -y wget curl gnupg

# Add Puppet repository
wget https://apt.puppet.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt-get update -y

# Install puppet agent
sudo apt-get install -y puppet-agent

# Start puppet service
sudo systemctl start puppet
sudo systemctl enable puppet

# Verify installation
/opt/puppetlabs/bin/puppet --version
```

## 3. CentOS / RHEL

```bash
# Update system packages
sudo yum update -y

# Install puppet repository
sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-8.noarch.rpm

# Install puppet agent
sudo yum install -y puppet-agent

# Start puppet service
sudo systemctl start puppet
sudo systemctl enable puppet

# Verify installation
/opt/puppetlabs/bin/puppet --version
```

## 4. Configure Puppet Agent for AWS

```bash
# Edit puppet configuration file
sudo nano /etc/puppetlabs/puppet/puppet.conf

# Add the following configuration:
# [main]
# server = <puppet-master-hostname-or-ip>
# environment = production

# Restart puppet service
sudo systemctl restart puppet

# Check puppet agent status
sudo /opt/puppetlabs/bin/puppet agent --test
```

## 5. Puppet Agent Service Management

```bash
# Start puppet service
sudo systemctl start puppet

# Stop puppet service
sudo systemctl stop puppet

# Restart puppet service
sudo systemctl restart puppet

# Check puppet service status
sudo systemctl status puppet

# View puppet agent logs
sudo tail -f /var/log/puppetlabs/puppet/puppet.log
```

## 6. Quick Installation Script (Universal)

```bash
#!/bin/bash
set -e

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VERSION=$VERSION_ID
fi

# Install based on OS
case "$OS" in
    amzn)
        # Amazon Linux
        sudo yum update -y
        sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-7.noarch.rpm
        sudo yum install -y puppet-agent
        ;;
    ubuntu|debian)
        # Ubuntu/Debian
        sudo apt-get update -y
        sudo apt-get install -y wget curl gnupg
        wget https://apt.puppet.com/puppet7-release-focal.deb
        sudo dpkg -i puppet7-release-focal.deb
        sudo apt-get update -y
        sudo apt-get install -y puppet-agent
        ;;
    centos|rhel)
        # CentOS/RHEL
        sudo yum update -y
        sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
        sudo yum install -y puppet-agent
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

# Start puppet service
sudo systemctl start puppet
sudo systemctl enable puppet

echo "Puppet agent installation completed!"
/opt/puppetlabs/bin/puppet --version
```

## 7. Puppet Master Installation on AWS

```bash
# For Ubuntu/Debian
sudo apt-get update -y
sudo apt-get install -y puppetserver

# For Amazon Linux/CentOS
sudo yum update -y
sudo yum install -y puppetserver

# Start puppetserver
sudo systemctl start puppetserver
sudo systemctl enable puppetserver

# Verify installation
sudo /opt/puppetlabs/bin/puppetserver -v
```

## 8. AWS Systems Manager Integration

```bash
# Run puppet agent via AWS Systems Manager Session Manager
aws ssm start-session --target <instance-id>

# Then inside the session:
sudo /opt/puppetlabs/bin/puppet agent --test
```

## Troubleshooting

```bash
# Check if puppet service is running
sudo systemctl is-active puppet

# Check puppet agent logs
sudo tail -n 100 /var/log/puppetlabs/puppet/puppet.log

# Run puppet agent in debug mode
sudo /opt/puppetlabs/bin/puppet agent --test --debug

# Verify connectivity to puppet master
nc -zv <puppet-master-hostname> 8140
```

## References
- [Official Puppet Documentation](https://puppet.com/docs/puppet/latest/server/install_from_packages.html)
- [Puppet Agent Installation](https://puppet.com/docs/puppet/latest/install_linux.html)
