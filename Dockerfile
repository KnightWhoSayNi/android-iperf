FROM ubuntu:16.04
MAINTAINER KnightWhoSayNi (threeheadedknight@protonmail.com)

RUN apt-get update -qq && \
    apt-get -y upgrade -qq
RUN apt-get install -y make bash git unzip wget curl openjdk-8-jdk build-essential autoconf nano tree

ENV ANDROID_SDK_VERSION 4333796
ENV ANDROID_SDK_HOME /opt/android-sdk
ENV ANDROID_SDK_FILENAME sdk-tools-linux-${ANDROID_SDK_VERSION}
ENV ANDROID_SDK_URL https://dl.google.com/android/repository/${ANDROID_SDK_FILENAME}.zip

RUN wget --no-check-certificate -q ${ANDROID_SDK_URL} && \
    mkdir -p ${ANDROID_SDK_HOME} && \
    unzip -q ${ANDROID_SDK_FILENAME}.zip -d ${ANDROID_SDK_HOME} && \
    rm -f ${ANDROID_SDK_FILENAME}.zip

ENV PATH=${PATH}:${ANDROID_SDK_HOME}/tools:${ANDROID_SDK_HOME}/tools/bin:${ANDROID_SDK_HOME}/platform-tools

RUN yes | sdkmanager --licenses
RUN yes | sdkmanager "platforms;android-24"

ENV ANDROID_NDK_VERSION r19
ENV ANDROID_NDK_HOME /opt/android-ndk
ENV ANDROID_NDK_FILENAME android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64
ENV ANDROID_NDK_URL https://dl.google.com/android/repository/${ANDROID_NDK_FILENAME}.zip

