# == Class: puppet_test::relationship
#
class puppet_test::relationship {

  notify { 'A':
    message => 'Notify A deve ser o primeiro',
    before  => Notify['B'],
  }

  notify { 'C':
    message => 'Notify C',
    require => Notify['B'],
  }

  notify { 'B':
    message => 'Notify B',
    require => Notify['A'],
  }

  notify { 'D':
    message => 'Notify D sem relacionamento',
  }
}
