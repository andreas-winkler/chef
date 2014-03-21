#
# Cookbook Name:: hybris_ci
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node.set['nexus']['port'] = node['hybris']['nexus']['port']
node.set['nexus']['context_path'] = node['hybris']['nexus']['context_path']

include_recipe "nexus::cli"
include_recipe "nexus::app"
