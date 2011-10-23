;
(function($) {
    $.fn.center = function() {
        this.css("position", "absolute");
        this.css("top", (($(window).height() - this.outerHeight()) / 2) + $(window).scrollTop() + "px");
        this.css("left", (($(window).width() - this.outerWidth()) / 2) + $(window).scrollLeft() + "px");
        return this;
    };

    $.fn.getClass = function() {
        return this.attr('class').split(/\s+/);
    };

    $.fn.readText = function(title, prompt, callback) {
        var b = callback;
        if (!document.getElementById('__dlg')) {
            $("body").append("<div id='__dlg' style='border: 1px #8b4513 solid; margin: 10px; padding: 20px; background: #f5f5dc'>" +
                "<div id='__dlg-title'></div><div id='__dlg-content'></div><div id='__dlg-btn'><a href='#' id='__dlg-ok'>OK</a></div></div>");
        }
        if ($.fn.dialog) {
            $("#__dlg").dialog({modal:true});
        }

        $("#__dlg-ok").unbind('click');
        $("#__dlg-ok").click(function() {
            if (this.id == '__dlg-ok') {
                b($("#__dlg-input").val());
            }
            $("#__dlg").hide();
        });
        $("#__dlg-title").html(title);
        $("#__dlg-content").html(prompt + ": <input id='__dlg-input'>");
        $("#__dlg").center().show();
    }
})(jQuery);