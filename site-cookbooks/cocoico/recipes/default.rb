#
# Cookbook Name:: cocoico
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/var/www" do
  action :create
end

directory "/var/www/cocoico" do
  user "ec2-user"
  group "ec2-user"
  mode "0755"
  action :create
end

directory "/var/www/cocoico/config" do
  user "ec2-user"
  group "ec2-user"
  mode "0755"
  action :create
end
