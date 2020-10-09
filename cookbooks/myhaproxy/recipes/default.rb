#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# frozen_string_literal: true

# node.default['haproxy']['members'] = [
#   {
#     'hostname' => 'web1',
#     'ipaddress' => '172.29.85.26',
#     'port' => 80,
#     'ssl_port' => 80,
#   },
#   {
#     'hostname' => 'web2',
#     'ipaddress' => '172.29.90.238',
#     'port' => 80,
#     'ssl_port' => 80,
#   },
# ]

haproxy_install 'package'

haproxy_frontend 'http-in' do
  bind '*:80'
  default_backend 'servers'
end

all_web_nodes = search('node', "role:web AND chef_environment:#{node.chef_environment}")
# Indexes: client, node, role, environment

servers = []

all_web_nodes.each do |web_node|
  server = "#{web_node['hostname']} #{web_node['ipaddress']}:80 maxconn 32"
  servers.push(server)
end

haproxy_backend 'servers' do
  # server [
  #   'web1 172.29.85.26:80 maxconn 32',
  #   'web2 172.29.90.238:80 maxconn 32'
  # ]

  server servers

  # notifies :reload, 'haproxy_service[haproxy]', :immediately
end

haproxy_service 'haproxy' do
  subscribes :reload, 'template[/etc/haproxy/haproxy.cfg]', :immediately
end

# include_recipe 'haproxy::manual'
