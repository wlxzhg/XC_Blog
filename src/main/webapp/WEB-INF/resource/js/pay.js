$(function() {
	let weipay = $('#weipay'),
		baopay = $('#baopay'),
		support = $('#supportUs>div'),
		choiceChild = '#supportUs>div';
	color = '',
		constant = 1; //两个支付;
	// support.hover(function() {
	// 	for (i = constant; i > 0; i--) {
	// 		child = $(choiceChild + i + ')');
	// 		color = child.css('color');
	// 		console.log(color)
	// 		if (color === 'green') {
	// 			child.next().next().show();
	// 		}
	// 	}
	// })


	support.hover(function() {
		// body...
		$(this).next().next().css('display', 'block');
		// console.log(1)
	}, function() {
		// body...
		$(this).next().next().css('display', 'none');
	})

	// supportUs(baopay);
	// supportUs(weipay);

})