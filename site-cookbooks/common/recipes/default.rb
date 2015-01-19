#
# Cookbook Name:: common
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'add_epel' do
  user 'root'
    code <<-EOC
    yum -y update
  EOC
end


%w{wget gcc make git curl-devel openssl openssl-devel}.each do |pkg|
  package pkg do
    action :install
  end
end
