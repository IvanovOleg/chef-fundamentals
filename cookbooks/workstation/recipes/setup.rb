#
# Cookbook:: workstation
# Recipe:: setup
#
# Copyright:: 2020, The Authors, All Rights Reserved.

package 'tree' do
end

package 'emacs'

package 'git' do
  action :install
end

package 'chrony' do
end

# node['ipaddress']
# node['memory'] ['total']

# file '/etc/motd' do
#   content "This server is the property of Oleg Ivanov
#   HOSTNAME: #{node['hostname']}
#   IPADDRESS: #{node['ipaddress']}
#   CPU: #{node['cpu']['0']['mhz']}
#   MEMORY: #{node['memory']['total']}
#   "
#   mode '0644'
#   owner 'root'
#   group 'root'
# end

template '/etc/motd' do
  source 'motd.erb'
  variables(
    name: 'Oleg Ivanov'
  )
  action :create
end

user 'user1' do
  comment 'user1'
  uid '123'
  home '/home/user1'
  shell '/bin/bash'
end

group 'admins' do
  members ['user1']
  append true # owervrite or append
end
