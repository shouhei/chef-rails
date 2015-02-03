#
# Cookbook Name:: zabbix
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{Chef::Config[:file_cache_path]}/zabbix-release-2.4-1.el6.noarch.rpm" do
  source "#{node['zabbix']['repo']}"
  action :create
end

rpm_package "zabbix-release-2.4-1.el6.noarch.rpm" do
  source "#{Chef::Config[:file_cache_path]}/zabbix-release-2.4-1.el6.noarch.rpm"
  action :install
end

%w{agent}.each do |pkg|
  package "zabbix-"+pkg do
    action :install
  end
end

template "zabbix_agentd.conf" do
  path "/etc/zabbix/zabbix_agentd.conf"
  owner "root"
  group "root"
  mode 0644
end


service "zabbix-agent" do
  action [:enable, :start]
end
