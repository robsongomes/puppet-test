# == Class: puppet_test::ssh
#
class puppet_test::user {

  user { 'robson':
    ensure     => present,
    comment    => 'Usuário criado pelo puppet',
    home       => '/home/robson',
    managehome => true,
    password   => pw_hash('Password1', 'SHA-512', 'random'),
    groups     => ['robson'],
  }

  group { 'robson':
    gid => 2000,
  }

  file { 'private_key':
    path    => '/home/robson/.ssh/id_rsa',
    source  => "puppet:///modules/puppet_test/id_rsa",
    ensure  => file,
    owner   => 'robson',
    group   => 'robson',
    mode    => '0644',
    require => User['robson'],
  }

  file { 'public_key':
    path    => '/home/robson/.ssh/id_rsa.pub',
    source  => "puppet:///modules/puppet_test/id_rsa.pub",
    ensure  => file,
    owner   => 'robson',
    group   => 'robson',
    mode    => '0644',
    require => User['robson'],
  }
}
