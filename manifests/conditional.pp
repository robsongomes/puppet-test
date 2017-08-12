class puppet_test::conditional {

  if $environment == 'production' {
    notify { 'Production é quando tá tudo pronto.' : }
  } elsif $environment == 'staging' {
    notify {' Staging é o estágio intermediário.' : }
  } else {
    notify { 'Test é ideal para experimentar coisas.' : }
  }

  unless $facts['memory']['system']['total_bytes'] > 1042087936 {
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

  notify { 'O grupo administrador dessa máquina é ${rootgroup}' : }

}
