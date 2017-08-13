# == Class: puppet_test::ssh
#
class puppet_test::user {

  $user = 'robson'
  $group = 'robson'
  $home = "/home/${user}"

  File {
    ensure  => file,
    owner   => $user,
    group   => $group,
  }

  user { $user:
    ensure     => present,
    comment    => 'Usuário criado pelo puppet',
    home       => $home,
    managehome => true,
    password   => pw_hash('Password1', 'SHA-512', 'random'),
    groups     => $group,
  }

  group { 'robson':
    gid => 2000,
  }

  file { 'private_key':
    path    => "${home}/.ssh/id_rsa",
    source  => "puppet:///modules/puppet_test/id_rsa",
    mode    => '0600',
    require => User[$user],
  }

  file { 'public_key':
    path    => "${home}/.ssh/id_rsa.pub",
    source  => "puppet:///modules/puppet_test/id_rsa.pub",
    mode    => '0644',
    require => User['robson'],
  }
}
