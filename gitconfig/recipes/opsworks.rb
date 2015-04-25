#
# Cookbook Name:: gitconfig
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'git config' do
  code <<-EOL
    sudo su - deploy -c 'git config --global url."https://".insteadOf git://'
    sudo su - deploy -c 'git config --global http.postBuffer 524288000'
  EOL
end

