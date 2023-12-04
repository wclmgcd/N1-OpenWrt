#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

# Remove packages
rm -rf feeds/luci/applications/luci-app-passwall feeds/packages/net/haproxy feeds/packages/net/v2ray-geodata

# Add packages
svn co https://github.com/nantayo/my-pkg/trunk package/my-pkg
svn co https://github.com/ophub/luci-app-amlogic/trunk package/amlogic
