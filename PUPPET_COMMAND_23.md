# Command 23: Install and start Nagios with Puppet

Apply the Nagios installation manifest (Debian/Ubuntu):

```sh
sudo puppet apply nagios.pp
```

The manifest installs the `nagios4` package and ensures its service is enabled and running. Verify the service:

```sh
sudo systemctl status nagios4
```
