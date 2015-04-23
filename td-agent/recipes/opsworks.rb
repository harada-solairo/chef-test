
service "td-anget" do
  supports :status => true, :restart => true, :reload => true
end

template "/etc/td-agent/td-agent.conf" do
  source "td-agent-opsworks.conf"
  mode   "0644"
  owner  "td-agent"
  group  "td-agent"
  action :create
end

execute "change permission" do
  command "sudo chgrp -R td-agent /var/log/messages"
  command "sudo chmod -R g+rx /var/log/messages"
  command "sudo chgrp -R td-agent /var/log/httpd"
  command "sudo chmod -R g+rx /var/log/httpd"
  notifies :restart, 'service[td-anget]'
end

include_recipe "td-agent::start"


