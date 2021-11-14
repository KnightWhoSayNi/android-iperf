LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := iperf2.1.3
LOCAL_MODULE_TAGS := dev
LOCAL_CFLAGS := -DHAVE_CONFIG_H -O2 -g -UAF_INET6 -w -Wno-error=format-security
LOCAL_LDFLAGS := -fPIE -pie
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_SRC_FILES := \
		compat/delay.c \
		compat/error.c \
		compat/gettimeofday.c \
		compat/inet_ntop.c \
		compat/inet_pton.c \
		compat/signal.c \
		compat/snprintf.c \
		compat/string.c \
		compat/Thread.c \
		src/active_hosts.cpp \
		src/Client.cpp \
		src/Locale.c \
		src/Extractor.c \
		src/gnu_getopt_long.c \
		src/gnu_getopt.c \
		src/histogram.c \
		src/isochronous.cpp \
		src/Launch.cpp \
		src/Listener.cpp \
		src/Settings.cpp \
		src/sockets.c \
		src/stdio.c \
		src/service.c \
		src/SocketAddr.c \
		src/Server.cpp \
		src/packet_ring.c \
		src/pdfs.c \
		src/PerfSocket.cpp \
		src/ReportOutputs.c \
		src/Reporter.c \
		src/Reports.c \
		src/tcp_window_size.c \
		src/main.cpp \

LOCAL_C_INCLUDES += \
 		$(LOCAL_PATH) \
		$(LOCAL_PATH)/include

LOCAL_DISABLE_FORMAT_STRING_CHECKS := true
include $(BUILD_EXECUTABLE)
