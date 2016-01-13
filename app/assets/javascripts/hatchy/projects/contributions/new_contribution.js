var new_contribution = (function(){
	// Cache DOM
	var $rewards_section = $('.reward-select');
	var $rewards_row = $('#reward_data');
	var $billing_row = $('#billing_data');
	var $payment_row = $('#payment_data');
	var $reward_continue = $('.reward_continue');
	var $billing_continue = $('#billing_continue');
	init();

	// Bind Events
	$rewards_section.on('click', selectReward);
	$reward_continue.on('click', renderBilling);
	$billing_continue.on('click', renderPayment);
	
	// Functions
	function selectReward(event){
		cleanSelection();
		//var $radio = $(this).children('h3').children('label').children('input[type=radio]').not(':checked');
		var $radio = $(this).find('.reward-headline h3 label input[type=radio]').not(':checked');
		$radio.prop('checked', true);
		$(this).addClass('selected');
		$(this).find('.reward-body.hidden').removeClass('hidden');

	}

	function cleanSelection(){
		$rewards_section.removeClass('selected');
		$('.reward-body').not('.hidden').addClass('hidden');
	}

	function renderBilling(event){
		$rewards_row.addClass('hidden');
		$billing_row.removeClass('hidden');
	}

	function renderPayment(event){
		$billing_row.addClass('hidden');
		$payment_row.removeClass('hidden');
	}

	function init(){
		$radio = $('input[type=radio]:checked');
		$reward_select = $radio.closest('.reward-select');
		$reward_body = $reward_select.children('.reward-body');
		$reward_select.addClass('selected');
		$reward_body.removeClass('hidden');
		if(window.location.hash != ''){
			$rewards_row.addClass('hidden');
			$(window.location.hash + '_data').removeClass('hidden');
		}else{
			$rewards_row.removeClass('hidden');
		}
	}

	return{};
})();