#
# Cookbook Name:: hybris_ci
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "hybris_base"

if ['hybris']['install']['jenkins']
  include_recipe "hybris_ci::jenkins"
end

if ['hybris']['install']['sonar']
  include_recipe "hybris_ci::sonar"
end
