#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "perl-Data-Dumper" do
  action :install
end

%w{mysql mysql-libs mysql mysql-devel mysql-server mysql-utilities}.each do |pkg|
  package pkg do
    action :remove
  end
end

#remote_file "/tmp/#{node['mysql']['file_name']}" do
#  source "#{node['mysql']['remote_uri']}"
#end
#
#bash "install_mysql" do
#  user "root"
#  cwd "/tmp"
#    code <<-EOH
#    tar xf "#{node['mysql']['file_name']}"
#  EOH
#end
#
#node['mysql']['rpms'].each do |rpm|
#  rpm_package rpm[:package_name] do
#    action :install
#    source "/tmp/#{rpm[:rpm_file]}"
#  end
#end

remote_file "#{Chef::Config[:file_cache_path]}/mysql-community-release-el6-4.noarch.rpm" do
  source "http://repo.mysql.com/mysql-community-release-el6-4.noarch.rpm"
  action :create
end

package "mysql-community-release-el6-4.noarch.rpm" do
  source "#{Chef::Config[:file_cache_path]}/mysql-community-release-el6-4.noarch.rpm"
  action :install
end

bash "yum-update" do
  code <<-EOC
    yum -y update
  EOC
end

%w{mysql mysql-devel mysql-server mysql-utilities}.each do |pkg|
  package pkg do
    action :install
    options "--enablerepo=mysql56-community"
  end
end

service "mysqld" do
  action [:enable, :start]
end

# todo
#template "setup_mysql" do
#  path "/home/ec2-user/setup_mysql"
#end
