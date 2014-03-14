#
# Cookbook Name:: hybris_app
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
# Cookbook Name:: hybris_app
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

localHybrisRoot = "#{node['hybris']['installRootPath']}"

hybris_app_propertyChanger "read last build number" do
  propertyFile "#{localHybrisRoot}/lastDeployId"
  propertyKey "lastDeployId"
  createBackup false
  action :read
end

deployNumber = 0.to_i

if node['hybris']['readedValue'].nil? || node['hybris']['readedValue'].empty?
    deployNumber = 1.to_i
else
    deployNumber = "#{node['hybris']['readedValue']}".to_i + 1
end

hybris_app_propertyChanger "set new build number" do
  propertyFile "#{localHybrisRoot}/lastDeployId"
  propertyKey "lastDeployId"
  propertyValue deployNumber.to_s
  createBackup false
  action :set
end

node.set['hybris']['deployNumber'] = deployNumber.to_s.rjust(4, "0")
