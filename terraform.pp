exec { 'install_terraform':
  command => '/bin/bash -c "curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && echo \"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(. /etc/os-release && echo ${CODENAME:-${UBUNTU_CODENAME:-$VERSION_CODENAME}}) main\" | sudo tee /etc/apt/sources.list.d/hashicorp.list >/dev/null && sudo apt-get update && sudo apt-get install -y terraform"',
  unless  => 'terraform version',
  path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin'],
  timeout => 600,
}
