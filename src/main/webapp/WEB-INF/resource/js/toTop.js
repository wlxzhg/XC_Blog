$(function() {
	let backTop = $('#back-to-top'),
		docEle = document.documentElement, //.documentElement.scrollTop|| document.body.scrollTop;
		docBody = document.body;
	//点击返回顶部
	backTop.click(function() {
		// console.log(1)
		if (docEle.scrollTop) {
			docEle.scrollTop = 0;
			docEle.scrollLeft = 0;

		} else {
			docBody.scrollTop = 0; //ie
			docBody.scrollLeft = 0;

		}
	})

})