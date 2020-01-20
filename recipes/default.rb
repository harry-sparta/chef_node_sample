#
# Cookbook:: node_sample
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# imports of recipes
include_recipe ['apt', 'nodejs']

# packages apt-get
apt_update 'update_sources' do
  action :update
end

# package
package 'nginx'

# npm pm2 install
nodejs_npm 'pm2'

execute 'ejs mongoose express' do
  command 'sudo npm install ejs mongoose express'
  action :run
end

# resource services
service 'nginx' do
  action [:start, :enable]
end

# resource template
template '/etc/nginx/sites-available/proxy.conf' do
  source 'proxy.conf.erb'
  variables proxy_port: node['nginx']['proxy_port']
  notifies :restart, 'service[nginx]'
end

# resource link
link '/etc/nginx/sites-enabled/proxy.conf' do
  to '/etc/nginx/sites-available/proxy.conf'
  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :restart, 'service[nginx]'
end

remote_directory '/home/ubuntu/app' do
  source 'app'
  owner 'root'
  group 'root'
  mode '0777'
  files_mode '0777'
  overwrite true
  recursive true
  action :create
end

# execute 'cd_app_directory' do
#   command 'cd ~/app'
#   action :run
# end
#
# execute 'app_start' do
#   command 'sudo npm start'
#   action :run
# end
