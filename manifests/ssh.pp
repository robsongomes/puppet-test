# == Class: puppet_test::ssh
#
class puppet_test::ssh {

  ssh_authorized_key { 'robson':
    user => 'robson',
    type => 'ssh-rsa',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDC5lqdoWWytK4g3xZRzs/jMmlHM30RoscBur4RgvtMqRnB6idO9BujSwW1k59D6pmW3M82//YlJgdVE1R5tqOtH3O91CzMwXKKAGbKU/FyoiXvpTihY3Fbi8qZHjEn3GB/O3nPwagfA7h1ZbY1MdZ36LA0j56SuCauEceIscsG44rQlydV8LXIJhSN6b9W+2dLpmFsFDdR6J7bNsG+hvN77t7gJde8yBv55bysS6wuPkF/ruv9bQyulcTdSntmqmlL+xt+z2nBaHXd5Lh0ksTAut7ukj/7/BaPV9msQigNgP7m9bLB7hZn3a6gX2ae4l5Z4NSG3vbkjB0OApn449z',
  }
}
