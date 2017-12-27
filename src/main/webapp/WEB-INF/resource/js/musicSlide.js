$(function() {
	// let imgs = $('#cont-bott-right>img');
	let imgs = '#music-img>img',
		len = $(imgs).length,
		t,
		w,
		index = 0,
		isAnimationSucceed = false, //图片是否加载了动画，若动画还没加载到图片上，左右点击会出现白底
		isArrowClick = false, //判断箭头是否点击
		left_ = $('#left-slide'),
		right_ = $('#right-slide'); //判断哪个箭头显示，0左，1右
	// alert(len)
	//循环展示，箭头不显示时，图片淡入淡出，否则按照箭头的指示显示图片
	t = setInterval(function() {
		var opacityArrow = parseInt(left_.css('opacity')) || parseInt(right_.css('opacity'));

		if (!opacityArrow) { //判断箭头是否显示
			if (index < 0) {
				index = 0;
			}

			if (isArrowClick) {
				isArrowClick = false; //判断箭头是否点击,false重置
				index--; //箭头点击后需要对index微小调整,否则动画切换衔接不平滑
			}
			$(imgs + ':eq(' + index + ')').css('left', '0').fadeIn(1000).siblings().fadeOut(600);

			index++;
			isAnimationSucceed = true;
			// console.log(index);
			if (index === len)
				index = -1;
		}
	}, 2000)

	//左箭头点击显示动画
	left_.click(function() {

		isExecuteClick(0);

		// arrowClick(0)
	});
	//右箭头点击显示动画
	right_.click(function() {
		// arrowClick(1);
		isExecuteClick(1);

	})

	function arrowClick(flag) {
		// console.log(1)
		w = $('#cont-bott-left').width();
		if (flag === 0) {
			w = -w;
			// console.log(w)
		};
		if (index === -1) {
			index = 0;
		};
		let preindex = (index - 1) == -1 ? 2 : (index - 1);
		$(imgs + ':eq(' + preindex + ')').animate({
			'left': w + 'px'
		}, 500);
		// 
		$(imgs + ':eq(' + index + ')').css({
			'left': -w + 'px',
			'display': 'block',
		}).animate({
			'left': '0'
		}, 500);
		index++;
		if (index > 2) {
			index = 0;
		}
	}
	// 是否执行箭头的点击事件，当图片上有动画队列时执行，否则不予理睬
	function isExecuteClick(flag) {
		if (isAnimationSucceed) {
			arrowClick(flag);

			if (!isArrowClick) {
				isArrowClick = true; //判断箭头是否点击

			}

		}
	}
})