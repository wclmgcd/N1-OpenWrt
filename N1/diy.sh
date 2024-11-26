#!/bin/bash

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

#修改密码
sed -i 's/^root:.*:/root:$1$q6Qf.IUu$Bd2tIMFHYYNOsmsIRBwHC0:19650:0:99999:7:::/g' package/base-files/files/etc/shadow

# Remove packages
# rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-homeproxy
git clone -b dev/import https://github.com/muink/homeproxy.git  package/luci-app-homeproxy
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
# Add packages
# git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
git clone --depth=1 https://github.com/ophub/luci-app-amlogic package/amlogic
