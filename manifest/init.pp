class test {

  if $environment == 'production' {
    notify {'This is the production environment'}
  } else {
    notify {'This is not production'}
  }
}
