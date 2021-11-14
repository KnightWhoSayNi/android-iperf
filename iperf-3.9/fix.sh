#!/bin/bash
# Change tempdir for Android devices - use /data/local/tmp instead
sed '3845 s/tempdir/\"\/data\/local\/tmp\"/g' /tmp/iperf-3.9/src/iperf_api.c > /tmp/iperf-3.9/src/tmp_iperf_api.c
sed '3834,3844d' /tmp/iperf-3.9/src/tmp_iperf_api.c > /tmp/iperf-3.9/src/iperf_api.c