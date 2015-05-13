
template "/etc/td-agent/td-agent.conf" do
  source "td-agent-opsworks.conf"
  mode   "0644"
  owner  "td-agent"
  group  "td-agent"
  action :create
  notifies :restart, "service[td-agent]" 
end

execute "change permission messange" do
  command "sudo chgrp -R td-agent /var/log/messages"
  action :run
end

execute "change permission httpd" do
  command "sudo chmod -R g+rx /var/log/messages"
  action :run
end

execute "change owner messange" do
  command "sudo chown -R td-agent /var/log/httpd"
  action :run
end

execute "change owner httpd" do
  command "sudo chmod -R g+rx /var/log/httpd"
  action :run
end

service "td-agent" do
  supports :start => true, :restart => true, :enable => true
end


