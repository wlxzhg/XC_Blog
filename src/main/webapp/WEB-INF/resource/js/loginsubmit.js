$(function() {
	let login_button = $('.sign-in-button'),
		form = $('#loginform'),
		username = $('#session_email_or_mobile_number'),
		password = $('#session_password'),
		nocontent = $('#no-content'),
		errcontent = $('#err-content');

	login_button.click(function(event) {
		// alert(1)
		let user = username.val(),
			pass = password.val(),
			uservalueLen = user.length,
			passvaluelen = pass.length,
			allLen = uservalueLen && passvaluelen; //两者都不为0才可以
		event.preventDefault(); //阻止表单提交默认行为
		//判断用户名或密码是否填写
		if (!allLen) {
			//用户名或密码为空
			nocontent.show().siblings().hide();
		} else {
			nocontent.hide().siblings().hide();
			$.ajax({
				type: "post",
				data: {
					email_or_mobile_number: user,
					password: pass
				},
				url: '/dologin',
				dataType: 'json',
				// error: function(request) {
				// 	//提示用户名或密码错误
				// 	errcontent.show().siblings().hide();
				// },
				success: function(data) {
					// alert(data.message);
					// if (data.message == 'success')

					// 	location.href = "/main";
					switch (data.message) {
						case 'parameter_error':
							nocontent.show().siblings().hide();
							break;
						case 'password_or_username_error':
							errcontent.show().siblings().hide();
							break;
						case 'login_success':
							//成功并跳转到登录
							// signsucc.show().siblings().hide();
							// window.loginSucceed = true;
							// alert(window.loginSucceed)

							location.href = "/"; //这里不是main
							break;
						default:
							alert('小主好久不见');
					}
				}
			})
		}
		// $ajax({
		// 	type: 'post',
		// 	url: '/dologin',
		// 	data: form.serialize(), //表单序列化，获取input的name和value，形式name1=value1&name2=value2,不获取记住我和登录按钮？
		// 	error: function(request) {
		// 		//提示用户名或密码错误
		// 		errcontent.show().siblings().hide();
		// 	},
		// 	success: function(data) {
		// 		//成功并跳转到首页
		// 		window.loginSucceed = true;
		// 		window.location.href = 'main';
		// 	}
		// });

	});


})