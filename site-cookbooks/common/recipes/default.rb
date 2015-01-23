#
# Cookbook Name:: common
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{gcc git curl-devel openssl-devel}.each do |pkg|
  package pkg do
    action :install
  end
end
