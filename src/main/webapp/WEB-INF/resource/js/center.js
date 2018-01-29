$(function() {
	let transferimg = $('#transferimg'),

		transferimgWidth = transferimg.width(),
		transferimgHeight = transferimg.height(),
		supportAthor = $('.support-author'),
		supportWidth = supportAthor.width(),
		supportHeight = supportAthor.height();

	function PayPosition(obj, w, h) {
		let win = $(document),
			docHeight = document.documentElement.clientHeight,
			docWidth = document.documentElement.clientWidth,
			// windowHeight = win.height(),
			// windowWidth = win.width(),

			scrollTop = $(document).scrollTop(),
			scrollLeft = $(document).scrollLeft(),
			left_ = (docWidth - w) / 2 + scrollLeft,
			top_ = (docHeight - h) / 2 + scrollTop;
		obj.css({
			'left': left_,
			'top': top_
		});
		//alert(docHeight + ':' + docWidth + ':' + supportWidth + ':' + left_)
	}

	function center() {
		//设置上传图片的悬浮框，位于浏览器中央
		PayPosition(transferimg, transferimgWidth, transferimgHeight);
		//设置支付框的位置，悬浮在最顶层，位于浏览器中间
		PayPosition(supportAthor, supportWidth, supportHeight);
	}
	$(window).resize(function() {
		center();

	});
	$(window).scroll(function() {
		center();

	})
	center();


})