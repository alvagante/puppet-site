class site::roles::log {
  class { 'logstash':
  }
  class { '::elasticsearch':
  }
  class { '::kibana':
  }
}
