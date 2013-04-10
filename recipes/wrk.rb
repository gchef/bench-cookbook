install = (node[:wrk][:action] == "install")
wan_up = `host -W 1 google.com`.index(/has address/)

if install
  git node[:wrk][:dir] do
    repository node[:wrk][:repository]
    reference node[:wrk][:version]
    action :sync
    only_if { wan_up }
  end

  execute "Compiling wrk..." do
    cwd node[:wrk][:dir]
    command %{make}
    not_if "[ -x #{node[:wrk][:dir]}/wrk ]"
  end
else
  directory node[:wrk][:dir] do
    recursive true
    action :delete
  end
end

link "/usr/local/bin/wrk" do
  to "#{node[:wrk][:dir]}/wrk"
  action (install ? :create : :delete)
end
