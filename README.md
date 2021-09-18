固件适配情况:  
    本固件为N1网关服务器模式(旁路由)适配,已添加iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE规则.  
    
插件:  
    仅保留passwall插件和几个辅助性插件,建议把N1当作网关服务器且只使用科学上网功能.  
    具体情况可参照[固件预览](https://github.com/nantayo/N1-OpenWrt/blob/main/%E5%9B%BA%E4%BB%B6%E9%A2%84%E8%A7%88.jpg)  
    
内核与更新:  
    每周六凌晨自动进行编译,使用flippy大佬正式发布固件中最新的5.4.1XX内核.   
    N1固件已经达到几乎完美的程度,从55版本开始支持Xray和SS加速,如无bug一般不需要更新.  
    每周新版固件我会第一时间刷入测试,如果发现某一周固件没有更新,这通常表明固件存在bug,release被我删除了.

个性化定制:  
    参考[固件个性化定制说明](https://github.com/ophub/amlogic-s9xxx-openwrt/blob/main/router-config/README.cn.md)  

flippy大佬最新帖子:  
    https://www.right.com.cn/forum/thread-4076037-1-1.html
