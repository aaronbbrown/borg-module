class borg::bind_server {
  include dns::server 
  dns::zone { 'borg.lan':
    soa         => 'ns1.borg.lan',
    soa_email   => 'aaron.9minutesnooze.com',
    nameservers => ['ns1', 'ns2']
  }

  include borg::bind_server::borg_lan

}

class borg::bind_server::borg_lan {
  $domain = 'borg.lan'
  Dns::Record::A     { zone => $domain }
  Dns::Record::Cname { zone => $domain }

  dns::record::a {
    'router'     : data => ['192.168.1.1'];
    'locutus'    : data => ['192.168.1.2'];
    'router2'    : data => ['192.168.1.3'];
    'tigh'       : data => ['192.168.1.4'];
    'ns1'        : data => ['192.168.1.4'];
    'helo'       : data => ['192.168.1.10'];
    'anders'     : data => ['192.168.1.12'];
    'anders-wifi': data => ['192.168.1.13'];
    'tigh-wifi'  : data => ['192.168.1.21'];
    'boomer'     : data => ['192.168.1.30'];
    'boomer-wifi': data => ['192.168.1.31'];
    'cam'        : data => ['192.168.1.32'];
    'wap1'       : data => ['192.168.1.101'];
  }

  dns::record::cname {
    'deb'   : data => "locutus.${domain}";
    'tv'    : data => "tigh.${domain}";
    'sb'    : data => "tigh.${domain}";
    'remote': data => "tigh.${domain}";
    'puppet': data => "locutus.${domain}";
    'wap'   : data => "wap1.${domain}";
  }
}
