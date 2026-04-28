#!/bin/bash

# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch

# Clone packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
git clone https://github.com/kenzok8/openwrt-clashoo.git package/openwrt-clashoo feeds/luci/applications/luci-app-clashoo


# Clean packages
rm -rf clone
