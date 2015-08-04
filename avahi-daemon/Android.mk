LOCAL_PATH:=$(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE:=avahi-daemon

LOCAL_MODULE_TAGS:=eng debug

LOCAL_SRC_FILES := \
        main.c \
        simple-protocol.c \
        static-services.c \
        static-hosts.c \
        ini-file-parser.c \
        setproctitle.c \
        sd-daemon.c \
        glob.c \
        ../avahi-client/check-nss.c \
        dbus-protocol.c \
        dbus-util.c \
        dbus-async-address-resolver.c \
        dbus-async-host-name-resolver.c \
        dbus-async-service-resolver.c \
        dbus-domain-browser.c \
        dbus-entry-group.c \
        dbus-service-browser.c \
        dbus-service-type-browser.c \
        dbus-sync-address-resolver.c \
        dbus-sync-host-name-resolver.c \
        dbus-sync-service-resolver.c \
        dbus-record-browser.c \
        ../avahi-common/dbus.c \
        ../avahi-common/dbus-watch-glue.c

LOCAL_SHARED_LIBRARIES:=\
        libavahi-common \
        libavahi-core \
        libexpat \
        libdl \
        libdaemon \
        libdbus

LOCAL_CFLAGS := \
        -DHAVE_CONFIG_H \
        -g \
        -O2 \
        -fstack-protector \
        -std=c99 \
        -Wall \
        -W \
        -Wextra \
        -pedantic \
        -pipe \
        -Wformat \
        -Wold-style-definition \
        -Wdeclaration-after-statement \
        -Wfloat-equal \
        -Wmissing-declarations \
        -Wmissing-prototypes \
        -Wstrict-prototypes \
        -Wredundant-decls \
        -Wmissing-noreturn \
        -Wshadow \
        -Wendif-labels \
        -Wpointer-arith \
        -Wbad-function-cast \
        -Wcast-qual \
        -Wcast-align \
        -Wwrite-strings \
        -fdiagnostics-show-option \
        -Wno-cast-qual \
        -fno-strict-aliasing \
        -DDEBUG_TRAP=__asm__\(\"int\ $3\"\) \
        -DAVAHI_DAEMON_RUNTIME_DIR=\"/data/misc/avahi/daemon/\" \
        -DAVAHI_SOCKET=\"/dev/socket/avahi\" \
        -DAVAHI_SERVICE_DIR=\"/data/misc/avahi/services\" \
        -DAVAHI_CONFIG_FILE=\"/system/etc/avahi/avahi-daemon.conf\" \
        -DAVAHI_HOSTS_FILE=\"/system/etc/avahi/avahi-hosts\" \
        -DAVAHI_DBUS_INTROSPECTION_DIR=\"/usr/local/share/dbus/interfaces\" \
        -DAVAHI_CONFIG_DIR=\"/system/etc/avahi\" \
        -DUSE_EXPAT_H \
        -DDBUS_VERSION_MAJOR=1 \
        -DDBUS_VERSION_MINOR=6 \
        -DDBUS_VERSION_MICRO=18 \
        -DDBUS_API_SUBJECT_TO_CHANGE \
        -DDBUS_SYSTEM_BUS_DEFAULT_ADDRESS=\"unix:path=/dev/socket/dbus\"

LOCAL_C_INCLUDES := \
        $(LOCAL_PATH) \
        external/avahi

include $(BUILD_EXECUTABLE)
