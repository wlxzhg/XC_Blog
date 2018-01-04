$(function() {
	let articles = $('.left-content-list');
	articles.click(function() {
		let id = $(this).find('input').val();
		// alert(id)
		window.location.href = "/article/" + id;
	})
})