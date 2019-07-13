# android-iperf

[![Build Status](https://travis-ci.com/KnightWhoSayNi/android-iperf.svg?branch=master)](https://travis-ci.com/KnightWhoSayNi/android-iperf) [![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/KnightWhoSayNi/android-iperf/blob/master/LICENSE)

## Getting Started

> **What is iPerf / iPerf3** ?
>
> iPerf3 is a tool for active measurements of the maximum achievable bandwidth on IP networks. It supports tuning of various parameters related to timing, buffers and protocols (TCP, UDP, SCTP with IPv4 and IPv6). For each test it reports the bandwidth, loss, and other parameters. This is a new implementation that shares no code with the original iPerf and also is not backwards compatible. iPerf was orginally developed by NLANR/DAST. iPerf3 is principally developed by ESnet / Lawrence Berkeley National Laboratory. It is released under a three-clause BSD license.
>
> [*https://iperf.fr/*](https://iperf.fr/)


### Supported versions

| Version        | Release day           |
| ------------- |:-------------:|
| `3.1.6`    | 02-Feb-2017 |
| `3.1.7`     | 03-Mar-2017 |
| `3.2`     | 26-Jun-2017 |
| `3.2rc1`     | 19-Jun-2017 |
| `3.3`     | 30-Oct-2017 |
| `3.4`     | 12-Feb-2018 |
| `3.5`     | 28-Feb-2018 |
| `3.6`     | 22-Jun-2018 |
| `3.7`     | 20-Jun-2019 |

iPerf3 source codes come from [https://downloads.es.net/pub/iperf/](https://downloads.es.net/pub/iperf/)

### Prerequisites

Docker

### Running

1. Clone the repo
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

## Download

Pre-build binaries from [Travis-CI Deployment](https://travis-ci.com/KnightWhoSayNi/android-iperf)

| ABI        | Binaries           |
| ------------- |:-------------:|
| arm64-v8a     | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/arm64-v8a) |
| armeabi-v7a      | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/armeabi-v7a)      |
| x86 | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/x86)     |
| x86_64 | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/)     |

More about *Application Binary Interface* (ABI): [https://developer.android.com/ndk/guides/abis](https://developer.android.com/ndk/guides/abis)

To get supported ABI by an Android device:

```shell
adb shell cat /proc/cpuinfo
```

## Usage


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


## Acknowledgments

iPerf community - [iperf.fr](https://iperf.fr/)
