<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>X.C博客|阅读</title>
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/logo.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/automedia.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/content-search.css">
    <link rel="stylesheet" href="${resourcePath}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/readingarticle.css">
    <!--  <link href="http://cdn.bootcss.com/highlight.js/8.0/styles/monokai_sublime.min.css" rel="stylesheet"> -->
     <link href="${resourcePath}/css/md/sublime.css" rel="stylesheet">
    <link rel="stylesheet" href="${resourcePath}/css/md/md.css">
    <script src="${resourcePath}/static/jq/jquery-3.2.1.min.js" type="text/javascript"></script>
      <script src="${resourcePath}/js/userLoginInterface.js" type="text/javascript"></script> 
    <script src="${resourcePath}/js/header.js" type="text/javascript"></script>
    <!-- <script src="${resourcePath}/js/toggleLike.js" type="text/javascript"></script> 文件转移到接口文件中-->
    <script src="${resourcePath}/js/articleSupport.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/pay.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/center.js"></script>
    
    <script src="${resourcePath}/js/loginForComment.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/login_change_information.js" type="text/javascript"></script>
    <script src="${resourcePath}/static/markDownStatic/marked.min.js"></script>
    <script src="http://cdn.bootcss.com/highlight.js/8.0/highlight.min.js"></script>
    <!-- <script src="${resourcePath}/static/markDownStatic/highlight.js"></script> -->



</head>

