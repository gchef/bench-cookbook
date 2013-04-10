All utilities are built from source.

Requires:

* git (to clone the repository)
* build-essentials

### wrk

[wrk][wrk_github] is a modern HTTP benchmarking tool capable of generating significant
load when run on a single multi-core CPU. It combines a multithreaded
design with scalable event notification systems such as epoll and
kqueue.

### weighttp

"Based on epoll on Linux, [Weighttp][weighttp_github] is much faster than AB – even with one
single thread. But its real value is when you are using as many
threads/processes as you have CPU Cores on the server you target because
THIS IS THE ONLY WAY TO REALLY TEST A SMP/CMP SERVER."

### abc

ab.c is a wrapper for Apache Benchmark, HTTPerf and Weighttp (from Lighttpd)

[G-WAN bench][gwan_bench]

[wrk_github]: https://github.com/wg/wrk
[gwan_bench]: http://gwan.com/en_apachebench_httperf.html
[weighttp_github]: https://github.com/lighttpd/weighttp/
