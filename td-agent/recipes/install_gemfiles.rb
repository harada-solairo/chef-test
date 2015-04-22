#
# Cookbook Name:: td-agent
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


['fluent-plugin-rewrite-tag-filter','fluent-plugin-parser','fluent-plugin-config-expander','fluent-plugin-record-reformer'].each do | pluginname |
  gem_package pluginname do
    gem_binary "/usr/lib64/fluent/ruby/bin/fluent-gem"
    action :install
  end
end

