$(function() {

	rainbows.init({
		selector: '.back span.text',
		highlight: true,
		shadow: true,
		from: '#555555',
		to: '#000000'
	});

	$('.back').prepend('<span class="hover"><span class="arrow"></span></span>');

	$('h1 a,.back').hover(function() {
		// on hover
		$('.hover', this).stop().animate({
			'opacity': 1
		}, 700, 'easeOutQuart');
	}, function() { 
		// off hover
		$('.hover', this).stop().animate({
			'opacity': 0
		}, 800, 'easeOutSine');
	});

});
