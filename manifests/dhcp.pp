class borg::dhcp {
  class { 'dhcp' :
    dnsdomain   => ['borg.lan'],
    interfaces  => ['eth0'],
    nameservers => ['192.168.1.4',
                    '8.8.8.8',
                    '8.8.4.4'],
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

    'cam.borg.lan' :
      mac => '00:22:c0:00:08:8e',
      ip  => 'cam.borg.lan';

    'wap.borg.lan' :
      mac => '28:94:0f:79:d0:34',
      ip  => 'wap.borg.lan';
  }
}
