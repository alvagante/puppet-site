# Class site::minimal
#
class site::minimal {

  anchor { '::site::minimal::begin': } ->

  case $::osfamily {
    redhat: {
      class { '::yum::repo::epel': }
    }
    debian: {
      class { '::apt': } ->
      class { '::apt::repo::puppetlabs': }

      # Uncomment to allow unauthenticated packages
      #apt::conf { 'allow_unauthenticated':
      #  content => "// File managed by Puppet.\nAPT::Get::AllowUnauthenticated \"true\";\n",
      #}
    }
    suse: {
    }
  }

# Hosts file
  class { '::lsb': } ->
  class { '::hosts':
    template => 'site/hosts/hosts.erb',
  } ->

  anchor { '::site::minimal::end': }

}

