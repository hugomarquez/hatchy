jQuery(function() {
  $(function() {
    var announcements, flash, i, obj, results, stack, theme;
    announcements = $('#announcements').data('announcements');
    flash = $('#flash');
    stack = {
      "dir1": "up",
      "dir2": "left",
      "firstpos1": 25,
      "firstpos2": 25
    };
    theme = 'brighttheme';
    PNotify.prototype.options.styling = "fontawesome";
    if (flash.length) {
      new PNotify({
        title: flash.data('type'),
        text: flash.data('message'),
        type: flash.data('type'),
        buttons: {
          closer: true,
          sticker: false,
          icon: "fa fa-times",
          show_on_nonblock: true
        },
        addclass: "stack-bottomright",
        stack: stack,
        styling: theme
      });
    }
    if (announcements !== null) {
      i = 0;
      results = [];
      while (i < announcements.length) {
        obj = announcements[i];
        new PNotify({
          title: "Announcement",
          text: obj.message,
          type: "notice",
          icon: "fa fa-info fa-lg",
          hide: false,
          styling: theme,
          addclass: "stack-bottomright",
          stack: stack,
          buttons: {
            closer: true,
            sticker: false,
            icon: "fa fa-times",
            show_on_nonblock: true
          },
          mobile: {
            swipe_dismiss: true
          },
          nonblock: {
            nonblock: true,
            nonblock_opacity: .2
          },
          before_close: function(notice) {
            return $.ajax({
              url: "announcements/" + obj.id + "/hide"
            });
          }
        });
        results.push(i++);
      }
      return results;
    }
  });
});