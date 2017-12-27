$(function() {
	//定义全局变量
	let musicSlide = {
		imgs: '#music-img>img',
		w: 0,
		index: 0,
		isAnimationSucceed: false, //图片是否加载了动画，若动画还没加载到图片上，左右点击会出现白底
		leftArrow: $('#left-slide'),
		rightArrow: $('#right-slide'), //判断哪个箭头显示，0左，1右
		initImgs: function() {
			let opacityArrow = parseInt(this.leftArrow.css('opacity')) || parseInt(this.rightArrow.css('opacity'));
			let index = this.index;
			if (!opacityArrow) { //判断箭头是否显示
				if (index < 0) {
					index = 0;
				}
				$(imgs + ':eq(' + index + ')').css('left', '0').fadeIn(1000).siblings().fadeOut(600);

				index++;
				isAnimationSucceed = true;
				// console.log(index);
				if (index === len)
					index = -1;
			}
		}
	}
})