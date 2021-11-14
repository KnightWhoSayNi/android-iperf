#!/bin/bash
# Change tempdir for Android devices - use /data/local/tmp instead
sed '3177 s/tempdir/\"\/data\/local\/tmp\"/g' /tmp/iperf-3.4/src/iperf_api.c > /tmp/iperf-3.4/src/tmp_iperf_api.c
sed '3166,3176d' /tmp/iperf-3.4/src/tmp_iperf_api.c > /tmp/iperf-3.4/src/iperf_api.c