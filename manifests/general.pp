class site::general {

  class { '::resolver':
    dns_servers => $dns_servers,
  }

  class { '::timezone':
    timezone => $timezone,
  }

  # Networking
  class { 'network': }

  # NTP
  class { 'ntp': }

  # Syslog
  class { 'rsyslog': }
  rsyslog::config { 'auth':
    content => template('enter/default/rsyslog/auth.conf.erb'),
  }

  # Logrotate
  class { 'logrotate': }

  # Puppet
  class { 'puppet': }
  file { '/etc/facter': ensure => directory, }
  file { '/etc/facter/facts.d': ensure => directory, }

  # NRPE
  # class { 'nrpe': }

  # Puppi
  include puppi

  # Mcollective
  class { 'mcollective': }

  include openssh
  include puppet

}
