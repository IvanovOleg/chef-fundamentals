name 'lb'
description 'Load balancer role'
run_list 'recipe[myhaproxy]'
default_attributes 'haproxy' => {
  'members' => [
    {
      'hostname' => 'web1',
      'ipaddress' => '172.29.85.26',
      'port' => 80,
      'ssl_port' => 80,
    },
    {
      'hostname' => 'web2',
      'ipaddress' => '172.29.90.238',
      'port' => 80,
      'ssl_port' => 80,
    }
  ]
}
