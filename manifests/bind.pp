class borg::bind_server {
  include bind
  include bind::logging

  class { 'bind::options':
    listen_on => "any",
  }

  bind::logging::channel { "default_debug":
    channel_type => "file",
    file         => "data/named.run",
    severity     => "dynamic",
  }

  bind::zone { 'borg.lan':
    allow_update => 'none',
    allow_query  => 'any',
  }

  bind::zone::record {
    'router,A,borg.lan' : data => '192.168.1.1';
  } 
}
