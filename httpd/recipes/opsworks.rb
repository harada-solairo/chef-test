#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "/etc/httpd/conf/httpd.conf" do
  source "httpd.conf"
  mode   644
  owner "root"
  group "root"
  action :create
end


template "/etc/httpd/ports.conf" do
  source "ports.conf"
  mode   644
  owner "root"
  group "root"
  action :create
end

