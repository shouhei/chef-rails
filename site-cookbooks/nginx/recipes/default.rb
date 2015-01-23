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

service "nginx" do
    action [:enable, :start]
end

