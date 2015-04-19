
template "/etc/td-agent/td-agent.conf" do
  source "td-agent-opsworks.conf"
  mode   "0644"
  owner  "td-agent"
  group  "td-agent"
  action :create
end

execute "change permission" do
  command "chgrp -R td-agent /var/log/{httpd,messages}"
  command "chmod -R g+rx /var/log/{httpd,messages}"
  command "chgrp -R td-agent /var/log/httpd/error.log"
  command "chmod -R g+rx /var/log/httpd/error.log"
end


include_recipe "td-agent::start"
