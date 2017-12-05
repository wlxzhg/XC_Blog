$(function() {

	$('#main-nav').hover(function() {
		$('#main-nav-list li').hover(function() {
			var targetLeft = $(this).position().left;
			// alert(targetLeft)
			$('#main-nav-bg').animate({
				left: targetLeft
			}, 0);
			$('#main-nav-list-white').animate({
				left: -targetLeft
			}, 100);
			// alert(1)
		}, function() {})
	}, function() {
		$('#main-nav-bg').animate({
			left: 0
		}, 0);
		$('#main-nav-list-white').animate({
			left: 0
		}, 0);
	})

})