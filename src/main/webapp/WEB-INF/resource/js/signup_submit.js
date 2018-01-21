$(function() {
	let login_button = $('.sign-up-button'),
		form = $('#loginform'),
		hasdone = $('#hasdone'),
		signsucc = $('#sign-succ'),
		user_nick = $('#user_nickname'),
		user_pass = $('#user_password'),
		nothing = $('#sign-no-content'),
		t = null;

	login_button.click(function(event) {
		event.preventDefault();
		$.ajax({
			type: "post",
			data: {
				email_or_mobile_number: user_nick.val(),
				password: user_pass.val()
			},
			url: '/dosign',
			dataType: 'json',
			error: function(request) {
				alert('有点故障');
			},
			success: function(data) {
				// alert(data.message)
				switch (data.message) {
					case 'parameter_error':
						nothing.show().siblings().hide();
						break;
					case 'user_exist':
						hasdone.show().siblings().hide();
						break;
					case 'sign_success':
						//成功并跳转到登录
						signsucc.show().siblings().hide();
						//3庙后跳转
						t = setTimeout("window.location.href = 'login'", 3000);
						break;
					default:
						alert('小主，你好');
				}
			},

		});
		t = null;
	});

})