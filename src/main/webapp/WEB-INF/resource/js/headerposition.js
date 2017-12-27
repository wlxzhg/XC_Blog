$(function() {

	let header = $('#header'),
		headerTopBar = $('#header-topbar'),
		backToTop = $('#back-to-top'),
		content = $('#content');
	//滚动条滚动，页面当方出去1/4时，header消失，由于header是粘性布局，设置top，相当于消失，此时显示返顶部的模块
	$(document).scroll(function() {
		// console.log(1)
		let h = document.body.scrollHeight, //页面高度
			// w = document.body.scrollWidth,
			// bodyh = document.body.offsetHeight, //页面可见高度，包括边框
			scrollh = document.documentElement.scrollTop || document.body.scrollTop, //卷出去的高度
			headerh = header.height();
		// contentWidth = content.width(),
		// backtopleft = contentWidth > 1000 ? (contentWidth + w) / 2 : contentWidth - 100, //回到顶部模块的位置
		// backtoptop = bodyh * 0.75;
		// console.log(contentWidth)
		if (scrollh >= (h / 4)) {
			header.css('top', -headerh);
			// backToTop.css({
			// 	'display': 'block',
			// 	'left': backtopleft,
			// 	'top': backtoptop
			// });
		} else {
			// backToTop.css('display', 'none');

			if (headerTopBar.css('display') === 'block') {
				header.css('top', '-30px');

			} else {
				header.css('top', '0');
			}

		}
	})

})