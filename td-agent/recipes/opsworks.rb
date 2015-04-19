
template "/etc/td-agent/td-agent.conf" do
  source "td-agent-opsworks.conf"
  mode   644
  owner "root"
  group "td-agent"
  action :create
  notifies :restart, "service[td-agent]"
end

