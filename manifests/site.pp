class { 'postgresql::server':
  ip_mask_deny_postgres_user => '0.0.0.0/32',
  ip_mask_allow_all_users    => '0.0.0.0/0',
  listen_addresses           => '*',
  ipv4acls                   => ['host all all 0.0.0.0/0 md5']
}

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
  version      => '4.3.2',
  user         => 'sonar',
  group        => 'sonar',
  service      => 'sonar',
  jdbc         => $jdbc,
}
