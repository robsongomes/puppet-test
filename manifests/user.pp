# == Class: puppet_test::ssh
#
class puppet_test::user {

  $private_key_content = @(END)
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEAwuZanaFlsrSuIN8WUc7P4zJpRzN9EaLHAbq+EYL7TKkZweon
    TvQbo0sFtZOfQ+qZltzPNv/2JSYHVRNUebajrR9zvdQszMFyigBmylPxcqIl76U4
    oWNxW4vKmR4xJ9xgfzt5z8GoHwO4dWW2NTHWd+iwNI+ekrgmrhHHiLHLBuOK0Jcn
    VfC1yCYUjem/VvtnS6ZhbBQ3Ueie2zbBvobze+7e4CXXvMgb+eW8rEusLj5Bf67r
    /W0MrpXE3Up7ZqppS/sbfs9pwWh13eS4dJLEwLre7pI/+/wWj1fZrEIoDYD+5vWy
    we4WZ92uoF9mnuJeWeDUht725IwdDgKZ+OPcwQIDAQABAoIBAGTIOzlhuTX0qkpD
    McZx3BwO+FOiM11IQAIL77ccdRhKJRCaJWN1ZUlGRRiE0omLKYrSebBmIYFKLeZ3
    TWp24CJorjAOJHBo4/KqjHy5dZQidt16IVOLGZYOLmCJNT/4fEmulqmw6V/IS70h
    MFxHfjCZOWyki4oxAYdnmDd+QI85eS4E8x+FiPG6hdksV1LSmpjcyAvb0unGDiCg
    PKgX8K2/ShW7xRjvivDRdiPCSgVnjz6yRlO7uIbgTTqFFqMDbCw500tVhl0IJIm9
    FFvyY7U5SU1Re1YZww+1y/RYwrt4iFhDsoa07nzeVAFNsymDmalBGhJvZoeUixFA
    VOMQRjECgYEA7IHFnv+yWMxsy9+1E0/gTYLOOO5iowV7uabz+ECPgiYEeilqkqqt
    azu9Z9RRSSppznEn/sP5pssP85RvkcCm9uwaDxVsCYnGSyDMAuVAD0JjREpD1E2M
    xBFnO+TcbpdrOwsG2VdfW3iXkuWgz2tJ0UpYCZh+zxz6snXUAy4k6EUCgYEA0vav
    I0Zh9FmOk40cI+EjvzkI3Cb5UILl5bCkvRX1I/Q77vAkwZRFbqoi3sG4dNwot8Bm
    Hn/kY86PvDe2aQRXOkP5b8jISwJClqg0cIIDw5HW3RNI7IL/iSwdgVJVg0gd0bEx
    FcFQB6mzxZILnbJJfR9oQT0vBiJE7S7rpr5CAE0CgYEAvAbkHWd92/kSGffNlv/u
    /NCcsUhcpOysE8o2tkxli3w8HP8mWlpVKybAi3aR9VBB9D2kJXia108jbGy7Uq5O
    T4sfoJRQYzjkrD/z0e1+w2LtVpKQYI4S9qI7Z7OoyEebmcJHfK1pA2jZYJEtCxpq
    AnlPirlxP6nzacQhfTHHZ90CgYAvOqra6tbjLWmN/vldzvmBxfMF1nPaYnO1iGZZ
    LqFC+1qvk3OnItqoe85ysEvrXZ6ABMLX8Sngbk4fhRmBSUd989nT/M9ae5cMw3t5
    9KGDFxNTSw34ZRtwSkAQw64BRhPm7hRfGnggPw3QHXIcS93H9VARyvDMHr/vmaGI
    IvADwQKBgQDpLJnNmGlAQpkrxBFEzKkomnMaZXO3qY9hI1EqlI4jAOBLFGtSpWbk
    wguAOYtTn2KQFKooAGHqoZ/hdy3NrCqLx3zWXipOeddHaRWkATAnrmO6fptCtcNH
    3RYjN/B35cQ0r4iPfXOsjrXgjxHEzwBfoaC4VsY2fB3p5CHjEl3xEA==
    -----END RSA PRIVATE KEY-----
    | END

  $public_key_content = @(END)
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDC5lqdoWWytK4g3xZRzs/jMmlHM30RoscBur4RgvtMqRnB6idO9BujSwW1k59D6pmW3M82//YlJgdVE1R5tqOtH3O91CzMwXKKAGbKU/FyoiXvpTihY3Fbi8qZHjEn3GB/O3nPwagfA7h1ZbY1MdZ36LA0j56SuCauEceIscsG44rQlydV8LXIJhSN6b9W+2dLpmFsFDdR6J7bNsG+hvN77t7gJde8yBv55bysS6wuPkF/ruv9bQyulcTdSntmqmlL+xt+z2nBaHXd5Lh0ksTAut7ukj/7/BaPV9msQigNgP7m9bLB7hZn3a6gX2ae4l5Z4NSG3vbkjB0OApn449zB robson@puppetmaster.example.com
    | END

  user { 'robson':
    ensure     => present,
    comment    => 'Usuário criado pelo puppet',
    home       => '/home/robson',
    managehome => true,
    password   => pw_hash('Password1', 'SHA-512', 'random'),
    groups     => ['robson'],
  }

  group { 'robson':
    gid => 2000,
  }

  file { 'private_key':
    path    => '/home/robson/.ssh/id_rsa',
    content => $private_key_content,
    ensure  => file,
    owner   => 'robson',
    group   => 'robson',
    mode    => '0644',
    require => User['robson'],
  }

  file { 'public_key':
    path    => '/home/robson/.ssh/id_rsa.pub',
    content => $public_key_content,
    ensure  => file,
    owner   => 'robson',
    group   => 'robson',
    mode    => '0644',
    require => User['robson'],
  }
}
