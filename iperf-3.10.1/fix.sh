#!/bin/bash
# Change tempdir for Android devices - use /data/local/tmp instead
sed '4002 s/tempdir/\"\/data\/local\/tmp\"/g' /tmp/iperf-3.10.1/src/iperf_api.c > /tmp/iperf-3.10.1/src/tmp_iperf_api.c
sed '3991,4001d' /tmp/iperf-3.10.1/src/tmp_iperf_api.c > /tmp/iperf-3.10.1/src/iperf_api.c