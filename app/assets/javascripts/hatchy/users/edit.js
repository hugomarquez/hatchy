var edit = (function(){
	// Cache DOM
  var $defaultSection = $('#about_you_dashboard');
  var $defaultLink = $("#user_menu li a[href='#about_you']");
	var $rowSections = $('.container-fluid .hidden');
	var $currentRow = $('.container-fluid .hidden' + window.location.hash + '_dashboard');
	var $menuLinks = $('#user_menu li a');
  var $hashLink = $.grep( $( '#user_menu li a' ), function (o) {
    return o.hash == window.location.hash;
  });

	// Bind Events
	$menuLinks.on('click', toggleMenuActive);

	// Functions
	function showHashLocation() {
    if(window.location.hash == '') {
      $defaultSection.removeClass('hidden');
      $($defaultLink).parent().addClass('active');
    } else {
      $currentRow.removeClass('hidden');
      $($hashLink).parent().addClass('active'); 
    }
  }

  function toggleMenuActive() {
    $menuLinks.parent().removeClass('active');
    $rowSections.addClass('hidden');
    $(this).parent().addClass('active');
    $('.container-fluid' + this.hash + '_dashboard').removeClass('hidden');
  }

  showHashLocation();

	return{};
})();