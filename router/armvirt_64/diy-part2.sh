#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic S9xxx STB
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# ------------------------------- Main source started -------------------------------


# Modify some code adaptation
# sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
# sed -i 's/services/system/g' package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.3.254）
sed -i 's/192.168.1.1/192.168.1.188/g' package/base-files/files/bin/config_generate
#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# git clone https://github.com/ophub/luci-app-amlogic.git package/lean/luci-app-amlogic
# git clone https://github.com/wclmgcd/luci-app-godproxy.git package/lean/luci-app-godproxy
# git clone https://github.com/small-5/luci-app-adblock-plus package/lean/luci-app-adblock-plus
# git clone https://github.com/vernesong/OpenClash package/lean/luci-app-openclash
git clone https://github.com/wclmgcd/luci-app-koolproxy.git package/lean/luci-app-koolproxy


