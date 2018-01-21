// 判断用户是否登录的接口
$(function() {
	window.isLogin = false; //记录用户是否登录
	let userName = '',
		showuserName = $('.trueusername'),
		nologinuser = $('.no-login'),
		hasloginuser = $('.haslogin'),
		smallnologinuser = $('.small-screen-nologin'),
		smallhasloginuser = $('.small-screen-login'),
		normalllogoutuser = $('.logout'),
		//获取点赞对象
		_this = $('.article-like'),
		_thisSpan = _this.find('span'),
		_thisI = _this.find('i'),
		//一下获取评论登录对象
		noticeLoginComment = $('.notice-login'),
		loginWriteComment = $('.writecomment-wrap');

	$.ajax({
			type: 'get',
			url: '/login_status',
			dataType: 'json',
			success: function(data) {
				// alert(data.userName)
				if (data.isLogin) {


					window.isLogin = true;
					// alert(window.isLogin)
					userName = data.user.userName;
					hasloginuser.removeClass('user-afterlogin-hide');
					showuserName.text(userName);
					nologinuser.hide();
					smallnologinuser.hide();
					smallhasloginuser.show();
					noticeLoginComment.hide();
					loginWriteComment.show();
				} else {
					window.isLogin = false;
					logout();


				}
			}

		})
		//header注销，注销更改信息
	function logout() {
		// window.user.isLogin = false;

		if (!hasloginuser.hasClass('user-afterlogin-hide')) {
			hasloginuser.addClass('user-afterlogin-hide');
		}
		nologinuser.show();
		smallnologinuser.show();
		smallhasloginuser.hide();
		//登录评论
		noticeLoginComment.show();
		loginWriteComment.hide();
	}

	//ajax请求，后台清除用户登录
	function ajax_logout() {
		$.ajax({
			url: '/logout',
			success: function(data) {
				// alert(data.message)
				if (data.message === "logout_success") {
					logout();
				}
				window.isLogin = false;

			}
		})
	}
	//点击注销按钮
	smallhasloginuser.click(function() {
		ajax_logout();

	})
	normalllogoutuser.click(function() {
		ajax_logout();

	})

	//一下为点赞功能
	//文件加载就得判断用户点赞状态，若为点赞状态，则心是红的
	_this.click(function() {
		//点赞，若未登录则不能点

		//还要解决，一个用户只能点赞一次
		let nogivelike = true; //替换后台返回的判断
		if (window.isLogin) {
			let num = parseInt(_thisI.text()),
				_thisId = $('#hiddeninputid').val();
			if (_thisSpan.attr('class') === 'fa fa-heart-o' && nogivelike) {
				fleshNumber(_thisId, 1)
				nogivelike = false;

			} else {
				fleshNumber(_thisId, 0)
					// fleshNumber(num-1)
			}
		} else {
			window.open("/login"); //跳转页面，打开新的窗口
			window.history.back(-1); //返回上一页
		}

		// $(this).find('span').removeClass('fa - heart -o').addClass('fa - heart');

	});
	console.log(window.isLogin)
		//id文章id
		//option 0取消点赞 1点赞
	function fleshNumber(id, option) {
		$.ajax({
			type: 'post',
			data: {
				id: id,
				option: option
			},
			url: 'like',
			dataType: 'json',
			success: function(data) {
				if (data.newLikeNum) {
					if (option == 1) {
						_thisSpan.attr('class', 'fa fa-heart');
						_thisI.text(data.newLikeNum);
					} else if (option == 0) {
						_thisSpan.attr('class', 'fa fa-heart-o');
						_thisI.text(data.newLikeNum);
					}
				}

				// _thisI.text(date.number);
			}
		})
	}

	//一下为评论功能
})