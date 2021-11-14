#!/bin/bash
# Change tempdir for Android devices - use /data/local/tmp instead
sed '3173 s/tempdir/\"\/data\/local\/tmp\"/g' /tmp/iperf-3.2/src/iperf_api.c > /tmp/iperf-3.2/src/tmp_iperf_api.c
sed '3162,3172d' /tmp/iperf-3.2/src/tmp_iperf_api.c > /tmp/iperf-3.2/src/iperf_api.c