<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>X.C博客|关注科技，分享生活</title>
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/logo.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/content.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/content-search.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/tags.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/articles.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/sidebar.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/music.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/jokes.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/backtotop.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/automedia.css">
    <link rel="stylesheet" href="${resourcePath}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    
    <script src="${resourcePath}/static/jq/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/userLoginInterface.js" type="text/javascript"></script> 
    <script src="${resourcePath}/js/header.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/tags.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/musicSlide.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/pay.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/headerposition.js" type="text/javascript"></script>
    <!-- <script src="${resourcePath}/js/test.js" type="text/javascript"></script> -->
    <script src="${resourcePath}/js/toTop.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/jumpArticle.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/login_change_information.js" type="text/javascript"></script>
   

</head>

<body>
    <header class="header" id="header">
        <div class="header-topbar" id="header-topbar">
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
                <div class="haslogin  user-afterlogin-hide">
                    <ul class="header-topbar-login ">
                        <li><span class="fa fa-user-circle-o"></span> <span class="trueusername"> 替换用户名称</span></li>
                    </ul>
                    <ul class="header-topbar-about">
                        <li class="logout"><span class="fa fa-circle-o-notch"></span> 注销</li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="header-nav" id="header-nav">
            <nav class="com header-bottom">
                <div class="logo" id="logo">X.C博客</div>
                <div class="search" id="search"><span class="fa fa-search" id="search-nav"></span></div>
                <div class="main-nav" id="main-nav">
                    <ul class="main-nav-list" id="main-nav-list">
                        <li><a href="/" class="navdefault-color"><span class="fa fa-home"></span> 首页</a></li>
                        <!-- <li><a href="">web前端</a></li> -->
                        <li><a href="#"><span class="fa fa-file-text"></span> 技术干货</a></li>
                        <li><a href="#"><span class="fa fa-music"></span> 音乐</a></li>
                        <li><a href="#"><span class="fa fa-magic"></span> 人工智能</a></li>
                        <!-- <li><a href="">黑科技</a></li> -->
                        <li class="nave-more"><a href="#"><span class="fa fa-angle-double-down"></span> 更多</a>
                            <ul class="more-list" id="more-list">
                                <li><a href="#"><span class="fa fa-smile-o"></span>  开心一刻</a></li>
                                <li><a href="#"><span class="fa fa-clock-o"></span>  美食时间</a></li>
                                <li><a href="#"><span class="fa fa-language"></span>  地道方言</a></li>
                                <li><a href="#"><span class="fa fa-motorcycle"></span>  X.C.健身</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <ul class="main-nav-list-iphone" id="main-nav-list-iphone">
                    <li><a href="/main"><span class="fa fa-home"></span> 首页</a></li>
                    <li class="small-more" id="small-more"><a href="#"><span class="fa fa-bars"></span> 更多</a></li>
                    <li class="small-screen-nologin"><a href="/login"><span class="fa fa-user"></span> 登录</a></li>
                    <li class="small-screen-login"><a href="/"><span class="fa fa-user"></span> <span class="trueusername"> 替换用户名称</span></a></li>
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
    <div id="content" class="content">
        <ul class="small-nav-list" id="small-nav-list">
            <li class="small-list-remove" id="small-list-remove"><span class="fa fa-remove"></span></li>
            <li><a href="#"><span class="fa fa-file-text"></span> 技术干货</a></li>
            <li><a href="#"><span class="fa fa-music"></span> 音乐相随</a></li>
            <li><a href="#"><span class="fa fa-magic"></span> 人工智能</a></li>
            <li><a href="#"><span class="fa fa-smile-o"></span>  开心一刻</a></li>
            <li><a href="#"><span class="fa fa-clock-o"></span>  美食时间</a></li>
            <li><a href="#"><span class="fa fa-language"></span>  地道方言</a></li>
            <li><a href="#"><span class="fa fa-motorcycle"></span>  X.C.健身</a></li>
        </ul>
        <div class="content-top">
            <div class="left-content" id="left-content">
                <#list blogs as blog>
                    <div class="left-content-list">
                        <div class="article-left">
                            <h2 class="article-title"><a href="#">${blog.title}</a></h2>
                            <input type="hidden" value="${blog.id}">
                            <div class="article-content">首先咱先分析一下。打眼一看，loading图分成三部分：1、外侧3/4圆弧2、内侧浅色圆饼3、内侧深色圆饼。外侧圆弧的制作，上篇文章已经说过了，您可以看这。下面我们主要来介绍圆饼及其动画的实现，详细代码您可以点这。</div>
                            <div class="article-eye">
                                <div class="create-time fa fa-clock-o"> ${blog.createTime}</div>
                                <div class="visit fa fa-eye"> ${blog.browseNum}</div>
                                <div class="comment fa fa-comment"> ${blog.commentNum}</div>
                                <div class="for-good fa fa-heart"> ${blog.likeNum}</div>
                            </div>
                        </div>
                        <div class="article-right">
                            <img src="${resourcePath}/static/images/article1/article1.jpg">
                        </div>
                    </div>
                </#list>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-top">
                    <div class="classfiy">
                        <h3 class="classfiy-title">分类</h3>
                        <ul class="classfiy-list">
                            <li><a href="#">扯点技术(<span>0</span>)</a></li>
                            <li><a href="#">听听音乐(<span>0</span>)</a></li>
                            <li><a href="#">烧脑的AI(<span>0</span>)</a></li>
                            <li><a href="#">轻松一刻(<span>0</span>)</a></li>
                            <li><a href="#">美食不停(<span>0</span>)</a></li>
                            <li><a href="#">感受风景(<span>0</span>)</a></li>
                            <li><a href="#">一起运动(<span>0</span>)</a></li>
                        </ul>
                    </div>
                    <div class="new-articles">
                        <h3 class="new-articles-title">最新文章</h3>
                        <ul class="new-articles-list">
                            <li><a href="#">最新文章最新文章最新文章最新文章最新文章最新文章最新文章</a></li>
                            <li><a href="#">最新文章最新文章最新文章最新文章最新文章最新文章最新文章最新文章</a></li>
                            <li><a href="#">最新文章最新文章最新文章最新文章最新文章最新文章最新文章最新文章</a></li>
                            <li><a href="#">最新文章最新文章最新文章最新文章最新文章最新文章最新文章最新文章</a></li>
                            <li><a href="#">最新文章最新文章最新文章最新文章最新文章最新文章最新文章最新文章</a></li>
                            <li><a href="#">最新文章最新文章最新文章最新文章最新文章最新文章最新文章最新文章</a></li>
                        </ul>
                    </div>
                </div>
                <div class="sidebar-bottom" id="sidebar-bottom">
                    <div class="frends-link">友情链接</div>
                    <a class='tags' href="https://www.baidu.com/" target="_blank">百度</a>
                    <a class='tags' href="https://www.google.com/" target="_blank">谷歌</a>
                    <a class='tags' href="https://www.aliyun.com/" target="_blank">阿里云</a>
                    <a class='tags' href="https://www.qq.com/" target="_blank">腾讯</a>
                    <a class='tags' href="https://www.imooc.com/" target="_blank">慕课网</a>
                    <a class='tags' href="http://study.163.com/" target="_blank">网易云课堂</a>
                    <a class='tags' href="http://music.163.com/" target="_blank">网易云音乐</a>
                    <a class='tags' href="http://ife.baidu.com/" target="_blank">百度前度技术学院</a>
                    <a class='tags' href="http://www.huawei.com/cn/" target="_blank">华为</a>
                    <a class='tags' href="https://www.mi.com/" target="_blank">小米</a>
                    <a class='tags' href="https://www.csdn.net/" target="_blank">CSDN</a>
                    <a class='tags' href="https://www.zhihu.com/" target="_blank">知乎</a>
                    <a class='tags' href="https://github.com/" target="_blank">github</a>
                    <a class='tags' href="https://segmentfault.com/" target="_blank">segmentfault</a>
                    <a class='tags' href="https://reactjs.org/docs/hello-world.html" target="_blank">React</a>
                    <a class='tags' href="https://developer.mozilla.org/zh-CN/" target="_blank">MDN</a>
                    <a class='tags' href="http://www.cnki.net/" target="_blank">中国知网</a>
                    <a class='tags' href="http://xueshu.baidu.com/" target="_blank">百度学术</a>
                    <a class='tags' href="http://es6.ruanyifeng.com/" target="_blank">ECMAScript6入门</a>
                    <a class='tags' href="https://codepen.io/#" target="_blank">CodePen</a>
                    <a class='tags' href="http://www.w3school.com.cn/" target="_blank">W3school</a>
                    <a class='tags' href="http://www.jianshu.com/u/e78d3ba39744" target="_blank">简书主页</a> <a class='tags' href="https://www.baidu.com/" target="_blank">百度</a>
                    <a class='tags' href="https://www.google.com/" target="_blank">谷歌</a>
                    <a class='tags' href="https://www.aliyun.com/" target="_blank">阿里云</a>
                    <a class='tags' href="https://www.qq.com/" target="_blank">腾讯</a>
                    <a class='tags' href="https://www.imooc.com/" target="_blank">慕课网</a>
                    <a class='tags' href="http://study.163.com/" target="_blank">网易云课堂</a>
                    <a class='tags' href="https://www.mi.com/" target="_blank">小米</a>
                    <a class='tags' href="https://www.csdn.net/" target="_blank">CSDN</a>
                    <a class='tags' href="https://www.zhihu.com/" target="_blank">知乎</a>
                    <a class='tags' href="https://github.com/" target="_blank">github</a>
                    <a class='tags' href="https://segmentfault.com/" target="_blank">segmentfault</a>
                    <a class='tags' href="https://reactjs.org/docs/hello-world.html" target="_blank">React</a>
                    <a class='tags' href="https://developer.mozilla.org/zh-CN/" target="_blank">MDN</a>
                    <a class='tags' href="http://www.cnki.net/" target="_blank">中国知网</a>
                    <a class='tags' href="http://xueshu.baidu.com/" target="_blank">百度学术</a>
                    <a class='tags' href="https://codepen.io/#" target="_blank">CodePen</a>
                    <a class='tags' href="http://www.w3school.com.cn/" target="_blank">W3school</a>
                    <a class='tags' href="http://www.jianshu.com/u/e78d3ba39744" target="_blank">简书主页</a>
                </div>
            </div>
        </div>
        <div class="content-bottom">
            <div class="cont-bott-left" id="cont-bott-left">
                <div class="hipi-joke-title">嗨皮Music</div>
                <div id="music-img">
                    <img class='music' src="${resourcePath}/static/images/music/zhangliangying.png" alt="music">
                    <img class='music' src="${resourcePath}/static/images/music/zhangbichen.jpg" alt="music">
                    <img class='music' src="${resourcePath}/static/images/music/lironghao.jpg" alt="music">
                </div id='arrow'>
                <span class="left-slide" id="left-slide"><</span>
                <span class="right-slide" id="right-slide">></span>
            </div>
            <div class="cont-bott-right">
                <p class="hipi-joke-title">开心Jokes</p>
                <div id="wrap">
                    <div class="common font">快</div>
                    <div class="common left">来</div>
                    <div class="common back">进</div>
                    <div class="common right">点</div>
                </div>
            </div>
        </div>
        <div class="back-to-top" id="back-to-top">
            <div class="to-top-arrow"></div>
        </div>
    </div>
    <footer>
        <div class="footer-wrap">
            <div class="com footer-top">
                <div class="this-net">
                    <h4>关于本站</h4>
                    <div>关注科技，分享生活</div>
                </div>
                <div class="support-us" id="supportUs">
                    <h4>支持我们</h4>
                    <div class="fa fa-rmb pay"> </div>
                    <div class=" fa fa-wechat pay"> </div>
                    <img class='QRcode baopay' id='baopay' src="${resourcePath}/static/images/pay/paybao.jpg" alt="supportUs">
                    <img class='QRcode weipay' id='weipay' src="${resourcePath}/static/images/pay/weixin.jpg" alt="supportUs">
                </div>
            </div>
        </div>
        <div class=" footer-bottom">Copyright © 2017
            <a href="#">X.C博客</a>版权所有</div>
    </footer>
</body>

</html>