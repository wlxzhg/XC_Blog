$(function() {
	let articles = $('.left-content-list');
	articles.click(function() {
		let id = $(this).find('input').val();
		// alert(id)
		//window.location.href = "/article/" + id;//跳转页面，不打开新的窗口
		window.open("/article/" + id); //跳转页面，打开新的窗口

		window.history.back(-1); //返回上一页
	})
})