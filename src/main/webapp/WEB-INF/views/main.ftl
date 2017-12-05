<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <title>X.C博客|关注科技，分享生活</title>
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/header.css">
    <link rel="stylesheet" href="${resourcePath}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="${resourcePath}/static/jq/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/header.js" type="text/javascript"></script>


</head>

<body>
    <header class="header" id="header">
        <div class="header-topbar" id="header-topbar">
            <nav class="header-top">
                <ul class="header-topbar-login">
                    <li><a href="#"><span class="fa fa-user-o"></span> 注册</a></li>
                    <li><a href="#"><span class="fa fa-user"></span> 登录</a></li>
                </ul>
                <ul class="header-topbar-about">
                    <li><a href="#"><span class="fa fa-hand-pointer-o"></span> 关于</a></li>
                    <li><a href="#"><span class="fa fa-hand-paper-o"></span> 其他</a></li>
                </ul>
            </nav>
        </div>
        <div class="header-nav" id="header-nav">
            <nav class="header-bottom">
                <div class="logo" id="logo">X.C博客</div>
                <div class="search"><span class="fa fa-search"></span></div>
                <div class="main-nav" id="main-nav">
                    <ul class="main-nav-list" id="main-nav-list">
                        <li><a href=""><span class="fa fa-home"></span> 首页</a></li>
                        <!-- <li><a href="">web前端</a></li> -->
                        <li><a href=""><span class="fa fa-file-text"></span> 技术干货</a></li>
                        <li><a href=""><span class="fa fa-play-circle-o"></span> 音乐</a></li>
                        <li><a href=""><span class="fa fa-magic"></span> 人工智能</a></li>
                        <!-- <li><a href="">黑科技</a></li> -->
                        <li><a href=""><span class="fa fa-angle-double-down"></span> 更多</a></li>
                    </ul>
                    <ul class="main-nav-list-iphone" id="main-nav-list-iphone">
                        <li><a href=""><span class="fa fa-home"></span> 首页</a></li>
                        <li><a href=""><span class="fa fa-bars"></span> 更多</a></li>
                        <li><a href=""><span class="fa fa-user"></span> 登录</a></li>
                    </ul>
                </div>
                <!-- <div class="main-nav-iphone" id="main-nav-iphone">
                    <ul class="main-nav-list-iphone" id="main-nav-list-iphone">
                        <li><a href=""><span class="fa fa-bars"></span></a></li>
                        <li><a href=""><span class="fa fa-user"></span></a></li>
                    </ul>
                </div> -->
            </nav>
        </div>
    <div>
        <#list blogs as blog>
            <div>
                <h4>标题：${blog.title}</h4>
                <p>简介：${blog.brief}</p>
                <p>id:${blog.id}</p>
                <p>类别:${blog.categoryCode}</p>
                <p>创建时间:${blog.createTime}</p>
                <p>修改时间：${blog.modifyTime}</p>
                <p>喜欢：${blog.likeNum}</p>
                <p>浏览：${blog.browseNum}</p>
                <p>评论:${blog.commentNum}</p>
            </div>
            <br>
        </#list>
    </div>
</header>
<div></div>
<footer></footer>
</body>

</html>