var dashboard = (function(){
  // Cache DOM
  var $owl_your_projects = $('#owl-your-projects');
  var $owl_contributions = $('#owl-contributions')

  // Functions
  function projectsCarousel() {
    $owl_your_projects.owlCarousel({
      autoPlay: true,
      stopOnHover: true,
      items: 3
    });

    $owl_contributions.owlCarousel({
      autoPlay: true,
      stopOnHover: true,
      items: 3
    });
  }

  projectsCarousel();

  return {};
})();