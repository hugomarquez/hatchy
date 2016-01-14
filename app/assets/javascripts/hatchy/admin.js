//= require 'jquery'
//= require 'jquery_ujs'
//= require 'hatchy/bootstrap/bootstrap'
//= require 'hatchy/libraries/pnotify.custom.js'
//= require 'hatchy/application.js'
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap

var admin = (function(){
  // cache DOM
  var $ajax_data_table = $('.ajax-data-table');
  var $data_table = $('.data-table');

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

  setDataTable();
  setAjaxDataTable();

  return{};
})();