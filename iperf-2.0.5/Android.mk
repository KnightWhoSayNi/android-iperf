LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := iperf2.0.5
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
		src/gnu_getopt.c \
		src/gnu_getopt_long.c \
		src/tcp_window_size.c \
		src/service.c \
		src/sockets.c \
		src/stdio.c \
		src/ReportCSV.c \
		src/Locale.c \
		src/ReportDefault.c \
		src/Reporter.c \
		src/Extractor.c \
		src/SocketAddr.c \
		compat/delay.cpp \
		src/Server.cpp \
		src/Client.cpp \
		src/List.cpp \
		src/Launch.cpp \
		src/PerfSocket.cpp \
		src/Settings.cpp \
		src/Listener.cpp \
		src/main.cpp \

LOCAL_C_INCLUDES += \
 		$(LOCAL_PATH) \
		$(LOCAL_PATH)/include

LOCAL_DISABLE_FORMAT_STRING_CHECKS := true
include $(BUILD_EXECUTABLE)
