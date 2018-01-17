$(function() {
	let moreList = $('.more-list'),
		moreNav = $('.nave-more'),
		moreNavA = moreNav.children('a'),
		smalllogin = $('.small-screen-login'),
		smallnologin = $('.small-screen-nologin');

	//小屏幕下，鼠标滑过用户名，显示全部用户，并提示点击退出登录

	smalllogin.hover(function(e) {
		var value = $(this).text(),
			tooltip = "<div id='tooltip'>" + value + "<br>点击注销</div>";
		// alert(tooltip)
		$('body').append(tooltip);
		$('#tooltip').css({
			'top': e.pageY + 10 + 'px',
			'left': e.pageX + 10 + 'px',
			'position': 'absolute',
			'zIndex': '99999',
			'background': '#0a0',
			'color': '#fff',
			'fontSize': '10px'
		}).show();
	}, function() {
		$('#tooltip').remove();
	})
	smalllogin.click(function() {
		smallnologin.show();
		$(this).hide();
	})

	$('.main-nav-list>li>a').click(function() {
		//点击导航，更改颜色
		//将面临一个问题，a标签有链接，点击后回调到新页面，那么相当于刷新，样式回复初始值
		/*初步设想1、a不加链接，ajax请求，指刷新请求的内容
		2、a加链接，那么需要获取加载页的类别，根据此类别来设置导航的默认样式
		例如，点击音乐，页面跳转后把音乐的颜色设为蓝色*/
		changeColor($(this));
		// alert(1)
	});
	$('.main-nav-list-iphone>li>a').click(function() {
		//点击导航，更改颜色
		//将面临一个问题，a标签有链接，点击后回调到新页面，那么相当于刷新，样式回复初始值
		/*初步设想1、a不加链接，ajax请求，指刷新请求的内容
		2、a加链接，那么需要获取加载页的类别，根据此类别来设置导航的默认样式
		例如，点击音乐，页面跳转后把音乐的颜色设为蓝色*/
		changeColor($(this));
		// alert(1)
	});

	//鼠标在更多上时，显示下拉列表
	moreNav.hover(function() {
		moreList.slideDown();
		moreNavA.addClass('more-nav-a');
	}, function() {
		moreList.slideUp();
		moreNavA.removeClass('more-nav-a');
	});

	moreList.click(function() {
		changeColor(moreNavA);
	})

	// 点击的元素a添加样式，其他移除
	function changeColor(obj) {
		obj.addClass('navdefault-color').parent().siblings().children('a').removeClass('navdefault-color');
	}
	//search，查找内容
	$('.search-nav').click(function() {
		let _this = $(this);
		let classChange = _this.attr('class');
		let contentSearch = $('#content-search');
		if (classChange === 'fa fa-times') {
			contentSearch.fadeOut(500);
			_this.attr('class', 'fa fa-search');
		} else {
			_this.attr('class', 'fa fa-times');
			contentSearch.fadeIn(1000)
		}
	});
	// 小屏幕显示更多
	var ifTimeon = 0;
	var t;
	$('.small-more').click(function() {
		$('.small-nav-list').slideDown(1000);
		if (ifTimeon === 0) {
			t = setInterval(windowWidth, 0);
			ifTimeon = 1;
		}
	})
	$('.small-list-remove').click(function() {
			$('.small-nav-list').slideUp(1000);
			clearTimer();

		})
		//获取浏览器窗口宽度
	var windowWidth = function() {
		// t = setInterval(windowWidth, 5000);
		let windowWidth = $(window).width();
		// alert(windowWidth);
		let flag = $('.small-nav-list').css('display');
		// alert(flag);
		if ((windowWidth > 768) && (flag === 'block')) {
			$('.small-nav-list').slideUp(1000);
			clearTimer();
		}
	}

	//清除定时器
	function clearTimer() {
		if (ifTimeon === 1) {
			clearInterval(t);
			ifTimeon = 0;
		}
	}


	// windowWidth();
})