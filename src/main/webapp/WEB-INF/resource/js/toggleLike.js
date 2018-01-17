$(function() {
		// body...
		let _this = $('.article-like'),
			_thisSpan = _this.find('span'),
			_thisI = _this.find('i');
		_this.click(function() {
			//点赞，若未登录则不能点
			//还要解决，一个用户只能点赞一次
			let nogivelike = true; //替换后台返回的判断
			if (window.loginSucceed && nogivelike) {
				let num = parseInt(_thisI.text()),
					_thisId = $('#hiddeninputid').val();
				if (_thisSpan.attr('class') === 'fa fa-heart-o') {
					fleshNumber(_thisId, 1)

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
	})
	//