class site::general {

  anchor { '::site::general::begin': } ->

  class { '::resolver': } ->

  class { '::timezone': } ->

  class { '::network': } ->

  class { '::ntp': } ->

  class { '::rsyslog': } ->

  class { '::logrotate': } ->

  # Puppet + facts.d dir (should be managed by module)
  class { '::puppet': } ->
  file { '/etc/facter': ensure         => directory, } ->
  file { '/etc/facter/facts.d': ensure => directory, } ->

  # class { '::nrpe': } ->

  # Puppi. Uncomment to install (brings nagios-plugins dependencies)
  # class { '::puppi': } ->

  # class { '::mcollective': } ->

  anchor { '::site::general::end': }

}
