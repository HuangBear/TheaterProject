$(function() {

	$("#sortable").sortable();
	$("#sortable").disableSelection();

	var toggleMenu = function() {
		$('aside').toggleClass('toggle');
		$('.main').toggleClass('push');
		$('.overlay').toggleClass('block');
		$('#social, .logo').toggleClass('reveal');
	};

	// Nav
	$('.navBtn').click(function() {
		toggleMenu();
	});

	$(document).keyup(function(e) {
		if (e.keyCode == 27) { // escape key maps to keycode `27`
			// <DO YOUR WORK HERE>
			toggleMenu();
		}
	});

	// close
	$('.close').click(function() {
		$(this).parents('li').remove();
	});
});