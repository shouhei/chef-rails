#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user "nginx" do
  shell "/bin/false"
  password nil
end

package "nginx" do
  action :install
end

template "cocoico.conf" do
  path "/etc/nginx/conf.d/cocoico.conf"
  owner "root"
  group "root"
  mode 0644
end

service "nginx" do
    action [:enable, :start]
end

