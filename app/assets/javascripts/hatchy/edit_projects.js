var edit_projects = (function(){
  // Cache DOM
  var $rowSections = $('.container-fluid .hidden');
  var $currentRow = $('.container-fluid .hidden' + window.location.hash + '_dashboard');
  var $toggleNav = $('.toggle-nav-collapse'); 
  var $sidebarPage = $('.sidebar-page'); 
  var $menuLinks = $('#project_menu li a');
  var $rewardForm = $('form');
  var $hashLink = $.grep( $( '#project_menu li a' ), function (o) {
    return o.hash === window.location.hash;
  });

  // Bind Events
  $toggleNav.on('click', toggleNavCss);
  $menuLinks.not('.toggle-nav-collapse').on('click', toggleMenuActive);
  $rewardForm.on('click', '.add_fields', addFields);
  $rewardForm.on('click', '.remove_fields', removeFields);
  
  // Functions
  function showHashLocation() {
    $currentRow.removeClass('hidden');
    $($hashLink).parent().addClass('active');
  }

  function toggleNavCss() {
    $sidebarPage.toggleClass("collapsed expanded");
    $('.toggle-nav-collapse i').toggleClass("fa-angle-right fa-angle-left");
  }

  function toggleMenuActive() {
    $menuLinks.parent().removeClass('active');
    $rowSections.addClass('hidden');
    $(this).parent().addClass('active');
    $('.container-fluid' + this.hash + '_dashboard').removeClass('hidden');
  }

  function addFields() {
    var time = new Date().getTime();
    var regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
  }

  function removeFields() {
    if(confirm("Are You Sure?")){
      $(this).prev('input[type=hidden]').val('1');
      $(this).closest('fieldset').hide();
    }
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