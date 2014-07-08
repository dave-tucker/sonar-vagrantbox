class { 'postgresql::server': }

postgresql::server::db { 'sonar':
  user     => 'sonar',
  password => postgresql_password('sonar', 'sonar'),
}

$jdbc = {
  url               => 'jdbc:postgresql://localhost/sonar',
  username          => 'sonar',
  password          => 'sonar',
}

class { 'java':
  distribution => 'jdk',
  version      => 'latest',
}

class { 'maven::maven' : } ->
class { 'sonarqube' :
  arch         => 'linux-x86-64',
  version      => '3.7.1',
  user         => 'sonar',
  group        => 'sonar',
  service      => 'sonar',
  jdbc         => $jdbc,
}
