//= require 'jquery'
//= require 'jquery_ujs'
//= require 'hatchy/bootstrap/bootstrap'
//= require 'hatchy/libraries/pnotify.custom.js'
//= require 'hatchy/application.js'
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require best_in_place

var admin = (function(){
  // cache DOM
  var $ajax_data_table = $('.ajax-data-table');
  var $data_table = $('.data-table');
  var $bestInPlace = $('.best_in_place');

  // functions
  function setAjaxDataTable(){
    $ajax_data_table.dataTable({
      pagingType: "full_numbers",
      jQueryUI: true,
      processing: true,
      serverSide: true,
      ajax: $ajax_data_table.data('source'),
    });
  }

  function setDataTable(){
    $data_table.dataTable({
      sPaginationType: "full_numbers",
      bJQueryUI: true,
    });
  }

  function setBestInPlace(){
    $bestInPlace.best_in_place();
  }

  setDataTable();
  setAjaxDataTable();
  setBestInPlace();

  return{};
})();