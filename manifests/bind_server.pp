class borg::bind_server {
  include dns::server 
  include borg::bind_server::borg_lan
  include borg::bind_server::9minutesnooze

}

class borg::bind_server::borg_lan {
  $domain = 'borg.lan'
  dns::zone { $domain:
    soa         => "ns1.${domain}",
    soa_email   => 'aaron.9minutesnooze.com',
    nameservers => ['ns1', 'ns2']
  }

  Dns::Record::A     { zone => $domain }
  Dns::Record::Cname { zone => $domain }

  dns::record::a {
    'router'     : data => '192.168.1.1';
    'locutus'    : data => '192.168.1.2';
    'router2'    : data => '192.168.1.3';
    'tigh'       : data => '192.168.1.4';
    'ns1'        : data => '192.168.1.4';
    'zarek'      : data => '192.168.1.5';
    'leoben'     : data => '192.168.1.6';
    'helo'       : data => '192.168.1.10';
    'anders'     : data => '192.168.1.12';
    'anders-wifi': data => '192.168.1.13';
    'tigh-wifi'  : data => '192.168.1.21';
    'boomer'     : data => '192.168.1.30';
    'boomer-wifi': data => '192.168.1.31';
    'cam'        : data => '192.168.1.32';
    'cavil'      : data => '192.168.1.33';
    'tbolt'      : data => '192.168.1.34';
    'sol'        : data => '192.168.1.35';
    'wap1'       : data => '192.168.1.101';
  }

  dns::record::cname {
    'deb'   : data => "locutus.${domain}";
    'tv'    : data => "tigh.${domain}";
    'sb'    : data => "tigh.${domain}";
    'cp'    : data => "tigh.${domain}";
    'remote': data => "tigh.${domain}";
    'puppet': data => "locutus.${domain}";
    'wap'   : data => "wap1.${domain}";
  }
}

class borg::bind_server::9minutesnooze {
  $domain = '9minutesnooze.com'
  dns::zone { $domain:
    soa         => "ns1.${domain}",
    soa_email   => 'aaron.9minutesnooze.com',
    nameservers => ['mark.ns.cloudflare.com', 'dina.ns.cloudflare.com']
  }

  Dns::Record::A     { zone => $domain }
  Dns::Record::Cname { zone => $domain }
  Dns::Record::Mx {
    zone => $domain,
    data => 'aspmx.l.google.com' 
  }

  dns::record::a { "at-${domain}" : 
    host => '@',
    data => '184.72.216.104';
  }

  dns::record::cname {
    [ 'blog',
      'ec2',
      'git',
      'www',
      'cam',
      'static',
      'gallery' ] : data => '@'; 

    'home'    : data => 'locutus.borg.lan';
    ['nn','sabnzbd','q'] :
      data => 'tigh.borg.lan';
    's-blog'  : data => 'd2nn4xotbgolll.cloudfront.net';
    "puppet-${domain}": 
      host  => 'puppet',
      data  => 'locutus.borg.lan';
  }

  dns::record::mx {
    "at-${domain}"   : host => '@';
    "mail-${domain}" : host => 'mail';
  }

}
