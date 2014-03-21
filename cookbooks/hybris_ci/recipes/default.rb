#
# Cookbook Name:: hybris_ci
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "hybris_base"

if node['hybris']['install']['jenkins']
  include_recipe "hybris_ci::jenkins"
end

if node['hybris']['install']['sonar']
  include_recipe "hybris_ci::sonar"
end

if node['hybris']['install']['nexus']
  include_recipe "hybris_ci::nexus"
end
