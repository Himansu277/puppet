# Command 24: Validate the Nagios configuration (Debian/Ubuntu)

Check the Nagios configuration for syntax errors before reloading or restarting the service:

```sh
sudo nagios4 -v /etc/nagios4/nagios.cfg
```

A successful validation reports that the configuration is valid. Fix any reported errors before applying configuration changes.
