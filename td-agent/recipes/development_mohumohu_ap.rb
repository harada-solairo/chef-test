#
# Cookbook Name:: td-agent
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "/etc/td-agent/td-agent.conf" do
  source "td-agent.conf"
  mode   644
  owner "root"
  group "td-agent"
  action :create
end
