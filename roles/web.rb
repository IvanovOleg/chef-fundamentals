name 'web'
description 'Web server role'
run_list 'role[base]','recipe[apache]'
default_attributes 'apache-test' => {
  'attribute1' => 'hello from attribute 1',
  'attribute2' => 'you are great!'
}
