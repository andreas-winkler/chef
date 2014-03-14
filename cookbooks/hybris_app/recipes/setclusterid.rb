#
# Cookbook Name:: hybris_app
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

localHybrisRoot = "#{node['hybris']['installRootPath']}"
localAppDirectory = "#{localHybrisRoot}/#{node['hybris']['installPathPrefix']}_#{node['hybris']['version']}_#{node['hybris']['buildNumber']}"

hybris_app_propertyChanger "set clusterID" do
  propertyFile "#{localAppDirectory}/config/local.properties"
  propertyKey "cluster.id"
  propertyValue "#{node['hybris']['clusterID']}"
  createBackup false
  action :set
end
