固件适配情况:  
    本固件为N1网关服务器(旁路由)模式适配,已添加  iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE  规则.  
    
插件:  
    仅有passwall和少量辅助功能,建议把N1当作网关服务器且只使用科学上网功能的朋友使用.  
    具体情况可参照[固件预览](https://github.com/nantayo/N1-OpenWrt/blob/main/%E5%9B%BA%E4%BB%B6%E9%A2%84%E8%A7%88.jpg)  
    
内核与更新:  
    每周六更新,使用最新的5.4.1XX内核.   
    N1固件从55版本开始支持Xray和SS加速,如无bug一般不需要更新.  

个性化定制:  
    参考[固件个性化定制说明](https://github.com/ophub/amlogic-s9xxx-openwrt/blob/main/router-config/README.cn.md)  

flippy大佬最新帖子:  
    https://www.right.com.cn/forum/thread-4076037-1-1.html
