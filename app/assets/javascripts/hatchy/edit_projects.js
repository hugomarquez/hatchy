var edit_projects = (function(){
	// Cache DOM
	var $rowSections = $('.container-fluid .hidden');
	var $currentRow = $('.container-fluid .hidden' + window.location.hash + '_dashboard');
	var $hashLink = $.grep( $( '#project_menu li a' ), function (o) {
    return o.hash === window.location.hash;
  });
	
	// Functions
	function showHashLocation() {
		$currentRow.removeClass('hidden');
		$hashLink.parent().addClass('active');
	}

	function initSummerNote() {
		var summerNote;
		summerNote = $('.summernote');
		return summerNote.summernote({ height: 300 });
	}

	showHashLocation();
	initSummerNote();
	return {};
})();