service "td-agent" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
