#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic S9xxx STB
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# Modify some code adaptation
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.3.2）
sed -i 's/192.168.1.1/192.168.3.254/g' package/base-files/files/bin/config_generate

# Modify default root's password（FROM 'password'[$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.] CHANGE TO 'your password'）
# sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' /etc/shadow

# Replace the default software source
# sed -i 's#openwrt.proxy.ustclug.org#mirrors.bfsu.edu.cn\\/openwrt#' package/lean/default-settings/files/zzz-default-settings
#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# Add luci-app-adguardhome
# svn co https://github.com/rufengsuixing/luci-app-adguardhome/trunk package/luci-app-adguardhome

# Add OpenAppFilter
# svn co https://github.com/destan19/OpenAppFilter/trunk package/OpenAppFilter

# Add luci-theme-argon
rm -rf package/lean/luci-theme-argon
git clone -b 18.06  https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
svn co https://github.com/jerrykuku/luci-app-argon-config/trunk package/luci-app-argon-config

# Add haproxy2.4.2
rm -f package/feeds/packages/haproxy
svn co https://github.com/cocokfeng/haproxy/trunk package/feeds/packages/haproxy

# luci-theme-infinityfreedom
# svn co https://github.com/cocokfeng/luci-theme-infinityfreedom/trunk package/luci-theme-infinityfreedom

# Add luci-app-serverchan
# svn co https://github.com/tty228/luci-app-serverchan/trunk package/luci-app-serverchan

# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk package/luci-app-amlogic
sed -i '/sleep 3/,$d' package/luci-app-amlogic/luci-app-amlogic/root/usr/bin/openwrt-update
sed -i '/Successfully updated, automatic restartin/a\reboot' package/luci-app-amlogic/luci-app-amlogic/root/usr/bin/openwrt-update
sed -i '/Successfully updated, automatic restartin/a\sleep 3' package/luci-app-amlogic/luci-app-amlogic/root/usr/bin/openwrt-update
sed -i 's/Successfully updated, automatic restarting/升级完成，系统将重启，请等待重启后，刷新页面!如果等不及也可以拔掉电源重启！/g' package/luci-app-amlogic/luci-app-amlogic/root/usr/bin/openwrt-update

# Add luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk package/openwrt-passwall

# Add luci-app-openclash
# svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/openwrt-openclash
# pushd package/openwrt-openclash/tools/po2lmo && make && sudo make install 2>/dev/null && popd

# Add luci-app-ssr-plus
# svn co https://github.com/fw876/helloworld/trunk package/helloworld


# coolsnowwolf default software package replaced with Lienol related software package
# rm -rf feeds/packages/utils/{containerd,libnetwork,runc,tini}
# svn co https://github.com/Lienol/openwrt-packages/trunk/utils/{containerd,libnetwork,runc,tini} feeds/packages/utils

# Add third-party software packages (The entire repository)
# git clone https://github.com/libremesh/lime-packages.git package/lime-packages
# Add third-party software packages (Specify the package)
# svn co https://github.com/libremesh/lime-packages/trunk/packages/{shared-state-pirania,pirania-app,pirania} package/lime-packages/packages
# Add to compile options (Add related dependencies according to the requirements of the third-party software package Makefile)
# sed -i "/DEFAULT_PACKAGES/ s/$/ pirania-app pirania ip6tables-mod-nat ipset shared-state-pirania uhttpd-mod-lua/" target/linux/armvirt/Makefile

# Apply patch
# git apply ../router-config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# ------------------------------- Other ends -------------------------------

