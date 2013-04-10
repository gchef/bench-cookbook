install = (node[:weighttp][:action] == "install")
wan_up = `host -W 1 google.com`.index(/has address/)

node[:weighttp][:packages].each do |dependency|
  package dependency do
    action (install ? :install : :remove)
  end
end

if install
  git node[:weighttp][:dir] do
    repository node[:weighttp][:repository]
    reference node[:weighttp][:version]
    action :sync
    only_if { wan_up }
  end

  execute "Compiling weighttp..." do
    cwd node[:weighttp][:dir]
    command %{gcc -g2 -O2 -DVERSION='"123"' src/*.c -o weighttp -lev -lpthread}
    not_if "[ -x #{node[:weighttp][:dir]}/weighttp ]"
  end
else
  directory node[:weighttp][:dir] do
    recursive true
    action :delete
  end
end

link "/usr/local/bin/weighttp" do
	to "#{node[:weighttp][:dir]}/weighttp"
  action (install ? :create : :delete)
end
