dnl ===================================================================
dnl configure.ac
dnl Process this file with autogen.sh to produce configure files
dnl ===================================================================


AC_PREREQ(2.59)
AC_INIT(Iperf,2.0.13)
AC_CONFIG_HEADER([config.h])
AM_INIT_AUTOMAKE()

dnl The end user may not have autotools
AM_MAINTAINER_MODE([disable])

m4_include([m4/ax_create_stdint_h.m4])
m4_include([m4/dast.m4])
m4_include([m4/acx_pthread.m4])

AC_ARG_ENABLE(ipv6, AC_HELP_STRING([--disable-ipv6],
	    [disable ipv6 support (default is autodetect)]),
	ac_cv_have_ipv6=$enable_ipv6,)

AC_ARG_ENABLE(multicast, AC_HELP_STRING([--disable-multicast],
	    [disable multicast support (default is autodetect)]),
	ac_cv_multicast=$enable_multicast,)

AC_ARG_ENABLE(threads, AC_HELP_STRING([--disable-threads],
	    [disable thread support (default is autodetect)]))

AC_ARG_ENABLE(debuginfo, AC_HELP_STRING([--enable-debuginfo],
	    [enable debugging info for sockets (default is no)]),
	enable_debuginfo=$enableval,
	enable_debuginfo=no)

AC_ARG_ENABLE(web100, AC_HELP_STRING([--disable-web100],
	    [disable web100 support (default is autodetect)]))

AC_ARG_ENABLE(kalman, AC_HELP_STRING([--disable-kalman],
	    [disable kalman delay tuning (default is enable)]))

AC_ARG_ENABLE(seqno64b, AC_HELP_STRING([--disable-seqno64b],
	    [disable 64 bit sequence numer support (default is enable)]))

AC_ARG_ENABLE(isochronous, AC_HELP_STRING([--disable-isochronous],
	    [disable isochronous support (default is enable)]))
AM_CONDITIONAL([ISOCHRONOUS], [test "x${enable_isochronous}" = "xyes"])

AC_ARG_ENABLE(fastsampling, AC_HELP_STRING([--enable-fastsampling],
	    [enable support for 100 microsecond report intervals (default is disable)]))
AM_CONDITIONAL([FASTSAMPLING], [test "x$enable_fastsampling" = "xyes"])

AC_ARG_ENABLE(checkprograms, AC_HELP_STRING([--enable-checkprograms],
	    [enable support for building support programs such as checkdelay, checkpdfs, etc. (default is disable)]))
AM_CONDITIONAL([CHECKPROGRAMS], [test "x$enable_checkprograms" = "xyes"])

dnl AF_PACKET support
AC_ARG_ENABLE(af-packet,
    AS_HELP_STRING([--enable-af-packet], [Enable AF_PACKET support [default=yes]]),,[enable_af_packet=yes])

dnl ===================================================================
dnl Checks for programs
dnl ===================================================================

AC_PROG_CXX
CXXFLAGS=`echo " $CXXFLAGS " | sed -e "s/ -g / /"` # do not want it implicitly
AC_PROG_CC
CFLAGS=`echo " $CFLAGS " | sed -e "s/ -g / /"` # do not want it implicitly
AC_ISC_POSIX
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AC_PROG_RANLIB
AC_LANG(C)
AC_CANONICAL_HOST

dnl ===================================================================
dnl Checks for libraries.
dnl ===================================================================
AC_CHECK_LIB([rt], [clock_gettime])

dnl check for -lpthread

if test "$enable_threads" != no; then
  ACX_PTHREAD()
    if test "$acx_pthread_ok" = yes; then
      AC_DEFINE([HAVE_POSIX_THREAD], 1,)
      AC_DEFINE([_REENTRANT], 1,)
    fi
fi

