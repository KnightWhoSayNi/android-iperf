LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := iperf2.0.11
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
		src/Extractor.c \
		src/gnu_getopt_long.c \
		src/gnu_getopt.c \
		src/histogram.c \
		src/Locale.c \
		src/pdfs.c \
		src/ReportCSV.c \
		src/ReportDefault.c \
		src/Reporter.c \
		src/service.c \
		src/SocketAddr.c \
		src/sockets.c \
		src/stdio.c \
		src/tcp_window_size.c \
		src/Client.cpp \
		src/isochronous.cpp \
		src/Launch.cpp \
		src/List.cpp \
		src/PerfSocket.cpp \
		src/Settings.cpp \
		src/main.cpp \
		src/Listener.cpp \
		src/Server.cpp

LOCAL_C_INCLUDES += \
 		$(LOCAL_PATH) \
		$(LOCAL_PATH)/include

LOCAL_DISABLE_FORMAT_STRING_CHECKS := true
include $(BUILD_EXECUTABLE)
