var home = (function(){
	// Cache DOM
	var $owl_projects = $('#owl-projects');

	// Functions
	function projectsCarousel() {
		$owl_projects.owlCarousel({
			autoPlay: true,
  		stopOnHover: true,
  		items: 3
		});
	}

	projectsCarousel();

	return {};
})();