dnl check for -lnsl, -lsocket
AC_SEARCH_LIBS([gethostbyname], [nsl])
AC_SEARCH_LIBS([socket], [socket], [],
  [AC_CHECK_HEADER([winsock2.h],[

  AC_DEFINE([HAVE_WINSOCK2_H], 1, [Define if winsock2.h exists.])
  if test "$acx_pthread_ok" != yes; then
  AC_DEFINE([HAVE_WIN32_THREAD], 1, [Define if using WIN32 threads])
  fi
  LIBS="-lws2_32 $LIBS"],
  [],
  [#include <windows.h>])])

dnl Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS([arpa/inet.h libintl.h net/ethernet.h net/if.h linux/ip.h linux/udp.h linux/if_packet.h linux/filter.h netdb.h netinet/in.h stdlib.h string.h strings.h sys/socket.h sys/time.h syslog.h unistd.h signal.h ifaddrs.h])

dnl ===================================================================
dnl Checks for typedefs, structures
dnl ===================================================================

AC_C_CONST
AC_TYPE_SIZE_T
AC_CHECK_TYPES(ssize_t,,AC_DEFINE_UNQUOTED(ssize_t, int))
AC_HEADER_TIME
AC_STRUCT_TM

AC_CHECK_TYPES(int64_t)

AC_CACHE_CHECK(3rd argument of accept, ac_cv_accept_arg, [
  dnl Try socklen_t (POSIX)
  DAST_ACCEPT_ARG(socklen_t)

  dnl Try int (original BSD)
  DAST_ACCEPT_ARG(int)

  dnl Try size_t (older standard; AIX)
  DAST_ACCEPT_ARG(size_t)

  dnl Try short (shouldn't be)
  DAST_ACCEPT_ARG(short)

  dnl Try long (shouldn't be)
  DAST_ACCEPT_ARG(long)
])

if test -z "$ac_cv_accept_arg" ; then
  ac_cv_accept_arg=int
fi

AC_DEFINE_UNQUOTED([Socklen_t], $ac_cv_accept_arg, [Define 3rd arg of accept])

dnl Checks for library functions.
AC_FUNC_MEMCMP
AC_FUNC_SELECT_ARGTYPES
AC_TYPE_SIGNAL
AC_FUNC_STRFTIME
AC_FUNC_VPRINTF
AC_CHECK_FUNCS([atexit memset pthread_cancel select strchr strerror strtol strtoll usleep clock_gettime sched_setscheduler mlockall setitimer nanosleep clock_nanosleep])
AC_REPLACE_FUNCS(snprintf inet_pton inet_ntop gettimeofday)
AC_CHECK_DECLS([ENOBUFS, EWOULDBLOCK],[],[],[#include <errno.h>])
AC_CHECK_DECLS([CPU_SET],[],[],[
	#define _GNU_SOURCE
	#include <sched.h>
	])
AC_CHECK_DECLS([SIGALRM],[],[],[#include <signal.h>])


in_h='
#ifdef HAVE_WINSOCK2_H
#define _WIN32_WINNT 0x0501 /* use (at least) WinXP API */
#define WIN32_LEAN_AND_MEAN /* exclude unnecesary headers */
#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#include <sys/socket.h>
#include <netinet/in.h>
#endif
'

AC_CHECK_DECLS([AF_INET6, SO_TIMESTAMP, SO_SNDTIMEO,
			  SO_MAX_PACING_RATE, IPV6_TCLASS,
			  MCAST_JOIN_GROUP, MCAST_JOIN_SOURCE_GROUP,
			  IPV6_ADD_MEMBERSHIP, IPV6_MULTICAST_HOPS,
			  IP_ADD_MEMBERSHIP, IP_ADD_SOURCE_MEMBERSHIP],[],[],[$in_h])

AC_CHECK_TYPES([struct sockaddr_storage, struct sockaddr_in6,
		       struct group_source_req, struct ip_mreq,
		       struct ipv6_mreq, struct ip_mreq_source],,,[$in_h])

AC_CHECK_MEMBERS([struct sockaddr_in6.sin6_len,
			 struct ip_mreq_source.imr_multiaddr.s_addr], [], [],[$in_h])

AC_CHECK_MEMBERS([struct tcp_info.tcpi_total_retrans], [], [],[
#include <netinet/in.h>
#include <netinet/tcp.h>
])

dnl ===================================================================
dnl Check for compiler characteristics

DAST_CHECK_BOOL

AC_C_BIGENDIAN

dnl ===================================================================
dnl Check for system services

dnl check for multicast
if test "$ac_cv_multicast" != no; then
  AC_MSG_CHECKING(for multicast support)
  ac_cv_multicast=no
  if test "$ac_cv_have_decl_IP_ADD_MEMBERSHIP" = yes; then
    if test "$ac_cv_type_struct_ip_mreq" = yes; then
      ac_cv_multicast=yes
    fi
  fi
  AC_MSG_RESULT($ac_cv_multicast)
  if test "$ac_cv_multicast" = yes; then
    AC_DEFINE([HAVE_MULTICAST], 1, [Define to enable multicast support])
  fi
  AC_MSG_CHECKING(for multicast ssm support)
  ac_cv_ssm_multicast=no
  if test "$ac_cv_have_decl_MCAST_JOIN_SOURCE_GROUP" = yes || test "$ac_cv_have_decl_IP_ADD_SOURCE_MEMBERSHIP" = yes; then
    if test "$ac_cv_type_struct_group_source_req" = yes; then
      ac_cv_ssm_multicast=yes
    fi
  fi
  AC_MSG_RESULT($ac_cv_ssm_multicast)
  if test "$ac_cv_ssm_multicast" = yes; then
    AC_DEFINE([HAVE_SSM_MULTICAST], 1, [Define to enable ssm multicast support])
  fi
fi

dnl check for IPv6
if test "$ac_cv_have_ipv6" != no; then
  AC_MSG_CHECKING(for IPv6 headers and structures)
  ac_cv_have_ipv6=no
  if test "$ac_cv_type_struct_sockaddr_storage" = yes; then
    if test "$ac_cv_type_struct_sockaddr_in6" = yes; then
      if test "$ac_cv_have_decl_AF_INET6" = yes; then
        AC_DEFINE([HAVE_IPV6], 1, [Define to enable IPv6 support])
        ac_cv_have_ipv6=yes
      fi
    fi
  fi
  AC_MSG_RESULT($ac_cv_have_ipv6)
fi

if test "$ac_cv_have_ipv6" = yes; then
  if test "$ac_cv_multicast" = yes; then
    AC_MSG_CHECKING(for IPv6 multicast support)
    ac_cv_have_ipv6_multicast=no
    if test "$ac_cv_type_struct_ipv6_mreq" = yes; then
      if test "$ac_cv_have_decl_IPV6_ADD_MEMBERSHIP" = yes; then
        if test "$ac_cv_have_decl_IPV6_MULTICAST_HOPS" = yes; then
          AC_DEFINE([HAVE_IPV6_MULTICAST], 1, [Define to enable IPv6 multicast support])
          ac_cv_have_ipv6_multicast=yes
        fi
      fi
    fi
    AC_MSG_RESULT($ac_cv_have_ipv6_multicast)
  fi
fi

if test "$enable_debuginfo" = yes; then
AC_DEFINE([DBG_MJZ], 1, [Define if debugging info is desired])
fi

if test "$enable_web100" != no; then
if test -e "/proc/web100"; then
if test -d "/proc/web100"; then
if test -e "/proc/web100/header"; then
if test -f "/proc/web100/header"; then
if test -r "/proc/web100/header"; then
AM_PATH_WEB100()
if test "$web100_success" = yes; then
AC_DEFINE([HAVE_WEB100], 1, [Define if Web100 is desired and available])
fi fi fi fi fi fi
fi

if test "$enable_kalman" != no; then
AC_DEFINE([HAVE_KALMAN], 1, [Define if Kalman tuning is desired and available])
fi

if test "$enable_seqno64b" != no; then
AC_DEFINE([HAVE_SEQNO64b], 1, [Define if 64 bit sequence numbers are desired and available])
fi

if test "$enable_isochronous" != no; then
AC_DEFINE([HAVE_ISOCHRONOUS], 1, [Define if isochronous traffic option is desired and available])
fi

if test "$enable_udptriggers" = yes; then
AC_DEFINE([HAVE_UDPTRIGGERS], 1, [Define if udp triggers option is desired and available])
fi

if test "$enable_fastsampling" = yes; then
AC_DEFINE([HAVE_FASTSAMPLING], 1, [Define if fast sampling for report intervals is desired])
fi

case "$ac_cv_host" in
*-mingw32)
    dnl Static link on MINGW for standalone DOS executable
    LIBS="$LIBS -static-libstdc++ -static";;
*-android)
    dnl Android requires PIE
    CFLAGS="$CFLAGS -fPIE"; LDFLAGS="$LDFLAGS -pie";;
esac


dnl GNU make allows us to use the $(strip ...) builtin which eliminates a
dnl large amount of extra whitespace in compile lines.
AC_MSG_CHECKING(whether make is GNU make)
STRIP_BEGIN=
STRIP_END=
if $ac_make --version 2> /dev/null | grep '^GNU Make ' > /dev/null ; then
    STRIP_BEGIN='$(strip $(STRIP_DUMMY)'
    STRIP_END=')'
    AC_MSG_RESULT(yes)
else
    AC_MSG_RESULT(no)
fi

dnl some Make 3.79 $(strip ) versions are broken and require an empty arg
STRIP_DUMMY=
AC_SUBST(STRIP_DUMMY)
AC_SUBST(STRIP_BEGIN)
AC_SUBST(STRIP_END)

AC_CONFIG_FILES([Makefile
		compat/Makefile
		doc/Makefile
		include/Makefile
		src/Makefile
                man/Makefile])
AC_OUTPUT
