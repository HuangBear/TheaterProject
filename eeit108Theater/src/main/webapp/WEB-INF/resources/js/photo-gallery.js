$(function() {

	$('.photo-gallery ul li').click(function() {
		var src = $(this).data('src');
		var $gallery = $(this).closest('.photo-gallery');
		$gallery.find('.current-photo img').attr('src', src);
	});

	$('.photo-gallery').each(function() {
		$(this).find('li')[0].click();
	});

});