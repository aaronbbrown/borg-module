class borg::dhcp_server {
  class { 'dhcp' :
    dnsdomain   => ['borg.lan'],
    interfaces  => ['eth0'],
    nameservers => ['192.168.1.5'],
    ntpservers  => ['us.pool.ntp.org'],
  }

  dhcp::pool { 'borg.lan' :
    network => '192.168.1.0',
    mask    => '255.255.255.0',
    range   => ['192.168.1.151 192.168.1.200'],
    gateway => '192.168.1.1',
  }

  dhcp::host {
    'helo.borg.lan' : 
      mac => '00:16:CB:05:2C:53',
      ip  => 'helo.borg.lan';

    'anders.borg.lan' :
      mac => '00:23:df:a8:77:bc',
      ip  => 'anders.borg.lan';

    'anders-wifi.borg.lan' :
      mac => '00:24:36:b6:c1:05',
      ip  => 'anders-wifi.borg.lan';

    'tigh-wifi.borg.lan' :
      mac => '00:26:b0:fb:74:70',
      ip  => 'tigh-wifi.borg.lan';

    'boomer.borg.lan' :
      mac => '3c:07:54:1a:f4:a3',
      ip  => 'boomer.borg.lan'; 

    'boomer-wifi.borg.lan' :
      mac => '28:cf:da:ec:4a:dc',
      ip  => 'boomer-wifi.borg.lan';

    'tbolt.borg.lan' :
      mac => '10:dd:b1:b0:3a:f7',
      ip  => 'tbolt.borg.lan'; 

    'cavil.borg.lan' :
      mac => '14:10:9f:df:15:c3',
      ip  => 'cavil.borg.lan';

    'cam.borg.lan' :
      mac => '00:22:c0:00:08:8e',
      ip  => 'cam.borg.lan';

    'wap.borg.lan' :
      mac => '28:94:0f:79:d0:34',
      ip  => 'wap.borg.lan';

    'sol.borg.lan' :
      mac => 'f8:2f:5b:00:23:0c',
      ip  => 'sol.borg.lan';

    'leoben.borg.lan' :
      mac => '9c:eb:e8:06:19:7b',
      ip  => 'leoben.borg.lan';

    'printer.borg.lan' :
      mac => 'FC:15:B4:A0:98:62',
      ip  => 'printer.borg.lan';

  }
}
