var edit = (function(){
	// Cache DOM
	var $time = $('#counter');

	// Bind Events

	// Functions
	function setClock() {
		$time.countdown($time.data('time'), function (e){
			$(this).text(e.strftime('%D days %H:%M:%S'));
		});
	}

	setClock();
	return{};
})();