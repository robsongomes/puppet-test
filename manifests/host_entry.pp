<<<<<<< HEAD
define puppet_test::host_entry (
=======
define host::host_entry (
>>>>>>> b9b311cfdcc148a6cbd391e709c24147ad4540bb
  $ip,
  ) {

    unless $facts['networking']['fqdn'] == $title {
      host { $title:
        ip => $ip,
      }
    }
  }
