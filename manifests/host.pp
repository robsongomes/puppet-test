# == Class: puppet_test::host
#
class puppet_test::host {

  host { 'puppetagent':
    ip           => '10.20.1.3',
    host_aliases => ['puppetagent', 'agent', 'puppetagent.example.com'],
  }
}