<body>
    <!-- <header class="header" id="header">
        <div class="header-topbar" id="header-topbar"> -->
            <header class="header" id="header">
        <div class="header-topbar" id="header-topbar">
            <!-- <nav class="com header-top">
                <ul class="header-topbar-login">
                    <li><a href="/sign"><span class="fa fa-user-o"></span> 注册</a></li>
                    <li><a href="/login"><span class="fa fa-user"></span> 登录</a></li>
                </ul>
                <ul class="header-topbar-about">
                    <li><a href="#"><span class="fa fa-hand-pointer-o"></span> 关于</a></li>
                    <li><a href="#"><span class="fa fa-hand-paper-o"></span> 其他</a></li>
                </ul>
            </nav> -->
            <nav class="com header-top">
                <div class="no-login">
                    <ul class="header-topbar-login">
                        <li><a href="/sign"><span class="fa fa-user-o"></span> 注册</a></li>
                        <li><a href="/login"><span class="fa fa-user"></span> 登录</a></li>
                    </ul>
                    <ul class="header-topbar-about">
                        <li><a href="#"><span class="fa fa-hand-pointer-o"></span> 关于</a></li>
                        <li><a href="#"><span class="fa fa-hand-paper-o"></span> 其他</a></li>
                    </ul>
                </div>
                <div class="haslogin user-afterlogin-hide">
                    <ul class="header-topbar-login ">
                        <li><span class="fa fa-user-circle-o"></span> <span class="trueusername"> 替换用户名称</span></li>
                    </ul>
                    <ul class="header-topbar-about">
                        <li><a href="/myAticle"><span class="fa fa-file"></span> <span class="myAticle"> 我的文章</span></a></li>
                        <li class="logout"><span class="fa fa-circle-o-notch"></span>注销</li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="header-nav" id="header-nav">
            <nav class="com header-bottom">
                <div class="logo" id="logo">X.C博客</div>
                <div class="search" id="search"><span class="fa fa-search" id="search-nav"></span></div>
                <div class="main-nav">
                    <ul class="main-nav-list" id="main-nav-list">
                        <li><a href="/" class="navdefault-color"><span class="fa fa-home"></span> 首页</a></li>
                        <!-- <li><a href="">web前端</a></li> -->
                        <li><a href="#"><span class="fa fa-file-text"></span> 技术干货</a></li>
                        <li><a href="#"><span class="fa fa-music"></span> 音乐</a></li>
                        <li><a href="#"><span class="fa fa-magic"></span> 人工智能</a></li>
                        <!-- <li><a href="">黑科技</a></li> -->
                        <li class="nave-more"><a href="#"><span class="fa fa-angle-double-down"></span> 更多</a>
                            <ul class="more-list">
                                <li><a href="#"><span class="fa fa-smile-o"></span>  开心一刻</a></li>
                                <li><a href="#"><span class="fa fa-clock-o"></span>  美食时间</a></li>
                                <li><a href="#"><span class="fa fa-language"></span>  地道方言</a></li>
                                <li><a href="#"><span class="fa fa-motorcycle"></span>  X.C.健身</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
               <!--  <ul class="main-nav-list-iphone" >
                    <li><a href="#"><span class="fa fa-home"></span> 首页</a></li>
                    <li class="small-more" id="small-more"><a href="#"><span class="fa fa-bars"></span> 更多</a></li>
                    <li><a href="#"><span class="fa fa-user"></span> 登录</a></li>
                </ul> -->
                <!-- 小屏幕 -->
                 <ul class="main-nav-list-iphone" >
                    <li><a href="/main"><span class="fa fa-home"></span> 首页</a></li>
                    <li class="small-more" ><a href="#"><span class="fa fa-bars"></span> 更多</a></li>
                    <li class="small-screen-nologin"><a href="/login"><span class="fa fa-user"></span> 登录</a></li>
                    <li class="small-screen-login"><a href="#"><span class="fa fa-user"></span> <span class="trueusername"> 替换用户名称</span></a></li>
                </ul>
                <div class="content-search" id="content-search">
                    <form>
                        <input type="text" name="search" value="输入搜索内容" class="search-text" id="search-text">
                        <button class="fa fa-search content-submit" id="content-submit"></button>
                    </form>
                </div>
            </nav>
        </div>
    </header>
    <!--   <div class="content">
     </div> -->
    <div class="reading-article-wrap">
        <ul class="small-nav-list" >
            <li class="small-list-remove" ><span class="fa fa-remove"></span></li>
            <li><a href="#"><span class="fa fa-file-text"></span> 技术干货</a></li>
            <li><a href="#"><span class="fa fa-music"></span> 音乐相随</a></li>
            <li><a href="#"><span class="fa fa-magic"></span> 人工智能</a></li>
            <li><a href="#"><span class="fa fa-smile-o"></span>  开心一刻</a></li>
            <li><a href="#"><span class="fa fa-clock-o"></span>  美食时间</a></li>
            <li><a href="#"><span class="fa fa-language"></span>  地道方言</a></li>
            <li><a href="#"><span class="fa fa-motorcycle"></span>  X.C.健身</a></li>
        </ul>
        <div class=" article-position-com">
            <input type="hidden" value="${blog.id}" id="hiddeninputid">
            <div>${blog.title}</div>
            <div>${blog.text}</div>
            <div>${blog.text}</div>
        </div>
        <div class="like-and-support">
            <div class="article-like-support article-like">
                <#if isLike == "true">
                    <span class="fa fa-heart"></span>喜欢|<i class="like-num">${blog.likeNum}</i>
                <#else>
                    <span class="fa fa-heart-o"></span>喜欢|<i class="like-num">${blog.likeNum}</i>
                </#if>

            </div>
            <div class="article-like-support article-support" id="article-support">赞赏支持</div>
        </div>
        <div class="article-comment reading-article-wrap">
            <img class='login-for-comment' src="${resourcePath}/static/images/login/login.png" alt="login">
            <div class="notice-login ">
                <a href="/login">
                    <button>登录</button>
                </a>
                <span>后发表评论...</span>
            </div>
            <!-- <div class="writecomment-wrap notice-login-showorhidden"> -->
            <div class="writecomment-wrap">
                <textarea class="writecomment" name="comment" id="writecomment" placeholder="写下您的评论..." autocomplete="off"></textarea>
            </div>
        </div>
    </div>
    <div class="support-author clicksupportshow">
        <div class="paytext">请作者吃糖</div>
        <div class="img-pay">
            <div class="pay-wrap pay-show">
                <img class='article-QRcode' src="${resourcePath}/static/images/pay/weixin.jpg" alt="supportUs">
                <img class='wechatpay' src="${resourcePath}/static/images/pay/wechat/wechat.png" alt="supportUs">
            </div>
            <div class="pay-wrap">
                <img class='article-QRcode' src="${resourcePath}/static/images/pay/paybao.jpg" alt="supportUs">
                <img class='alipay' src="${resourcePath}/static/images/pay/alipay/alipay.png" alt="supportUs">
            </div>
        </div>
        <!--   <div class="pay-wrap">  -->
        <div class="paytext change-pay-method">更换支付方式</div>
    </div>
    <div id="screen"></div>
</body>

</html>