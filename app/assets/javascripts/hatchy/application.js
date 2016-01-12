var application = (function(){
  // Cache DOM
  var $announcements = $('#announcements').data('announcements');
  var $flash = $('#flash');

  // Local Vars
  var theme = 'brighttheme';
  var stack = {
    "dir1": "up",
    "dir2": "left",
    "firstpos1": 25,
    "firstpos2": 25
  };

  // Functions
  function setPNotify() {
    PNotify.prototype.options.styling = "fontawesome";
  }

  function newNotification(dataObj, notificaitonType) {
    new PNotify({
      if(notificaitonType == 'flash') {
        title: dataObj.data('type'),
        text: dataObj.data('message'),
        type: dataObj.data('type'),
      }else if( notificaitonType == 'announcements') {
        title: "Announcement",
        text: dataObj.data('message'),
        type: "notice",
        icon: "fa fa-info fa-lg",
        hide: false,
        nonblock: {
          nonblock: true,
          nonblock_opacity: .2
        },
        before_close: function(notice) {
          return $.ajax({ url: "announcements/" + obj.id + "/hide"});
        }
      }
      addclass: "stack-bottomright",
      stack: stack,
      styling: theme,
      buttons: {
        closer: true,
        sticker: false,
        icon: "fa fa-times",
        show_on_nonblock: true
      },
    });
  }

  function checkFlashMsg() {
    if ($flash.length) {
      newNotification($flash, 'flash');
    }
  }

  function checkAnnouncements() {
    if ($announcements !== null) {
      i = 0;
      results = [];
      while (i < $announcements.length) {
        dataObj = announcements[i];
        newNotification(dataObj, 'announcements');
        results.push(i++);
      }
      return results;
    }
  }

  setPNotify();
  checkFlashMsg();
  checkAnnouncements();

  return {};

})();