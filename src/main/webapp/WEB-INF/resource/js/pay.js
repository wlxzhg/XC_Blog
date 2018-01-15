$(function() {
	let weipay = $('#weipay'),
		baopay = $('#baopay'),
		support = $('#supportUs>div'),
		choiceChild = '#supportUs>div',
		articlewechat = $('.wechatpay'),
		articlealipay = $('.alipay'),
		changingPayMethod = $('.change-pay-method'),
		payShow = $('.pay-wrap'),
		supportAthor = $('.support-author'),
		supportWidth = supportAthor.width(),
		supportHeight = supportAthor.height(),
		articleSupportt = $('#article-support'),
		screen = $('#screen');
	//alert(supportHeight)

	color = '',
		constant = 1; //两个支付;

	//在文章中设置支付
	changingPayMethod.click(function() {
			// alert(payShow.length())
			payShow.each(function() {
				if ($(this).hasClass('pay-show')) {
					$(this).removeClass('pay-show');
				} else {
					$(this).addClass('pay-show');

				}
			})

		})
		//设置支付框的位置，悬浮在最顶层，位于浏览器中间
	function PayPosition() {
		let win = $(document),
			docHeight = document.documentElement.clientHeight,
			docWidth = document.documentElement.clientWidth,
			// windowHeight = win.height(),
			// windowWidth = win.width(),
			left_ = (docWidth - supportWidth) / 2,
			top_ = (docHeight - supportHeight) / 2,
			scrollTop = $(document).scrollTop(),
			scrollLeft = $(document).scrollLeft();
		supportAthor.css({
			'left': left_,
			'top': top_
		});
		//alert(docHeight + ':' + docWidth + ':' + supportWidth + ':' + left_)
	}
	$(window).resize(function() {
			PayPosition();

		})
		//点击赞赏，出现支付和遮罩
	articleSupportt.click(function() {
		supportAthor.removeClass('clicksupportshow');
		screen.css('display', 'block').click(function() {
			supportAthor.addClass('clicksupportshow');
			$(this).css('display', 'none');

		});
	})

	//低部支付
	support.hover(function() {
			$(this).next().next().css('display', 'block');
		}, function() {
			$(this).next().next().css('display', 'none');
		})
		//浏览器已加载就显示支付窗口位置
	PayPosition();


})