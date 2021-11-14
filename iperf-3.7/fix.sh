#!/bin/bash
# Change tempdir for Android devices - use /data/local/tmp instead
sed '3627 s/tempdir/\"\/data\/local\/tmp\"/g' /tmp/iperf-3.7/src/iperf_api.c > /tmp/iperf-3.7/src/tmp_iperf_api.c
sed '3616,3626d' /tmp/iperf-3.7/src/tmp_iperf_api.c > /tmp/iperf-3.7/src/iperf_api.c