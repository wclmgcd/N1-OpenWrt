#!/bin/bash
cd openwrt
cat >> .config <<EOF
CONFIG_TARGET_armvirt=y
CONFIG_TARGET_armvirt_64=y
CONFIG_TARGET_armvirt_64_Default=y
CONFIG_TARGET_ROOTFS_CPIOGZ=n
CONFIG_TARGET_ROOTFS_EXT4FS=n
CONFIG_TARGET_ROOTFS_INITRAMFS=n
CONFIG_TARGET_ROOTFS_SQUASHFS=n

# ipv6
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_ip6tables=y
CONFIG_PACKAGE_ip6tables-extra=y
CONFIG_PACKAGE_ip6tables-mod-nat=y
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_luci-proto-ipv6=y
CONFIG_PACKAGE_odhcp6c=y
CONFIG_PACKAGE_odhcp6c_ext_cer_id=0
CONFIG_PACKAGE_odhcpd-ipv6only=y
CONFIG_PACKAGE_odhcpd_ipv6only_ext_cer_id=0
CONFIG_PACKAGE_6in4=y
CONFIG_PACKAGE_kmod-ipt-nat6=y

# usb 2.0
CONFIG_PACKAGE_kmod-usb-core=y
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-usb-storage-uas=y
CONFIG_PACKAGE_kmod-usb-xhci-hcd=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb3=y

# luci
CONFIG_PACKAGE_luci-app-amlogic=y
CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-theme-design=y
CONFIG_PACKAGE_luci-app-passwall2=y
CONFIG_PACKAGE_luci-app-vlmcsd=y
# other packages
#CONFIG_PACKAGE_autocore-arm=y
#CONFIG_PACKAGE_zoneinfo-asia=y
#CONFIG_PACKAGE_zoneinfo-core=y

# necessary
CONFIG_BTRFS_PROGS_ZSTD=y
CONFIG_PACKAGE_attr=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_bsdtar=y
CONFIG_PACKAGE_btrfs-progs=y
CONFIG_PACKAGE_chattr=y
CONFIG_PACKAGE_f2fs-tools=y
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_gawk=y
CONFIG_PACKAGE_getopt=y
CONFIG_PACKAGE_lsattr=y
CONFIG_PACKAGE_perl=y
CONFIG_PACKAGE_perlbase-getopt=y
CONFIG_PACKAGE_perlbase-unicode=y
CONFIG_PACKAGE_perl-http-date=y
CONFIG_PACKAGE_pigz=y
CONFIG_PACKAGE_tar=y
CONFIG_PACKAGE_xfs-fsck=y
CONFIG_PACKAGE_xfs-mkfs=y
CONFIG_PACKAGE_openssh-sftp-server=y
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_lsblk=y
CONFIG_PACKAGE_parted=y
CONFIG_PACKAGE_mkf2fs=y
CONFIG_PACKAGE_dosfstools=y
CONFIG_PACKAGE_uuidgen=y

# wifi
CONFIG_PACKAGE_hostapd-common=n
CONFIG_PACKAGE_iw=n
CONFIG_PACKAGE_kmod-brcmfmac=n
CONFIG_PACKAGE_kmod-brcmutil=n
CONFIG_PACKAGE_kmod-cfg80211=n
CONFIG_PACKAGE_kmod-mac80211=n
CONFIG_PACKAGE_wpa-cli=n
CONFIG_PACKAGE_wpad-basic=n

#删除不要的插件
CONFIG_PACKAGE_luci-app-turboacc=n
CONFIG_PACKAGE_luci-app-arpbind=n
CONFIG_PACKAGE_luci-app-accesscontrol=n
CONFIG_PACKAGE_luci-app-upnp=n
CONFIG_PACKAGE_luci-app-vlmcsd=n
CONFIG_PACKAGE_luci-app-ddns=n
CONFIG_PACKAGE_ddns-scripts_aliyun=n
CONFIG_PACKAGE_ddns-scripts_dnspod=n
CONFIG_PACKAGE_ddns-scripts=n
CONFIG_PACKAGE_luci-app-vsftpd=n
CONFIG_PACKAGE_vsftpd-alt=n
CONFIG_PACKAGE_nlbwmon=n
CONFIG_PACKAGE_luci-app-nlbwmon=n
CONFIG_PACKAGE_coremark=n
CONFIG_PACKAGE_luci-app-autoreboot=n
CONFIG_PACKAGE_luci-i18n-autoreboot-zh-cn=n
CONFIG_PACKAGE_luci-app-wol=n
CONFIG_PACKAGE_wol=n
CONFIG_PACKAGE_etherwake=n
EOF
