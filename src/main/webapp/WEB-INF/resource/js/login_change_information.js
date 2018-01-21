$(function() {
	let topbarchangelogin = $('.no-login'),
		logout = $('.logout'),
		wrap_comment = $('.writecomment-wrap');
	// alert(window.loginSucceed)

	// window.timer = setInterval(function() {
	// 	if (window.loginSucceed) { //此法行不通，全局变量会重置

	// 		topbarchangelogin.hide().siblings().show();
	// 		// topbarchangelogin.addclass('user-afterlogin-hide').siblings().removeclass('user-afterlogin-hide');
	// 		//登录成功，用户可以填写评论
	// 		wrap_comment.removeclass('wrap_comment').previousSbiling().addclass('wrap_comment');
	// 	}
	// }, 1000);

	//注销后，恢复原貌
	// logout.click(function() {
	// 	// window.loginSucceed = false;
	// 	topbarchangelogin.removeclass('user-afterlogin-hide').siblings().addclass('user-afterlogin-hide');

	// 	//注销后用户不能填写评论
	// 	wrap_comment.addclass('wrap_comment').previousSbiling().removeclass('wrap_comment');

	// })
})