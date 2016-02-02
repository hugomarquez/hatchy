var edit = (function(){
  // Cache DOM
  // Bind Events

  // Functions
  function initSummerNote() {
    var summerNote;
    summerNote = $('.summernote');
    return summerNote.summernote({ height: 300 });
  }

  initSummerNote();
  return {};
})();