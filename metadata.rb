maintainer        "Gerhard Lazu"
maintainer_email  "gerhard@lazu.co.uk"
license           "Apache 2.0"
description       "Installs various HTTP benchmarking tools, because ab is not enough"
version           "0.1.0"

recipe "abc", "abc is a wrapper for Apache Benchmark, HTTPerf and Weighttp (from Lighttpd)"
recipe "weighttp", "Installs wrk from source"
recipe "wrk", "Installs wrk from source"

depends "git"
