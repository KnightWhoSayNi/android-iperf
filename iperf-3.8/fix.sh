#!/bin/bash
# Change tempdir for Android devices - use /data/local/tmp instead
sed '3666 s/tempdir/\"\/data\/local\/tmp\"/g' /tmp/iperf-3.8/src/iperf_api.c > /tmp/iperf-3.8/src/tmp_iperf_api.c
sed '3655,3665d' /tmp/iperf-3.8/src/tmp_iperf_api.c > /tmp/iperf-3.8/src/iperf_api.c