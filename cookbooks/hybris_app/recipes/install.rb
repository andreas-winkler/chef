#
# Cookbook Name:: hybris_app
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

localHybrisRoot = "#{node['hybris']['installRootPath']}"
localAppDirectory = "#{localHybrisRoot}/#{node['hybris']['deployNumber']}_#{node['hybris']['installPathPrefix']}_#{node['hybris']['version']}_#{node['hybris']['buildNumber']}"
localDataDirectory  = "#{localHybrisRoot}/#{node['hybris']['dataSubFolder']}"
localConfigDirectory  = "#{localHybrisRoot}/#{node['hybris']['configSubFolder']}"
localBackupDirectory  = "#{localHybrisRoot}/#{node['hybris']['backupSubFolder']}"

localDownloadedZip = "#{localAppDirectory}/#{node['hybris']['artefactName']}"

localPlatformDirectory = "#{localAppDirectory}/bin/platform"

# create hybris folder, if not exists
[localAppDirectory, localDataDirectory, localConfigDirectory, localBackupDirectory].each do |dirName| 
  directory "#{dirName}" do
    mode 00755
    action :create
    recursive true
  end
end

backupCommand = "tar -zcvf #{localBackupDirectory}/backup_before_#{node['hybris']['installPathPrefix']}_#{node['hybris']['version']}_#{node['hybris']['buildNumber']}.tar.gz config/ data/"

puts backupCommand

# create backup of existing data and config
execute "create backup of old data and config" do
  command "tar -zcvf #{localBackupDirectory}/backup_before_#{node['hybris']['installPathPrefix']}_#{node['hybris']['version']}_#{node['hybris']['buildNumber']}.tar.gz config/ data/"  
  cwd "#{localHybrisRoot}"
  action :run
end

# create links to data and config directory
link "#{localAppDirectory}/data" do
  to "#{localDataDirectory}"
  not_if { ::File.exists?("#{localAppDirectory}/data") }
end

link "#{localAppDirectory}/config" do
  to "#{localConfigDirectory}"
  not_if { ::File.exists?("#{localAppDirectory}/config") }
end

# download artefact
remote_file "#{localDownloadedZip}" do
  source "#{node['hybris']['artefactBaseUrl']}/#{node['hybris']['artefactName']}"
  mode 00755
end

execute "unzip #{localDownloadedZip} to #{localAppDirectory}" do
  command "unzip -u #{localDownloadedZip} -d #{localAppDirectory}"
  action :run
end

file "#{localDownloadedZip}" do
  action :delete
  not_if {node['hybris']['deleteArtefactAfterExtract'] != true}
end

# set ant environment
# and then compile
if node['hybris']['buildOnTargetSystem'] == true
  execute "set ant env and then ant all" do
    command "bash -c 'source ./setantenv.sh && ant clean all'"
    cwd "#{localPlatformDirectory}"
  end
end
