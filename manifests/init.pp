# puppet_test
class puppet_test {
  contain puppet_test::conditional
  contain puppet_test::lambda
  contain puppet_test::relationship
  contain puppet_test::host

  if $facts['os']['family'] == 'RedHat' {
    contain puppet_test::user
  } else {
    contain puppet_test::ssh
  }
}
