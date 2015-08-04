LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

AVAHI_BUILT_SOURCES := \
	avahi-common/Android.mk \
	avahi-core/Android.mk \
	avahi-client-uninstalled.pc \
	avahi-client/Android.mk \
	avahi-utils/Android.mk \
	avahi-glib/Android.mk \
	avahi-glib-uninstalled.pc \
	avahi-gobject/Android.mk \
	avahi-gobject-uninstalled.pc \
	avahi-daemon/Android.mk

avahi-configure-real:
	cd $(AVAHI_TOP) ; \
	CC="$(CONFIGURE_CC)" \
	CFLAGS="$(CONFIGURE_CFLAGS)" \
	LD=$(TARGET_LD) \
	LDFLAGS="$(CONFIGURE_LDFLAGS)" \
	CPP=$(CONFIGURE_CPP) \
	CPPFLAGS="$(CONFIGURE_CPPFLAGS)" \
	PKG_CONFIG_LIBDIR=$(CONFIGURE_PKG_CONFIG_LIBDIR) \
	PKG_CONFIG_TOP_BUILD_DIR=$(PKG_CONFIG_TOP_BUILD_DIR) \
	$(AVAHI_TOP)/$(CONFIGURE) --host=arm-linux-androideabi \
		--with-distro=none \
		--disable-qt3 --disable-qt4 \
		--disable-gtk --disable-gtk3 \
		--disable-gdbm \
		--disable-python --disable-pygtk --disable-python-dbus \
		--disable-mono --disable-monodoc --disable-doxygen-doc \
		--disable-doxygen-dot --disable-manpages \
--localstatedir=/data/data/org.freedesktop.telepathy/files/ \
--sysconfdir=/data/data/org.freedesktop.telepathy/files/ \
		ac_cv_func_dbus_connection_close=yes \
		ac_cv_func_dbus_bus_get_private=yes \
		ac_cv_lib_expat_XML_ParserCreate=yes \
		--disable-Werror && \
	for file in $(AVAHI_BUILT_SOURCES); do \
		rm -f $$file && \
		make -C $$(dirname $$file) $$(basename $$file) ; \
	done

avahi-configure: avahi-configure-real

.PHONY: avahi-configure

CONFIGURE_TARGETS += avahi-configure

#include all the subdirs...
-include $(AVAHI_TOP)/avahi-common/Android.mk
-include $(AVAHI_TOP)/avahi-client/Android.mk
-include $(AVAHI_TOP)/avahi-core/Android.mk
-include $(AVAHI_TOP)/avahi-daemon/Android.mk
-include $(AVAHI_TOP)/avahi-glib/Android.mk
-include $(AVAHI_TOP)/avahi-gobject/Android.mk
-include $(AVAHI_TOP)/avahi-utils/Android.mk
