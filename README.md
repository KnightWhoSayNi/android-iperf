# android-iperf

[![Build Status](https://travis-ci.com/KnightWhoSayNi/android-iperf.svg?branch=master)](https://travis-ci.com/KnightWhoSayNi/android-iperf) [![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/KnightWhoSayNi/android-iperf/blob/master/LICENSE)

## Getting Started


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

| ABI        | Binaries           |
| ------------- |:-------------:|
| arm64-v8a     | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/arm64-v8a) |
| armeabi-v7a      | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/armeabi-v7a)      |
| x86 | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/x86)     |
| x86_64 | [here](https://github.com/KnightWhoSayNi/android-iperf/tree/gh-pages/libs/)     |

More about *Application Binary Interface* (ABI): https://developer.android.com/ndk/guides/abis

To get supported ABI by an Android device:

```shell
adb shell cat /proc/cpuinfo
```

## Usage


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


## Acknowledgments

iPerf community - https://iperf.fr/
