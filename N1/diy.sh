#!/bin/bash

echo "=== Starting diy.sh ==="

# 修改默认 IP 和密码
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate
sed -i 's/^root:.*:/root:$1$q6Qf.IUu$Bd2tIMFHYYNOsmsIRBwHC0:19650:0:99999:7:::/g' package/base-files/files/etc/shadow

# 强制关闭 naiveproxy（防止被其他地方重新启用）
sed -i '/CONFIG_PACKAGE_naiveproxy=y/d' .config 2>/dev/null || true
echo "# CONFIG_PACKAGE_naiveproxy is not set" >> .config

# 更新 golang 和 homeproxy（保留你原来的操作）
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 26.x feeds/packages/lang/golang

rm -rf feeds/luci/applications/luci-app-homeproxy package/luci-app-homeproxy
git clone --depth=1  https://github.com/lxiaya/openwrt-homeproxy.git package/luci-app-homeproxy

# rm -rf feeds/luci/applications/luci-app-openclash package/luci-app-openclash
# git clone https://github.com/vernesong/OpenClash.git package/luci-app-homeproxy

git clone https://github.com/QiuSimons/luci-app-daed package/daed

# git clone https://github.com/nikkinikki-org/OpenWrt-nikki.git package/luci-app-nikki
# git clone https://github.com/kenzok8/openwrt-clashoo.git package/openwrt-clashoo
git clone --depth=1 https://github.com/ophub/luci-app-amlogic package/amlogic

# 清理 gn 残留（非常重要）
rm -rf build_dir/hostpkg/gn* staging_dir/hostpkg/gn* tmp/gn* 2>/dev/null || true

echo "=== diy.sh completed, naiveproxy disabled ==="
