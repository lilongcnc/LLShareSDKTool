# LLShareSDKTool
基于第三方分享ShareSDK封装的一套分享框架

###效果图
![效果图](http://upload-images.jianshu.io/upload_images/594219-d4f0b8caf7eeebf4.gif?imageMogr2/auto-orient/strip)

###由来
前段时间逛 Miss唐 小姐的 GitHub 发现她封装了友盟的社会化分享组件.恰巧我们公司是 shareSDK的,并不一样.然而合在一起,也是市面上最主流的两种第三方分享框架了.所以今天把公司基于 shareSDK 的分享封装贴出来.供大家直接使用. 移步 Miss唐 的友盟分享地址: [点我啊](https://github.com/saitjr/STShareTool)

###关于第三方的社会化分享
关于介入的细节, Miss唐 GitHub 的介绍下边已经说得很清楚,这里我就简单提几点:

**`接入成功之前:`**

>1. 示例报错:error:redirect_uri_mismatch)
>2. 腾讯分享报错:"分享失败:Error Domain=ShareSDKErrorDomain Code=202 "(null)" UserInfo={error_message=Platform［QQ］Not import TencentOpenApi.framework!Please import the framework and try again!}"

>3. 注意添加白名单
>4. 适配 iOS9


**`接入成功之后:`**
>1. 平台分享规则

>2. 如何隐藏 shareSDk 自带的编辑分享界面

>3. 区分 应用内分享(网页分享) 和 客户端分享

>4. shareSDK的菜单标题为英语



###解决上边提到的
**`接入成功之前:`**

**1.示例报错:error:redirect_uri_mismatch)**

**解决:**[解决问题地址](http://blog.csdn.net/typingios/article/details/9110073)

**2.腾讯分享报错:"分享失败:Error Domain=ShareSDKErrorDomain Code=202 "(null)" UserInfo={error_message=Platform［QQ］Not import TencentOpenApi.framework!Please import the framework and try again!}"**

**解决:** activePlatforms:中忘记添加对应的枚举.
![](http://upload-images.jianshu.io/upload_images/594219-a13d688cafc10fe8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
[shareSDK 报错帖子集合地址](http://bbs.mob.com/thread-30-1-1.html)

**3.注意添加白名单**

**解决:**白名单的添加方式: 直接把 info.plist 右键'open as shorceCode'的方式添加
[各平台对应的白名单地址](http://dev.umeng.com/social/ios/ios9#2)

**4.适配 iOS9**

**解决:**
[适配 iOS9](http://dev.umeng.com/social/ios/ios9#2)

**`接入成功之后:`**

**1.平台分享规则**
**解决:**
[关于新浪,QQ, 微信等分享规则地址](http://wiki.mob.com/%E5%B9%B3%E5%8F%B0%E7%89%B9%E6%AE%8A%E6%80%A7/)

**2.如何隐藏 shareSDk 自带的编辑分享界面**
**解决:** 
![](http://upload-images.jianshu.io/upload_images/594219-67cf544a304d293a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**3.区分 应用内分享(网页分享) 和 客户端分享**

**解决:**
应用内分享(又叫网页分享)就是类似于一键分享,你一点击分享,直接就提示分享成功或者失败.这种只要第一次在应用中授权一次即可做到.  简书的分享就是应用内分享,自定义分编辑菜单

客户端分享,就是跳转到对应的手机客户端,在其客户端自己编辑内容框中,编辑和分享,完成后跳转回我们自己的应用.

![](http://upload-images.jianshu.io/upload_images/594219-bd8592624c0b01fe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**`小结:`**有的平台只能网页分享，例如Twitter，人人网等，有的平台可以网页分享也可以客户端分享，例如微博，有的平台只能客户端分享，例如微信，QQ

**4.shareSDK的菜单标题为英语**

**解决:**
一般语言是根据手机语言转换的.但是有时候也会遇到应用语言和本机语言不匹配的结果.这种情况下,这种情况下,可以通过下边两图中的任意一种解决:

![图1](http://upload-images.jianshu.io/upload_images/594219-8d4295052013325a.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![图2](http://upload-images.jianshu.io/upload_images/594219-59f912f4cb60b2d3.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###关于自定义分享界面
自定义分享界面的逻辑,就是自定义分享的界面,然后把 shareSDk提供的专门针对每个平台分分享方法写到对应的点击事件中去. Demo 中就不做体现了. UI 写的好,你也可以实现 网易新闻 的那种分享界面效果.

###下载 地址
具体的 Demo 代码可以在我的 GitHub 上找到 [Demo地址](https://github.com/lilongcnc/LLShareSDKTool)

---
希望能和大家交流技术

我的博客地址: <http://www.lilongcnc.cc/>

---
