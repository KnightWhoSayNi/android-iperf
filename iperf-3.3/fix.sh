#!/bin/bash
# Change tempdir for Android devices - use /data/local/tmp instead
sed '3176 s/tempdir/\"\/data\/local\/tmp\"/g' /tmp/iperf-3.3/src/iperf_api.c > /tmp/iperf-3.3/src/tmp_iperf_api.c
sed '3165,3175d' /tmp/iperf-3.3/src/tmp_iperf_api.c > /tmp/iperf-3.3/src/iperf_api.c