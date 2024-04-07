#!/bin/bash
cd openwrt
# Modify default IP
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

#修改密码
sed -i 's/^root:.*:/root:$1$q6Qf.IUu$Bd2tIMFHYYNOsmsIRBwHC0:19650:0:99999:7:::/g' package/base-files/files/etc/shadow


# Add luci-app-passwall2
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package-temp
cp -r package-temp/* package/
rm -rf package-temp
git clone https://github.com/xiaorouji/openwrt-passwall2.git package-temp
mv -f package-temp/luci-app-passwall2 package/
rm -rf package-temp



# Add luci-app-amlogic
git clone https://github.com/ophub/luci-app-amlogic.git  package-temp/luci-app-amlogic
mv -f package-temp/luci-app-amlogic/luci-app-amlogic package/
rm -rf package-temp

# Add luci-app-amlogic
git clone https://github.com/gngpp/luci-theme-design.git  package/luci-theme-design

git clone --depth=1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
