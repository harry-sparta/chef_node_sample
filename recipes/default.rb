#
# Cookbook:: node_sample
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# imports of recipes
include_recipe ['apt', 'nodejs']

# packages apt-get
apt_update
package 'npm'
package 'nginx'

# npm install
nodejs_npm 'pm2'

# services
service 'nginx' do
  action [:start, :enable]
end
