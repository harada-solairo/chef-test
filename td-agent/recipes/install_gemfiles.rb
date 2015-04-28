#
# Cookbook Name:: td-agent
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


['rewrite-tag-filter','parser','config-expander','record-reformer', 'grep'].each do | pluginname |
  gem_package "fluent-plugin-#{pluginname}"do
    gem_binary "/usr/lib64/fluent/ruby/bin/fluent-gem"
    action :install
  end
end

