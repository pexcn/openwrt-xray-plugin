include $(TOPDIR)/rules.mk

PKG_NAME:=xray-plugin
PKG_VERSION:=1.4.2
PKG_RELEASE:=1

PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_SOURCE_SUBDIR)

include $(INCLUDE_DIR)/package.mk

define Package/xray-plugin
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A SIP003 plugin based on Xray-core
	URL:=https://github.com/teddysun/xray-plugin
endef

define Package/xray-plugin/description
Yet another SIP003 plugin for shadowsocks, based on Xray-core.
endef

ifeq ($(ARCH),i386)
	BIN_ARCH:=386
endif
ifeq ($(ARCH),x86_64)
	BIN_ARCH:=amd64
endif
ifeq ($(ARCH),arm)
	BIN_ARCH:=arm7
endif
ifeq ($(ARCH),aarch64)
	BIN_ARCH:=arm64
endif
ifeq ($(ARCH),mips)
	BIN_ARCH:=mips_sf
endif
ifeq ($(ARCH),mipsel)
	BIN_ARCH:=mipsle_sf
endif

define Build/Compile
endef

define Package/xray-plugin/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) files/$(ARCH)/xray-plugin_linux_$(BIN_ARCH) $(1)/usr/bin/xray-plugin
endef

$(eval $(call BuildPackage,xray-plugin))