RUN wget --no-check-certificate -q ${ANDROID_NDK_URL} && \
    mkdir -p ${ANDROID_NDK_HOME} && \
    unzip -q ${ANDROID_NDK_FILENAME}.zip && \
    mv ./android-ndk-${ANDROID_NDK_VERSION}/* ${ANDROID_NDK_HOME} && \
    rm -f ${ANDROID_NDK_FILENAME}.zip

ENV PATH=${PATH}:${ANDROID_NDK_HOME}

ENV NDK_PROJECT_PATH=/tmp

RUN apt-get clean

# Config files

RUN mkdir -p /tmp/jni
COPY /jni/Android.mk /tmp/jni
COPY /jni/Application.mk /tmp/jni

# iPerf 2.0.5

RUN cd /tmp && \
    wget --no-check-certificate -q -O iperf-2.0.5.tar.gz https://iperf.fr/download/source/iperf-2.0.5-source.tar.gz && \
    tar -zxvf iperf-2.0.5.tar.gz && \
    rm -f iperf-2.0.5.tar.gz

COPY /iperf-2.0.5/Android.mk /tmp/iperf-2.0.5

RUN cd /tmp/iperf-2.0.5 && \
    autoconf && \
    ./configure

# iPerf 2.0.10

RUN cd /tmp && \
    wget --no-check-certificate -q https://astuteinternet.dl.sourceforge.net/project/iperf2/iperf-2.0.10.tar.gz && \
    tar -zxvf iperf-2.0.10.tar.gz && \
    rm -f iperf-2.0.10.tar.gz

COPY /iperf-2.0.10/Android.mk /tmp/iperf-2.0.10

RUN cd /tmp/iperf-2.0.10 && \
    autoconf && \
    ./configure

# iPerf 2.0.12

RUN cd /tmp && \
    wget --no-check-certificate -q https://astuteinternet.dl.sourceforge.net/project/iperf2/iperf-2.0.12.tar.gz && \
    tar -zxvf iperf-2.0.12.tar.gz && \
    rm -f iperf-2.0.12.tar.gz

COPY /iperf-2.0.12/Android.mk /tmp/iperf-2.0.12

RUN cd /tmp/iperf-2.0.12 && \
    autoconf && \
    ./configure

# Workaround - https://stackoverflow.com/questions/30801752/android-ndk-and-pthread
# POSIX threads (pthreads)
# The android libc, bionic, provides build-in support for pthreads, so no additional linking (-lphtreads) is necessary. It does not implement full POSIX threads functionality and leaves out support for read/write locks, pthread_cancel(), process-shared mutexes and condition variables as well as other more advaced features.
# Read the bionic OVERVIEW.txt for more information. TLS, thread-local storage, is limited to 59 pthread_key_t slots available to applications, lower than the posix minimum of 128.

COPY /iperf-2.0.12/config.h /tmp/iperf-2.0.12

# iPerf 2.0.13

RUN cd /tmp && \
    wget --no-check-certificate -q https://astuteinternet.dl.sourceforge.net/project/iperf2/iperf-2.0.13.tar.gz && \
    tar -zxvf iperf-2.0.13.tar.gz && \
    rm -f iperf-2.0.13.tar.gz

# COPY /ndk_fix/ifaddrs.c /tmp/iperf-2.0.13/src

COPY /iperf-2.0.13/Android.mk /tmp/iperf-2.0.13
RUN cd /tmp/iperf-2.0.13 && \
    autoconf && \
    ./configure

# Workaround - https://stackoverflow.com/questions/30801752/android-ndk-and-pthread
# POSIX threads (pthreads)
# The android libc, bionic, provides build-in support for pthreads, so no additional linking (-lphtreads) is necessary. It does not implement full POSIX threads functionality and leaves out support for read/write locks, pthread_cancel(), process-shared mutexes and condition variables as well as other more advaced features.
# Read the bionic OVERVIEW.txt for more information. TLS, thread-local storage, is limited to 59 pthread_key_t slots available to applications, lower than the posix minimum of 128.

COPY /iperf-2.0.13/config.h /tmp/iperf-2.0.13

# iPerf 3.1.6

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.1.6.tar.gz && \
    tar -zxvf iperf-3.1.6.tar.gz && \
    rm -f iperf-3.1.6.tar.gz

COPY /iperf-3.1.6/Android.mk /tmp/iperf-3.1.6
RUN cd /tmp/iperf-3.1.6 && \
    autoconf && \
    ./configure

# iPerf 3.1.7

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.1.7.tar.gz && \
    tar -zxvf iperf-3.1.7.tar.gz && \
    rm -f iperf-3.1.7.tar.gz

COPY /iperf-3.1.7/Android.mk /tmp/iperf-3.1.7
RUN cd /tmp/iperf-3.1.7 && \
    autoconf && \
    ./configure

# iPerf 3.2

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.2.tar.gz && \
    tar -zxvf iperf-3.2.tar.gz && \
    rm -f iperf-3.2.tar.gz

COPY /iperf-3.2/Android.mk /tmp/iperf-3.2
RUN cd /tmp/iperf-3.2 && \
    autoconf && \
    ./configure

# iPerf 3.2rc1

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.2rc1.tar.gz && \
    tar -zxvf iperf-3.2rc1.tar.gz && \
    rm -f iperf-3.2rc1.tar.gz

COPY /iperf-3.2rc1/Android.mk /tmp/iperf-3.2rc1
RUN cd /tmp/iperf-3.2rc1 && \
    autoconf && \
    ./configure

# iPerf 3.3

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.3.tar.gz && \
    tar -zxvf iperf-3.3.tar.gz && \
    rm -f iperf-3.3.tar.gz

COPY /iperf-3.3/Android.mk /tmp/iperf-3.3
RUN cd /tmp/iperf-3.3 && \
    autoconf && \
    ./configure

# iPerf 3.4

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.4.tar.gz && \
    tar -zxvf iperf-3.4.tar.gz && \
    rm -f iperf-3.4.tar.gz

COPY /iperf-3.4/Android.mk /tmp/iperf-3.4
RUN cd /tmp/iperf-3.4 && \
    autoconf && \
    ./configure

# iPerf 3.5

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.5.tar.gz && \
    tar -zxvf iperf-3.5.tar.gz && \
    rm -f iperf-3.5.tar.gz

COPY /iperf-3.5/Android.mk /tmp/iperf-3.5
RUN cd /tmp/iperf-3.5 && \
    autoconf && \
    ./configure

# iPerf 3.6

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.6.tar.gz && \
    tar -zxvf iperf-3.6.tar.gz && \
    rm -f iperf-3.6.tar.gz

COPY /iperf-3.6/Android.mk /tmp/iperf-3.6
RUN cd /tmp/iperf-3.6 && \
    autoconf && \
    ./configure

# iPerf 3.7

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.7.tar.gz && \
    tar -zxvf iperf-3.7.tar.gz && \
    rm -f iperf-3.7.tar.gz

COPY /iperf-3.7/Android.mk /tmp/iperf-3.7
RUN cd /tmp/iperf-3.7 && \
    autoconf && \
    ./configure

# iPerf 3.8

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.8.tar.gz && \
    tar -zxvf iperf-3.8.tar.gz && \
    rm -f iperf-3.8.tar.gz

COPY /iperf-3.8/Android.mk /tmp/iperf-3.8
RUN cd /tmp/iperf-3.8 && \
    autoconf && \
    ./configure

# iPerf 3.8.1

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.8.1.tar.gz && \
    tar -zxvf iperf-3.8.1.tar.gz && \
    rm -f iperf-3.8.1.tar.gz

COPY /iperf-3.8.1/Android.mk /tmp/iperf-3.8.1
RUN cd /tmp/iperf-3.8.1 && \
    autoconf && \
    ./configure

# iPerf 3.9

RUN cd /tmp && \
    wget --no-check-certificate -q https://downloads.es.net/pub/iperf/iperf-3.9.tar.gz && \
    tar -zxvf iperf-3.9.tar.gz && \
    rm -f iperf-3.9.tar.gz

COPY /iperf-3.9/Android.mk /tmp/iperf-3.9
RUN cd /tmp/iperf-3.9 && \
    autoconf && \
    ./configure

# Compile

RUN ndk-build clean

RUN ndk-build NDK_APPLICATION_MK=/tmp/jni/Application.mk

RUN tree /tmp/libs
