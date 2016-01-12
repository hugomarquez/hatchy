var home = (function(){
	// Cache DOM
	var $owl-projects = $('#owl-projects');

	// Functions
	function projectsCarousel() {
		$owl-projects.owlCarousel({
			autoPlay: true,
  		stopOnHover: true,
  		items: 3
		});
	}

	projectsCarousel();

	return {};
})();