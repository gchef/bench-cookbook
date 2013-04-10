########################################################################## weighttp #
# https://github.com/lighttpd/weighttp
#
default[:weighttp][:action]     = "install"
default[:weighttp][:dir]        = "/usr/local/src/weighttp"
default[:weighttp][:version]    = "c24b5051c0fd6d215ed9ba385f04aed4d12d8852"
default[:weighttp][:repository] = "git://github.com/lighttpd/weighttp.git"

before_precise = (platform =~ /ubuntu/i && platform_version.to_f < 12.04)
libev = before_precise ? "libev3" : "libev4"

default[:weighttp][:packages] = ["libev-dev", libev]

############################################################################### wrk #
# https://github.com/wg/wrk
#
default[:wrk][:action]     = "install"
default[:wrk][:dir]        = "/usr/local/src/wrk"
default[:wrk][:version]    = "1.2.0 "
default[:wrk][:repository] = "git://github.com/wg/wrk.git"

############################################################################## ab.c #
# http://gwan.com/en_apachebench_httperf.html
#
default[:abc][:action] = "install"
default[:abc][:ip]     = "127.0.0.1"
default[:abc][:port]   = "80"
default[:abc][:urls]   = ["/"]
