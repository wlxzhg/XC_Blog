<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>X.C博客|注册</title>
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/logo.css">
    
    <link rel="stylesheet" href="${resourcePath}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/login_sign.css">
     <!-- <script src="${resourcePath}/js/nobordrForinput.js" type="text/javascript"></script> -->
</head>

<body>
    <div class="forsign">
        <a href="#" class="logina">
            <div class="logo login-position">X.C博客</div>
        </a>
        <div class="main">
            <h4 class="login-title">
			<div class="normal-title">
    			<a  href="/login">登录</a>
    			<b>·</b>
   				 <a  class="active" id="js-sign-up-btn" class="" href="/sign">注册</a>
  			</div>
		</h4>
            <div class="sign-container">
                <!-- action:url 规定当提交表单时向何处发送表单数据。 -->
                <form action="" accept-charset="UTF-8" method="post">
                    <!-- 正常登录登录名输入框 -->
                    <div class="input-prepend restyle">
                        <i class="fa fa-user"></i>
                        <input placeholder="昵称" type="text" name="session[email_or_mobile_number]" id="user_nickname" />
                    </div>
                    <div class="input-prepend">
                        <i class="fa fa-key"></i>
                        <input placeholder="设置密码" type="password" name="session[password]" id="user_password" />
                    </div>
                   <!--  <div class="remember-btn">
                        <input type="checkbox" value="true" checked="checked" name="session[remember_me]" id="session_remember_me" /><span>记住我</span>
                    </div> -->
                    <input type="submit" name="commit" value="注册" class="sign-up-button" data-disable-with="注册" />
                </form>
                <!-- 更多登录方式 -->
                <p class="sign-up-msg">点击 “注册” 即表示您同意并愿意遵守X.C博客的<br> <a target="_blank" href="/agreement">用户协议。</a></p>
                    
                </div>
            </div>
        </div>
    </div>
    
</body>

</html>