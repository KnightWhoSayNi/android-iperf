LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := iperf2.0.10
LOCAL_MODULE_TAGS := dev
LOCAL_CFLAGS := -DHAVE_CONFIG_H -UAF_INET6 -w -Wno-error=format-security
LOCAL_LDFLAGS := -fPIE -pie
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_SRC_FILES := \
		compat/error.c \
		compat/snprintf.c \
		compat/inet_ntop.c \
		compat/inet_pton.c \
		compat/signal.c \
		compat/Thread.c \
		compat/string.c \
		compat/gettimeofday.c \
		compat/delay.c \
		src/Client.cpp \
		src/Extractor.c \
		src/Launch.cpp \
		src/List.cpp \
		src/Listener.cpp \
		src/Locale.c \
		src/PerfSocket.cpp \
		src/ReportCSV.c \
		src/ReportDefault.c \
		src/Reporter.c \
		src/Server.cpp \
		src/Settings.cpp \
		src/SocketAddr.c \
		src/main.cpp \
		src/sockets.c \
		src/stdio.c \
		src/tcp_window_size.c \
		src/gnu_getopt.c \
		src/gnu_getopt_long.c \
		src/service.c \		

LOCAL_C_INCLUDES += \
 		$(LOCAL_PATH) \
		$(LOCAL_PATH)/include

LOCAL_DISABLE_FORMAT_STRING_CHECKS := true
include $(BUILD_EXECUTABLE)
