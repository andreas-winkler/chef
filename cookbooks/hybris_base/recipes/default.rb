#
# Cookbook Name:: hybris_base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.set['java']['jdk_version'] = node['hybris']['java']['jdk_version']
node.set['java']['jdk']['7']['x86_64']['url'] = node['hybris']['java']['jdk']['7']['x86_64']['url']
node.set['java']['jdk']['7']['x86_64']['checksum'] = node['hybris']['java']['jdk']['7']['x86_64']['checksum']
node.set['java']['java_home'] = node['hybris']['java']['java_home']
node.set['java']['install_flavour'] = node['hybris']['java']['install_flavour']
node.set['java']['oracle']['accept_oracle_download_terms'] = node['hybris']['java']['oracle']['accept_oracle_download_terms']

#install java oracle jdk7
include_recipe "java::oracle"

package "unzip" do
  action :install
end

