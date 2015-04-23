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

service "td-agent" do
  service_name "td-agent"
  restart_command "service httpd restart"
end


