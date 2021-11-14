# android-iperf

[![Build Status](https://travis-ci.com/KnightWhoSayNi/android-iperf.svg?branch=master)](https://travis-ci.com/KnightWhoSayNi/android-iperf) [![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/KnightWhoSayNi/android-iperf/blob/master/LICENSE)

## Getting Started

> **What is iPerf / iPerf3** ?
>
> iPerf3 is a tool for active measurements of the maximum achievable bandwidth on IP networks. It supports tuning of various parameters related to timing, buffers and protocols (TCP, UDP, SCTP with IPv4 and IPv6). For each test it reports the bandwidth, loss, and other parameters. This is a new implementation that shares no code with the original iPerf and also is not backwards compatible. iPerf was orginally developed by NLANR/DAST. iPerf3 is principally developed by ESnet / Lawrence Berkeley National Laboratory. It is released under a three-clause BSD license.
>
> [*https://iperf.fr/*](https://iperf.fr/)

**Remark** No `iperf`/`iperf3` source codes are included in this repo

### Supported versions

#### iPerf2

| Version        | Release day           | Source Code  |
| ------------- |:-------------:|-------------:|
| `2.0.5`   | 2010-07-08 | [Source Code](https://iperf.fr/download/source/iperf-2.0.5-source.tar.gz) |
| `2.0.10`  | 2017-08-11 | [Source Code](https://astuteinternet.dl.sourceforge.net/project/iperf2/iperf-2.0.10.tar.gz) |
| `2.0.11` compiled w/o `HAVE_AF_PACKET` | 2018-05-24 |  [Source Code](https://astuteinternet.dl.sourceforge.net/project/iperf2/iperf-2.0.11.tar.gz) |
| `2.0.12` compiled w/o `HAVE_AF_PACKET` | 2018-06-26 | [Source Code](https://astuteinternet.dl.sourceforge.net/project/iperf2/iperf-2.0.12.tar.gz) |
| `2.0.13` compiled w/o `HAVE_AF_PACKET`  | 2019-01-22 | [Source Code](https://astuteinternet.dl.sourceforge.net/project/iperf2/iperf-2.0.13.tar.gz) |
| `2.1.3` compiled w/o `HAVE_AF_PACKET`, `HAVE_LINUX_UDP_H`!    |   2021-07-15  | [Source Code](https://nav.dl.sourceforge.net/project/iperf2/iperf-2.1.3.tar.gz )   |
| `2.1.4` compiled w/o `HAVE_AF_PACKET`, `HAVE_LINUX_UDP_H`, `HAVE_TUNTAP_TUN`, `HAVE_TUNTAP_TAP`!  | 2021-08-19    | [Source Code](https://nav.dl.sourceforge.net/project/iperf2/iperf-2.1.4.tar.gz)   |

#### iPerf3

| Version        | Release day           | Source Code  |
| ------------- |:-------------:|-------------:|
| `3.1.6`    | 2017-02-02 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.1.6.tar.gz)  |
| `3.1.7`     | 2017-03-03 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.1.7.tar.gz)  |
| `3.2`     | 2017-06-26 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.2.tar.gz)  |
| `3.2rc1`     | 2017-06-19 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.2rc1.tar.gz)  |
| `3.3`     | 2017-10-30 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.3.tar.gz)  |
| `3.4`     | 2018-02-12 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.4.tar.gz)  |
| `3.5`     | 2018-02-28 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.5.tar.gz)  |
| `3.6`     | 2018-06-22 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.6.tar.gz)  |
| `3.7`     | 2019-06-20 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.7.tar.gz)  |
| `3.8`     | 2020-06-08 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.8.tar.gz)  |
| `3.8.1`     | 2020-06-10 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.8.1.tar.gz)  |
| `3.9`     | 2020-08-17 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.9.tar.gz)  |
| `3.10`    | 2021-05-26 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.10.tar.gz)  |
| `3.11`    | 2021-06-02 | [Source Code](https://downloads.es.net/pub/iperf/iperf-3.10.1.tar.gz)  |

### Download

Compiled `iperf` and `iperf3` binaries using SDK `4333796` and NDK `r19` for devices with Android `9.0+` (API level `28+`) - [Travis-CI Deployment](https://travis-ci.com/KnightWhoSayNi/android-iperf).

| ABI        | Binaries           |
| ------------- |:-------------:|
| arm64-v8a     | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/arm64-v8a) |
| armeabi-v7a      | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/armeabi-v7a)      |
| x86 | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/x86)     |
| x86_64 | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/x86_64)     |

More about *Application Binary Interface* (ABI): [https://developer.android.com/ndk/guides/abis](https://developer.android.com/ndk/guides/abis)

To get supported ABI by an Android device:

```shell
adb shell getprop ro.product.cpu.abilist
```

## Build

### Prerequisites

Docker

### Running

1. Clone this repo
2. Build image from Dockerfile

```shell
docker build -t android-ndk:latest .
```

3. Run container and fetch binaries

```shell
docker run -d --name android-ndk-container android-ndk
mkdir -p binaries
docker cp -a android-ndk-container:/tmp/libs binaries
docker stop android-ndk-container
```

## Usage

Upload a binary file (with compatible ABI) to an Android device

```shell
adb push <LOCAL_PATH_TO_BINARY_FILE>/<BINARY_NAME> /data/local/tmp/<BINARY_NAME>
adb shell chmod 777 /data/local/tmp/<BINARY_NAME>
```

### iperf

Set a default `iperf`
```shell
adb shell ln -s /data/local/tmp/<IPERF2_BINARY_NAME> iperf
```

Execute `iperf`
```shell
adb shell /data/local/tmp/iperf <IPERF_ARGUMENTS>
```

### iperf3 

Set a default `iperf3`
```shell
adb shell ln -s /data/local/tmp/<IPERF3_BINARY_NAME> iperf3
```

Execute `iperf3`
```shell
adb shell /data/local/tmp/iperf3 <IPERF_ARGUMENTS>
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


## Acknowledgments

iPerf community - [iperf.fr](https://iperf.fr/)
