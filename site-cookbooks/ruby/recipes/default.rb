#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{libffi-devel libxml2 libxslt libxml2-devel libxslt-devel ruby-devel readline-devel gcc-c++}.each do |pkg| 
  package pkg do
    action :install
  end
end

git "/home/ec2-user/.rbenv" do
  user "ec2-user"
  group "ec2-user"
  repository "https://github.com/sstephenson/rbenv.git"
  revision "master"
  action :sync
end

directory "/home/ec2-user/.rbenv/plugins" do
  user "ec2-user"
  group "ec2-user"
  mode "0755"
  action :create
end

git "/home/ec2-user/.rbenv/plugins/ruby-build" do
  user "ec2-user"
  group "ec2-user"
  repository "https://github.com/sstephenson/ruby-build.git"
  revision   "master"
  action     :sync
end

template 'bash_profile' do
  user "ec2-user"
  group "ec2-user"
  path "/home/ec2-user/.bash_profile"
end

bash 'install-ruby' do
  user "ec2-user"
  group "ec2-user"
  not_if {::File.exists?("/home/ec2-user/.rbenv/versions/2.2.0")}
  code <<-EOC
    export HOME="/home/ec2-user"
    source /home/ec2-user/.bash_profile
    /home/ec2-user/.rbenv/bin/rbenv install 2.2.0
    /home/ec2-user/.rbenv/bin/rbenv rehash
    /home/ec2-user/.rbenv/bin/rbenv global 2.2.0
    /home/ec2-user/.rbenv/bin/rbenv exec gem install bundler
  EOC
end

