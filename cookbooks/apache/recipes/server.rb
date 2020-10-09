#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# notifies :action, 'resource[name]', :timer
# subscribes :action, 'resource[name]', :timer
#
# :before, :delayed, :immediately

package 'httpd' do
  action :install
end

# file '/var/www/html/index.html' do
#   content "<h1>Hello, World!</h1>
#   <p>Your hostname is: #{node['hostname']}</p>
#   <p>Your ip address is : #{node['ipaddress']}</p>
#   "
# end

remote_file '/var/www/html/cat.png' do
  source 'https://icatcare.org/app/uploads/2018/07/Thinking-of-getting-a-cat.png'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    name: 'Oleg Ivanov'
  )
  action :create
end

cookbook_file '/var/www/html/error.html' do
  source 'error.html'
  action :create
  # notifies :restart, 'service[httpd]', :immediately
end

bash 'inline_script' do
  user 'root'
  code 'mkdir -p /var/www/mysites/ && chown -R apache /var/www/mysites'
  # not_if '[ -d /var/www/mysites ]'
  not_if do
    File.directory?('/var/www/mysites')
  end
  # only_if
end

execute 'run a script' do
  user 'root'
  command <<-EOH
  mkdir -p /var/www/mysites/ /
  chown -R apache /var/www/mysites/
  EOH
  not_if '[ -d /var/www/mysites ]'
end

# execute 'run a script' do
#   user 'root'
#   command './myscript.sh'
#   not_if
# end

directory '/var/www/mysites' do
  owner 'apache'
  recursive true
end

service 'httpd' do
  action [:enable, :start]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end
