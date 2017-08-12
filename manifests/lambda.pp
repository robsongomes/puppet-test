# == Class: puppet_test::lambda
#
class puppet_test::lambda {

  each ( $facts['partitions'] ) | $device, $partition | {
    notify { "Device $device com tamanho ${partition['size']}" : }
  }
}
