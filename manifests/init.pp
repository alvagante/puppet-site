class site {

  anchor { '::site::begin': } ->
  class { '::site::minimal': } ->
  class { '::site::general': } ->
  anchor { '::site::end': }

  if $::role {
    Class['::site::general'] ->
    class { "::site::role::${::role}": } ->
    Anchor['::site::end']
  }

  if $debug { include site::debug }

}
