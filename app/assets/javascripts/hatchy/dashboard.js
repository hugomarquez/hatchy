var dashboard = (function(){
  // Cache DOM
  var $owl_your_projects = $('#owl-your-projects');
  var $owl_projects_you_support = $('#owl-projects-you-support')

  // Functions
  function projectsCarousel() {
    $owl_your_projects.owlCarousel({
      autoPlay: true,
      stopOnHover: true,
      items: 3
    });

    $owl_projects_you_support.owlCarousel({
      autoPlay: true,
      stopOnHover: true,
      items: 3
    });
  }

  projectsCarousel();

  return {};
})();