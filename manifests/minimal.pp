# Class site::minimal
#
class site::minimal {

# Basic package management
  case $::osfamily {
    redhat: {
      class { '::yum::repo::epel': }
      package { 'redhat-lsb': ensure => present }
    }
    debian: {
      class { '::apt': }
      class { '::apt::repo::puppetlabs': }

      # Uncomment to allow unauthenticated packages
      #apt::conf { 'allow_unauthenticated':
      #  content => "// File managed by Puppet.\nAPT::Get::AllowUnauthenticated \"true\";\n",
      #}
      package { 'lsb-release': ensure => present }
    }
    suse: {
      package { 'lsb': ensure => present }
    }
  }

# Hosts file
  class { 'hosts':
    template => 'site/hosts/hosts.erb',
  }

}

