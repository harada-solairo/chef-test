#
# Cookbook Name:: gitconfig
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'git config' do
  #user 'root'
  code <<-EOL
    git config --global url."https://".insteadOf git://
    git config --global http.postBuffer 524288000
  EOL
end

