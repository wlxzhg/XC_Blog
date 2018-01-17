$(function() {
	let login_button = $('.sign-in-button'),
		form = $('#loginform'),
		uername = $('#session_email_or_mobile_number'),
		password = $('#session_password'),
		nocontent = $('#no-content'),
		errcontent = $('#err-content'),

		login_button.click(function(event) {
			let usrvalueLen = uername.val().length,
				passvaluelen = password.val().length,
				allLen = usrvalueLen && passvaluelen; //两者都不为0才可以
			event.preventDefault(); //阻止表单提交默认行为
			//判断用户名或密码是否填写
			if (!allLen) {
				nocontent.show().siblings().hide();
			} else {
				nocontent.hide();
			}
			$ajax({
				type: 'post',
				url: '',
				data: form.serialize(), //表单序列化，获取input的name和value，形式name1=value1&name2=value2,不获取记住我和登录按钮？
				error: function(request) {
					//提示用户名或密码错误
					errcontent.show().siblings().hide();
				},
				success: function(data) {
					//成功并跳转到首页
					window.loginSucceed = true;
					window.location.href = 'main';
				}
			});
			// $('form').submit();
		});


})