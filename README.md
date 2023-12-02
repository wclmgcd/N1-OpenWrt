# 2023 年 6 月告知
作者已于本月硕士毕业，N1 也随之退役，本项目进入养老阶段😉🤞。未来仍会利用 GitHub Actions 自动更新，但不会再积极增删功能或调试配置，有疑问仍可到[讨论区](https://github.com/nantayo/N1-OpenWrt/discussions)提问，作者有空会予以解答。
***
# 项目简介
本固件适配斐讯 N1 旁路由模式，追求轻量。固件中包含默认皮肤、完整 IPv6 支持，以及下列 luci-app：<br>
[luci-app-amlogic](https://github.com/ophub/luci-app-amlogic)：系统更新、文件传输、CPU 调频等功能<br>
luci-app-dockerman：docker 管理功能<br>
[luci-app-mosdns](https://github.com/sbwml/luci-app-mosdns)：DNS 处理器，可去广告、缓存 DNS、防泄漏等功能<br>
[luci-app-passwall](https://github.com/xiaorouji/openwrt-passwall)：科学上网功能<br>
luci-app-samba4：存储共享功能<br>
其中 mosdns、dnsmasq、passwall 配置文件已调试好，开机可用。
***
# 致谢
本项目基于天灵的 [OpenWrt-23.05](https://github.com/immortalwrt/immortalwrt/tree/openwrt-23.05) 源码编译，使用 flippy 的[脚本](https://github.com/unifreq/openwrt_packit)和 breakings 维护的[内核](https://github.com/breakings/OpenWrt/releases/tag/kernel_stable)打包成完整固件，感谢开发者们的无私分享。<br>
flippy 固件的更多细节参考[恩山论坛帖子](https://www.right.com.cn/forum/thread-4076037-1-1.html)。
