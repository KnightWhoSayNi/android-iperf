#!/bin/bash
# Change tempdir for Android devices - use /data/local/tmp instead
sed '3281 s/tempdir/\"\/data\/local\/tmp\"/g' /tmp/iperf-3.6/src/iperf_api.c > /tmp/iperf-3.6/src/tmp_iperf_api.c
sed '3270,3280d' /tmp/iperf-3.6/src/tmp_iperf_api.c > /tmp/iperf-3.6/src/iperf_api.c