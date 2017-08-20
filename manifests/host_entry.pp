define host::host_entry (
  $ip,
  ) {

    unless $facts['networking']['fqdn'] == $title {
      host { $title:
        ip => $ip,
      }
    }
  }
