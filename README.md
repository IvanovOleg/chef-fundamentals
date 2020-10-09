# chef-fundamentals

chef generate cookbook apache

chef generate recipe apache server

chef exec ruby -c apache/recipes/default.rb # check syntax

sudo chef-client -z -r "recipe[apache]"

sudo chef-client -z -r "recipe[workstation::setup]"

sudo chef-client -z --runlist "apache::server"

sudo chef-client -z apache/recipes/server.rb

ohai

ohai ipaddress

ohai memory/total

chef generate template cookbooks/workstation motd

chef generate template cookbooks/apache index.html

chef exec ruby -v

chef exec ruby -c cookbooks/apache/recipes/server.rb

chef env

chef shell-init --help

cookstyle -a

kitchen create

kitchen list

kitchen login

kitchen converge

chef exec rspec spec/unit/recipes/default_spec.rb

knife client list

knife ssl check

knife cookbook list

knife cookbook upload cookbooks/workstation

knife bootstrap 172.29.85.26 --ssh-port 22 --ssh-user vagrant --sudo --ssh-identity-file 'C:\Users\dlj\chef\.vagrant\machines\web1\hyperv\private_key' -N web1

knife bootstrap 172.29.85.234 --ssh-port 22 --ssh-user vagrant --sudo --ssh-identity-file 'C:\Users\dlj\chef\.vagrant\machines\lb\hyperv\private_key' -N lb --run-list 'recipe[myhaproxy]'

knife node show web1

knife node run_list add web1 "recipe[workstation],recipe[apache]"

berks install

berks upload

berks upload --force

knife cookbook show myhaproxy

knife node show lb

knife node show lb -a cookbooks

knife node run_list set lb "recipe[mychef-client],recipe[myhaproxy]"

knife role list

knife role show web

knife role from file roles/web.rb

knife node run_list set web1 "role[web]"

knife ssh 172.29.92.234 'sudo chef-client' --manual-list --ssh-user vagrant --ssh-identity-file 'C:\Users\dlj\chef\.vagrant\machines\lb\hyperv\private_key'

knife ssh "*:*" -x chef -P chef "sudo chef-client"

knife ssh "role:web" -x chef -P chef "sudo chef-client"

knife search node "*:*"

knife search node "*:*" -a ipaddress

knife search node "name:web1"

knife search node "name:web*"

knife search node "name:web?"

knife search node "role:web"

knife search node "role:web AND recipes:apache"

knife environment list

knife environment show _default

knife environment from file .\environments\production.rb

knife node environment set web1 production

knife data bag list

knife data bag create users

knife data bag from file users data_bags\users\user1.json data_bags\users\user2.json

knife data bag show users

knife search users "*:*"

openssl rand -base64 512 | tr -d '\r\n' > secret-key

knife data bag create secret-users --secret-file secret-key

knife data bag from file secret-users data_bags\users\julia.json --secret-file .\secret-key

knife data bag show secret-users julia --secret-file .\secret-key

knife vault list
