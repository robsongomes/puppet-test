# == Class: puppet_test::host
#
class puppet_test::host {

  host { 'localhost':
    ip  => '127.0.0.1',
  }

  host { $facts['networking']['fqdn']:
    ip  => $facts['networking']['interfaces']['eth1']['ip'],
  }

  puppet_test::host_entry { 'puppetagent':
    ip  => '10.20.1.3',
  }

  host::host_entry { 'puppetmaster':
    ip  => '10.20.1.2',
  }

  resources { 'host':
    purge => true,
  }
}
