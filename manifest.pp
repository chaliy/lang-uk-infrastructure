include 'docker'
include ufw

ufw::allow { 'allow-ssh-from-all':
    port => 22,
    ip   => 'any',
}

ufw::allow { 'allow-http-from-all':
    port => 80,
    ip   => 'any',
}

class {'docker::compose': 
  ensure => present,
} ->
exec { 'kill existing service':
  command   => 'docker-compose kill && docker-compose  build',
  logoutput => true,
  user      => 'root',
  path      => '/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin',
} ->
docker_compose { './docker-compose.yml':
  ensure  => present,
}

