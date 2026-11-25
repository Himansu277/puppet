# Command 26: Install AWS CLI on Ubuntu/Debian

Install the AWS Command Line Interface from the distribution package repository, then verify it is available:

```bash
sudo apt-get update
sudo apt-get install -y awscli
aws --version
```

This command is for Ubuntu/Debian hosts with `sudo` privileges. Configure credentials separately using your organization's approved method before making AWS API calls.
