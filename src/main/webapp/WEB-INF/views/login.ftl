<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>X.C博客|登录</title>
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/logo.css">
    
    <link rel="stylesheet" href="${resourcePath}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${resourcePath}/css/login_sign.css">
    <script src="${resourcePath}/static/jq/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${resourcePath}/js/loginsubmit.js" type="text/javascript"></script>
</head>

<body>
    <div class="forsign">
        <a href="#" class="logina">
            <div class="logo login-position">X.C博客</div>
        </a>
        <div class="main">
            <h4 class="login-title">
			<div class="normal-title">
    			<a class="active" href="/login">登录</a>
    			<b>·</b>
   				 <a id="js-sign-up-btn" class="" href="/sign">注册</a>
  			</div>
                 <!-- 提示信息 ,内容不为空或密码错误-->
                 <div> <div class="prompt" id="no-content">输入不能为空</div>
    <div class="prompt" id="err-content">用户名或密码有误</div></div>
   
		</h4>
            <div class="sign-container">
                <!-- action:url 规定当提交表单时向何处发送表单数据。 -->
                <!-- <form action="/dologin" accept-charset="UTF-8" method="post"> -->
                <form id="loginform" accept-charset="UTF-8">
                    <!-- 正常登录登录名输入框 -->
                    <div class="input-prepend restyle">
                        <i class="fa fa-user"></i>
                        <input placeholder="手机号或邮箱" type="text" name="email_or_mobile_number" id="session_email_or_mobile_number" />
                    </div>
                    <div class="input-prepend">
                        <i class="fa fa-key"></i>
                        <input placeholder="密码" type="password" name="password" id="session_password" />
                    </div>
                    <div class="remember-btn">
                        <input type="checkbox" value="true" checked="checked" name="session[remember_me]" id="session_remember_me" /><span>记住我</span>
                    </div>
                    <input type="button" name="commit" value="登录" class="sign-in-button" data-disable-with="登录"/>
                    <!-- <button name="commit" value="登录" class="sign-in-button" data-disable-with="登录" ></button> -->
                </form>
                <!-- 更多登录方式 -->
                <div class="more-sign">
                    <h6>社交帐号登录</h6>
                    <ul>
                        <li id="weibo-link-wrap" class="weibo-loading">
                            <a class="weibo" id="weibo-link">
     						<i class="fa fa-weibo"></i>
  						  </a>
                        </li>
                        <li><a class="weixin" target="_blank" href="/users/auth/wechat"><i class="fa fa-wechat"></i></a></li>
                        <li><a class="qq" target="_blank" href="/users/auth/qq_connect"><i class="fa fa-qq"></i></a></li>
                        
                    </ul>
                    <div class="weibo-geetest-captcha"></div>
                </div>
            </div>

        </div>
    </div>
    
</body>

</html>