var show = (function(){
	// Cache DOM
	var $time = $('#clock');
	var $description = $('#description-view');
	var $descriptionLink = $("#project-show li a[href='#description']" );
	var $budget = $('#budget-view');
	var $post = $('#posts-view');
	var $currentSection = $(window.location.hash + '-view');
	var $ulMenu = $('#project-show li a');
	var $hashLink = $.grep( $( '#project-show li a' ), function (o) {
    return o.hash === window.location.hash;
  });

	// Bind Events
	$ulMenu.on('click', toggleMenu);

	// Functions
	function showCurrentSection() {
		if (window.location.hash == '') {
			$description.removeClass('hidden');
			$($descriptionLink).parent().addClass('active');
		}else{
			$description.addClass('hidden');
			$currentSection.removeClass('hidden');
			$($hashLink).parent().addClass('active');
		}
	}

	function toggleMenu() {
		$ulMenu.parent().removeClass('active');
		$description.addClass('hidden');
		$post.addClass('hidden');
		$budget.addClass('hidden');
		$(this).parent().addClass('active');
		$(this.hash + '-view').removeClass('hidden');
	}

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
	showCurrentSection();
	return{
		currentSection : $currentSection,
		descriptionLink : $descriptionLink
	};

})();