#
# Cookbook Name:: common
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'yum update' do
  code <<-EOC
    yum -y update
  EOC
end

%w{gcc git curl-devel openssl-devel expect}.each do |pkg|
  package pkg do
    action :install
  end
end
