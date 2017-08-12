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
}
