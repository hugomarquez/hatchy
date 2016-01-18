var edit_contribution = (function(){
	// Cache DOM
	var $billing_row = $('#billing_data');
	var $payment_row = $('#payment_data');
	var $currentRow = $('.container .col-md-12 .row.hidden' + window.location.hash);

	// Bind Events
	// Functions
	function showHashLocation() {
		if(window.location.hash != ''){
			$billing_row.addClass('hidden');
			$currentRow.removeClass('hidden');
		}
  }

  showHashLocation();
	return{};
})();