#
# Cookbook Name:: hybris_ci
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "hybris_base"

node.set['jenkins']['master']['install_method'] = node['hybris']['jenkins']['install_method']
node.set['jenkins']['master']['port'] = node['hybris']['jenkins']['httpPort']

if node['hybris']['jenkins']['jvm_options']
  node.set['jenkins']['master']['jvm_options'] = node['hybris']['jenkins']['jvm_options']
end

include_recipe "jenkins::master"
