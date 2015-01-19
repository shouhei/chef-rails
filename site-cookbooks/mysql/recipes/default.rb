#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{mysql mysql-libs}.each do |pkg|
  package pkg do
    action :remove
  end
end

remote_file "/tmp/#{node['mysql']['file_name']}" do
  source "#{node['mysql']['remote_uri']}"
end

bash "install_mysql" do
  user "root"
  cwd "/tmp"
    code <<-EOH
    tar xf "#{node['mysql']['file_name']}"
  EOH
end

node['mysql']['rpms'].each do |rpm|
  rpm_package rpm[:package_name] do
    action :install
    source "/tmp/#{rpm[:rpm_file]}"
  end
end

service "mysql" do
    action [:enable, :start]
end
