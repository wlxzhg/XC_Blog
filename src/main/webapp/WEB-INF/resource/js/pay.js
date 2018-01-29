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

})