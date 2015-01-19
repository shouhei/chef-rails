#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "iptables" do
  path "/etc/sysconfig/iptables"
  owner "root"
  group "root"
  mode 0664
  notifies :restart, 'service[iptables]'
end
service "iptables" do
  supports :status => true, :restart => true
  action [:enable, :start]
end
