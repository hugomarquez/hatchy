var dashboard = (function(){
  // cache DOM
  var $page = $('.sidebar-page');
  var $sidebar = $('.sidebar-wrapper');
  var $toggle = $sidebar.find('.toggle-nav-collapse');
  var $progress = $('.animate-width-to');

  // bind events
  $toggle.on('click', toggleSidebar);
  $progress.each(animateWidth);

  // functions
  function toggleSidebar(e){
    $page.toggleClass("collapsed expanded");
    $toggle.find('i').toggleClass("fa-angle-right fa-angle-left");
  }

  function animateWidth(e){
    var $progress_length = $(this).data("animate-length");
    var $progress_width = $(this).data("animate-width-to");
    return $(this).animate({width: $progress_width}, $progress_length, 'easeOutQuad');
  }

  // public methods
  return{};
})();