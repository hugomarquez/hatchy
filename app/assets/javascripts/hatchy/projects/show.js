var show = (function(){
	// Cache DOM
	var $time = $('#clock');

	// Bind Events

	// Functions
	function setClock() {
		$time.countdown($time.data('time'))
		.on('update.countdown', function (e) {
			var format = '%H:%M:%S';
			if(e.offset.days > 0) {
				format = '%-d day%!d ' + format;
			}
			if(e.offset.weeks > 0) {
				format = '%-w week%!w ' + format;
			}
			$(this).html(e.strftime(format));
		})
		.on('finish.countdown', function(e) {
			$(this).html('This offer has expired!')
				.parent().addClass('disabled');
			});
	}

	setClock();
	return{};
})();