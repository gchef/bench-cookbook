install = (node[:abc][:action] == "install")

if install
  template "/usr/local/src/ab.c" do
    owner "root"
    group "root"
    mode 0644
  end

  execute "Compiling abc..." do
    cwd "/usr/local/src"
    command %{gcc ab.c -O2 -o abc -lpthread}
  end
else
  file "/usr/local/src/ab.c" do
    action :delete
  end

  file "/usr/local/src/abc" do
    action :delete
  end
end

link "/usr/local/bin/abc" do
	to "/usr/local/src/abc"
  action (install ? :create : :delete)
end
