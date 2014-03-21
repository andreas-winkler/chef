#
# Cookbook Name:: hybris_ci
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.set['mysql']['server_root_password'] = node['hybris']['mysql']['server_root_password']
node.set['mysql']['server_repl_password'] = node['hybris']['mysql']['server_root_password']
node.set['mysql']['server_debian_password'] = node['hybris']['mysql']['server_root_password']
node.set['mysql']['bind_address'] = "127.0.0.1"

include_recipe "mysql::server"

node.set['sonar']['os_kernel'] = "linux-x86-64"
node.set['sonar']['web_port'] = node['hybris']['sonar']['web_port']

include_recipe "sonar"

include_recipe "sonar::database_mysql"

