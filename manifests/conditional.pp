# puppet_test::conditional
class puppet_test::conditional {

  if $environment == 'production' {
    notify {'This is the production environment':}
  } else {
    notify {'This is not production':}
  }

  if $environment == 'production' {
    notify { 'Production é quando tá tudo pronto.' : }
  } elsif $environment == 'staging' {
    notify {' Staging é o estágio intermediário.' : }
  } else {
    notify { 'Test é ideal para experimentar coisas.' : }
  }

  unless $facts['memory']['system']['total_bytes'] > 2147483648 {
    notify { 'Essa máquina pode rodar um puppetserver' : }
  }

  case $facts['os']['name'] {
    'CentOS' : { notify { 'Máquina RedHat. ' : } }
    'Ubuntu' : { notify { 'Máquina Debian. ' : } }
    default  : { notify { 'Máquina desconhecida. ' : } }
  }

  $rootgroup = $facts['os']['family'] ? {
    'RedHat' => 'wheel',
    'Debian' => 'root',
  }

  notify { "O grupo administrador dessa máquina é ${rootgroup}" : }

}
