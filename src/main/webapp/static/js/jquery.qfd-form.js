/*
 @name: jQuery Plugin Template for Coding
 */
;
(function($) {//[--jQuery Plugin Container

//declare the plugin's version ; use to check the plugin exists
    $.qform = $.qform || {version:'0.1.0'};

//[--Plugin Define
    var qform = function(node, opts) {
        var me = this,$me = $(this);
        var $mine = $(node); //get the plugin's Operation jQuery DOM Element

        //Public Methods
        $.extend(me, {
            show: function() {
                $mine.unbind("click");
                $mine.click(function() {
                    $(".input-menu").remove();
                });
                __init();
                return me;
            },

            input: function() {
//                me.show();
                me.showInline();
                return me;
            },

            showInline: function() {
                var tmp = [];
                $.each(opts.editors, function(i, a) {
                    tmp[a.rowId + '_' + a.colId] = a;
                });

                $mine.find("td").each(function(i, a) {
                    var $a = $(a);
                    var row = $a.attr("row");
                    var col = $a.attr("col");
                    var formula = $a.attr("col-ref");
                    if (formula == 'null' || formula == '') {
                        formula = $a.attr("row-ref");
                    }
                    if ($a.hasClass('type-r-0') && $a.hasClass('type-c-0') && (formula == null ||
                        formula == 'null'
                        || formula == '')) {
                        $a.html('');
                        if (row && col) {
//                            var e = tmp[row + '_' + col];
//                            if (e) {
                            /*
                             $a.attr("class", '');
                             $a.addClass('editor_' + e.type);
                             */
                            $("<div class='inline' style='display:block'>&nbsp;</div>").appendTo($a);
//                            }
                        }
                    }
                });

                $.get(opts.load_data_api, {formId:opts.formId, projectId:opts.projectId}, function(data) {
                    __show_value(data);
                });
            },

            hide: function() {
                return me;
            },
            options: function() {
                //return the preset options to users code
                //let users can be change options by later code
                return opts;
            },
            setFormId: function(formId) {
                opts.formId = formId;
                return me;
            },

            showEditors: function() {
                var tmp = [];
                $.each(opts.editors, function(i, a) {
                    tmp[a.rowId + '_' + a.colId] = a;
                });

                $mine.find("td").each(function(i, a) {
                    var row = $(a).attr("row");
                    var col = $(a).attr("col");
                    if (row && col) {
                        var e = tmp[row + '_' + col];
                        if (e) {
                            $(a).attr("class", '');
                            $(a).addClass('editor_' + e.type);
                        }
                    }
                });
            },

            close: function() {
                opts.designer = 0;
            },

            design: function() {
                if (!opts.designer) {
                    me.addToolbar();
                    /*
                     $mine.delegate("td", "click", function() {
                     $(this).toggleClass("hilight");
                     });

                     $mine.delegate("th", "click", function() {
                     //                                $(this).toggleClass("hilight");
                     });
                     */
                    opts.designer = 1;
//                    $mine.find("th, td").css("cursor", "pointer");
                }
                me.showEditors();
            },

            addToolbar: function() {
                __printToolbar();
            },

            addRows: function(count) {
                if (count) {
                    $.post(opts.add_rows_api, {formId: opts.formId, count:count}).done(
                        function(data) {
                            if (opts.rows) {
                                $.each(data, function(i, a) {
                                    opts.rows.push(a);
                                    __printRow(a);
                                });
                            }
                        });
                }
            },

            addCols: function(count) {
                if (count) {
                    $.post(opts.add_cols_api, {formId: opts.formId, count:count}).done(
                        function(data) {
                            if (opts.cols) {
                                $.each(data, function(i, a) {
                                    opts.cols.push(a);
                                    __printCol(a);
                                });
                            }
                        });
                }
            },

            addRow: function(name) {
                if (name) {
                    $.post(opts.add_row_api, {formId: opts.formId, title:name}).done(
                        function(data) {
                            if (opts.rows) {
                                opts.rows.push(data);
                                __printRow(data);
                            }
                        }
                    );
                }
            },

            addCol: function(name) {
                if (name) {
                    $.post(opts.add_col_api, {formId: opts.formId, title:name}).done(
                        function(data) {
                            if (opts.cols) {
                                opts.cols.push(data);
                                __printCol(data);
                            }
                        }
                    );
                }
            }
        });

        function __show_value(data) {
            $.each(data, function(i, a) {
                var rid = a.rowId;
                var cid = a.colId;
                var $td = $("td[row='" + rid + "'][col='" + cid + "']");
                if ($td.hasClass('matrix')) {
                    $td.find(".inline").attr("class", "inline matrix-input matrix-input-" + a.data);
                } else {
                    var div = $td.find(".inline");
                    if (div.length) {
                        div.html(a.data);
                    } else {
                        $td.html(a.data);
                    }
                }
            });
        }

        function __printCol(col, t) {
            var tbl = $mine.find(".form-table");
            var clz = t ? t == 2 ? ' self' : ' form-left' : ' matrix';

            $.each(tbl.find("tr"), function(i, a) {
                if (i == 0) {
                    $("<th col-ref='" + col.ref + "' id='col_" + col.rowId + "' class='col level-c-"
                        + col.level + clz + "' type='" + col.type + "'><div><div class='rotate'>" + col.title + "</div></div></th>").appendTo(a);
                } else if (i == 1) {
                    $("<th>" + opts.cols.length + "</th>").appendTo(a);
                } else {
                    var rid = opts.rows[i - 2];
                    $("<td col-ref='" + col.ref + "' class='cell type-c-" + col.type + " type-r-" + rid.type + clz + "' row='" + rid.rowId
                        + "' col='" + col.rowId + "'>&nbsp;</td>").appendTo(a);
                }
            });
        }

        function __getSelection() {
            var tds = [];
            $mine.find("td.hilight").each(function(i, td) {
                tds.push($(td).attr("row") + '_' + $(td).attr('col'));
            });
            return tds;
        }

        function __readText(title, prompt, callback) {
            if (!document.getElementById("_input_dlg_")) {
                $("body").append("<div id='_input_dlg_' style='width:300px;height:200px; padding: 40px 20px 10px 40px;'><div class='content'></div></div>");
            }


            var $dlg = $("#_input_dlg_");
            $dlg.find(".content").html(prompt + ": <input type='text'>");
            $dlg.dialog({
                modal: true,
                title: title,
                resizable: true,
                buttons: [
                    {text:'确认', iconCls:'icon-ok', id:'btn-ok'}
                ]
            });
            $dlg.find('input').focus();
            $("#btn-ok").click(function() {
                var val = $dlg.find('input').val();
                callback(val);
                $dlg.dialog("close");
            });
        }

        function __printToolbar() {
            var tb = $mine.find("div.qfd-toolbar");
            if (!tb.length) {
                var toolbar = {
                    'add-col': function() {
                        __readText('添加列', '输入列数', me.addCols);
                    },
                    'add-row': function() {
                        __readText('添加行', '输入行数', me.addRows);
                    }//,
                    /*
                     'editor-1': function() {
                     opts.setEditor('1', __getSelection());
                     },

                     'editor-2': function() {
                     opts.setEditor('2', __getSelection());
                     },
                     'editor-3': function() {
                     opts.setEditor('3', __getSelection());
                     },
                     'editor-0': function() {
                     opts.setEditor('0', __getSelection());
                     }
                     */
                };
                var html = "<div class='qfd-toolbar'><a href='#' class='add-col'>增加列</a> " +
                    "<a href='#' class='add-row'>增加行</a> " +
                    /*
                     "| " +
                     "<a href='#' class='editor-1'>填写</a> " +
                     "<a href='#' class='editor-2'>选择</a> " +
                     "<a href='#' class='editor-3'>常数</a> " +
                     "<a href='#' class='editor-0'>无</a>" +
                     */
                    "</div>";
                $(html).prependTo(node);
                // setup functions
                $mine.delegate(".qfd-toolbar a", "click", function() {
                    toolbar[$(this).attr("class")].apply(this);
                    return false;
                });
            }
        }

        function __printRow(row, idx, t) {
            var tbl = $mine.find(".form-table");
            if (idx == undefined) {
                idx = tbl.find('tr').length - 2;
            }
            var clz = t ? t == 2 ? ' self' : ' form-top' : ' matrix';
            var line = $("<tr></tr>");
            $("<th class='row level-r-" + row.level + clz + "' id='row_" + row.rowId + "' type='"
                + row.type + "'>" + row.title + "</th>").appendTo(line);
            $("<th class='rownum'>" + (idx + 1) + "</th>").appendTo(line);
            tbl.find('th.col').each(function(i, col) {
                var colId = col.id.substr(4); //col_
                var $col = $(col);
                if ($col.hasClass('self')) {
                    clz = ' self';
                }
                if (!t || (t == 1 && $col.hasClass("matrix")) || (t == 2 && ($col.hasClass("self") || $col.hasClass("matrix")))) {
//                    if(t == 1 && !$(col).hasClass('matrix')) return;
                    if ($col.hasClass("form-left") && t != 2) clz = ' form-left';
//                    $("<td class='" + clz + "' row='" + row.rowId + "' col='" + colId + "'>&nbsp;</td>").appendTo(line);
                    $("<td by='row' col-ref='" + $col.attr('col-ref') + "' row-ref='" + row.ref + "' class='cell type-r-" + row.type
                        + " type-c-" + $col.attr("type") + clz
                        + "' row='" + row.rowId + "' col='"
                        + colId + "'>&nbsp;</td>").appendTo(line);
                } else {
                }
            });
            /*
             $.each(opts.cols, function(i, col) {
             $("<td class='cell type-r-" + row.type + " type-c-" + col.type + clz + "' row='" + row.rowId + "' col='" + col.rowId + "'>&nbsp;</td>").appendTo(line);
             });
             */

            line.appendTo(tbl);
        }

        function __save_val(elem) {
            var $elem = $(elem);
            var v = ($elem.find(".input").val());
            var td = $elem.parent();
            var rid = td.attr("row"),  cid = td.attr("col");
            $.post(opts.save_data_api,
                {projectId:opts.projectId, formId: opts.formId, rowId:rid, colId:cid, data:v}, __show_value);
//            if (v == '') v = '&nbsp;';
            $elem.html(v);
        }

        function __show_editor(elem, e) {
            var $elem = $(elem);
            var val = $elem.html();
            if ($elem.find('.input').get(0)) return;
            if ($elem.parent().hasClass('matrix')) {
                var $e = $("<div class='input-menu'><div class='matrix-input matrix-input-1' val='1'></div>" +
                    "<div class='matrix-input matrix-input-2' val='2'></div><div class='matrix-input matrix-input-3' val='3'>" +
                    "</div><div class='matrix-input matrix-input-4' val='4'></div><div class='matrix-input matrix-input-5' val='5'>" +
                    "</div><div class='matrix-input matrix-input-6' val='6'></div><div class='matrix-input matrix-input-7' val='7'>" +
                    "</div><div class='matrix-input matrix-input-8' val='8'></div><div class='matrix-input matrix-input-9' val='9'>" +
                    "</div></div>");
                $e.css({position:'absolute', "z-order":"100", "left": e.clientX, "top":e.clientY});
                $e.appendTo("body");
                $e.delegate(".matrix-input", "click", function() {
                    var v = $(this).attr("val");
                    $elem.attr("class", "inline matrix-input matrix-input-" + v);
                    var me = $elem.parent();
                    $(".input-menu").remove();
                    $.post(opts.save_data_api,
                        {projectId:opts.projectId, formId: opts.formId,
                            rowId: $(me).attr("row"),
                            colId:$(me).attr("col"),
                            data:v});
                });
                return;
            }
            if (val == '&nbsp;') val = '';
            if ($elem.parent().hasClass('cell')) {
                if (opts.form.formType && !$elem.parent().hasClass('self')) return;      // matrix不能修改原表的内容
                $elem.html('');
                $('<input class="input" style="border: 0">').width($elem.width()).keydown(
                    function(event) {
                        if (event.keyCode == 13) {
                            __save_val(elem);
                        }
                    }).blur(
                    function() {
                        __save_val(elem);
                    }).val(val).appendTo($elem).focus();
            }
            /*if ($elem.find("input").length || $elem.find("select").length) return;
             var type = $elem.attr("type");
             var param = $elem.attr("param");
             var val = $elem.html();
             if ("&nbsp;" == val) val = '';
             switch (type) {
             case '1':
             $elem.html("");
             $('<input class="input" style="border: 0">').width($elem.width()).keydown(
             function(event) {
             if (event.keyCode == 13) {
             __save_val(elem);
             }
             }).blur(
             function() {
             __save_val(elem);
             }).val(val).appendTo($elem).focus();
             break;
             case '2':
             break;
             }*/
        }

        function __printColNum() {
            var tbl = $mine.find(".form-table");
            var line = $("<tr class='rownum'></tr>");
            $("<th class='empty' id='th-first'>&nbsp;</th>").appendTo(line);
            $("<th class='empty' id='th-second'>&nbsp;</th>").appendTo(line);
            if (opts.form.formType) {
                $.each(opts.topRows, function(i, col) {
                    $("<th col='" + col.rowId + "'>" + (i + 1) + "</th>").appendTo(line);
                });
            }
            $.each(opts.cols, function(i, col) {
                $("<th col='" + col.rowId + "'>" + (i + 1) + "</th>").appendTo(line);
            });
            if (opts.form.formType) {
                $.each(opts.leftCols, function(i, col) {
                    $("<th col='" + col.rowId + "'>" + (i + 1) + "</th>").appendTo(line);
                });
            }
            line.appendTo(tbl);
        }

        function __init_inline() {
            $mine.undelegate(".inline", "click");
            $mine.delegate(".inline", "click", function(e) {
                __show_editor(this, e);
            });
        }

        function __init_rel_menu() {
            $mine.undelegate(".rel-item", "click");
            $mine.delegate(".rel-item", "click", function(e) {
                $(".rel-menu").remove();
                if ($(this).hasClass("rel-val-na")) return;
                var me = this;
                var menu = $('<div class="rel-menu input-menu" style="width:22px;height:65px">' +
                    '<div class="top-menu-items" val="-1"></div>' +
                    '<div class="top-menu-items" val="0"></div>' +
                    '<div class="top-menu-items" val="1"></div></div>');
                menu.appendTo("body");
                menu.css({"position":"absolute", "z-order":"100", "left": e.clientX, "top":e.clientY});
                menu.delegate(".top-menu-items", "click", function() {
                    var v = $(this).attr("val");
                    $(me).attr("class", "rotated rel-item rel-val-" + v);
                    $(".rel-menu").remove();
                    $.post(opts.save_data_api,
                        {projectId:opts.projectId, formId: opts.formId, rowId: $(me).attr("row"), colId:$(me).attr("col"), data:v});
                });
            });
        }

        function __init() {
            __init_inline();
            __init_rel_menu();

            $mine.html('');
            $mine.css('position', 'relative');
            var container = $("<div class='qfd-form'>" +
                "<table class='form-table'>" +
                "<tr>" +
                "<th class='empty' id='th-first'>&nbsp;</th>" +
                "<th class='empty' id='th-second'>&nbsp;</th>" +
                "</tr>" +
                "</table>" +
                "</div>");
            container.appendTo(node);
            var matrix = opts.form.formType;
            if (matrix) {
                $.each(opts.topRows, function(i, a) {
                    __printCol(a);
                });
            }
            $.each(opts.cols, function(i, a) {
                __printCol(a, 2);
            });
            if (matrix) {
                $.each(opts.leftCols, function(i, a) {
                    __printCol(a, 1);
                });
            }
            __printColNum();
            if (matrix) {
                $.each(opts.leftRows, function(i, a) {
                    __printRow(a, i);
                });
            }
            $.each(opts.rows, function(i, a) {
                __printRow(a, i, 2);
            });

            if (matrix) {
                $.each(opts.topCols, function(i, a) {
                    __printRow(a, i, 1);
                });

                if (opts.matrix.hasRoof) {
                    __setTopMargin(container);
                }

                if (opts.matrix.hasLeft) {
                    __setLeftMargin(container);
                }

                if (opts.matrix.hasRoof) {
                    __printRoof();
                }

                if (opts.matrix.hasLeft) {
                    __printLeft();
                }

                __load_rel_val();
            }
        }

        function __load_rel_val() {
            $.get(opts.load_data_api, {formId:opts.formId, projectId:opts.projectId}, function(data) {
                $.each(data, function(i, a) {
                    var rid = a.rowId;
                    var cid = a.colId;
                    $("div[row='" + rid + "'][col='" + cid + "']")
                        .removeClass("rel-val-0")
                        .addClass("rel-val-" + a.data);
                });
            });
        }

        function __setTopMargin(container) {
            var $colTh = $("th.matrix:not(.row)");
            var size = $colTh.length;
            var pw = $colTh.outerWidth();
            var $first = $($colTh[0]);
            var $last = $($colTh[size - 1]);
            var width = $last.position().left - $first.position().left + pw;
            container.css("margin-top", width / 2 + 20 + "px");
        }

        function __setLeftMargin(container) {
            var $rowTh = $("th.matrix:not(.col)");
            var size = $rowTh.length;
            var pw = $rowTh.outerHeight();
            var width = $($rowTh[size - 1]).position().top - $($rowTh[0]).position().top + pw;
            container.css("margin-left", width / 2 + 20 + "px");
        }

        function __printRoof() {
            var $colTh = $("th.matrix:not(.row)");
            var size = $colTh.length;
            var pw = $colTh.outerWidth();
            var form = $mine.find('.qfd-form');
            var $first = $($colTh[0]);
            var $last = $($colTh[size - 1]);
            var $d = $("<div class='rotated outer'></div>").appendTo(form);
            var width = $last.position().left - $first.position().left + pw;
            var w,h,thme, ow;
            w = h = Math.sqrt((width * width) / 2);
            var od = pw, delta = (width - w) / 2 + 1;
            ow = Math.sqrt((od * od) / 2);

            $d.width(w).height(h).css({top:'-' + (h / 2 + 1) + 'px',
                left:($first.position().left + delta) + 'px'});

            for (var i = 1; i < size; i++) {
                thme = $($colTh[i]);
                $d = $("<div class='rotated left'></div>").appendTo(form);
                width = $last.position().left - thme.position().left + pw;
                w = Math.sqrt((width * width) / 2);
                h = w;
                delta = (width - w) / 2 + 1;
                $d.width(w).height(h).css({top:'-' + (h / 2 + 1) + 'px',
                    left:(thme.position().left + delta) + 'px'});
            }

            for (i = 0; i < size - 1; i++) {
                thme = $($colTh[i]);

                $d = $("<div class='rotated top'></div>").appendTo(form);
                width = thme.position().left - $first.position().left + pw;
                w = Math.sqrt((width * width) / 2);
                h = w;
                delta = (width - w) / 2 + 1;

                $d.width(w).height(h).css({top:'-' + (h / 2 + 1) + 'px',
                    left:($first.position().left + delta) + 'px'});
            }

            for (i = 0; i < size; i++) {
                for (var j = i + 1; j < size; j++) {
                    thme = $($colTh[j - i - 1]);
                    var r2 = $($colTh[j]);
                    var clz = "rel-val-0";
                    if (thme.attr("type") == '1' || r2.attr("type") == '1') {
                        clz = "rel-val-na";
                    }

                    $d = $("<div class='rotated rel-item " + clz + "' row='" + thme.attr("id").substr(4) + "' col='" + r2.attr("id").substr(4) + "'>" +
                        "</div>").appendTo(form);
                    $d.width(ow).height(ow).css({top:'-' + ((i + 1) * od / 2 + 11) + 'px',
                        left:($first.position().left + (j) * od - 11 - (i * od / 2)) + 'px'});
                }
            }
        }

        function __printLeft() {
            var $rowTh = $("th.matrix:not(.col)");
            var $first = $($rowTh[0]);
            var lp = $first.position().left + 1;
            var size = $rowTh.length;
            var pw = $rowTh.outerHeight();
            var form = $mine.find('.qfd-form');
            var $d = $("<div class='rotated2 outer'></div>").appendTo(form);
            var width = $($rowTh[size - 1]).position().top - $first.position().top + pw;
            var w,h;
            w = h = Math.sqrt((width * width) / 2);
            var delta = (width - w) / 2 + 1;
            $d.width(w).height(h).css({left:lp - (h / 2 + 1) + 'px',
                top:($first.position().top + delta) + 'px'});
            var od = pw;
            var ow = Math.sqrt((od * od) / 2);

            for (var i = 1; i < size; i++) {
                $d = $("<div class='rotated2 left2'></div>").appendTo(form);
                width = $($rowTh[size - 1]).position().top - $($rowTh[i]).position().top + pw;
                w = Math.sqrt((width * width) / 2);
                h = w;
                delta = (width - w) / 2 + 1;
                $d.width(w).height(h).css({left:lp - (h / 2 + 1) + 'px',
                    top:($($rowTh[i]).position().top + delta) + 'px'});
            }

            for (i = 0; i < size - 1; i++) {
                $d = $("<div class='rotated2 top2'></div>").appendTo(form);
                width = $($rowTh[i]).position().top - $first.position().top + pw;
                w = Math.sqrt((width * width) / 2);
                h = w;
                delta = (width - w) / 2 + 1;

                $d.width(w).height(h).css({left:lp - (h / 2 + 1) + 'px',
                    top:($first.position().top + delta) + 'px'});
            }

            for (i = 0; i < size; i++) {
                for (var j = i + 1; j < size; j++) {
                    var thme = $($rowTh[j - i - 1]);
                    var r2 = $($rowTh[j]);
                    var clz = "rel-val-0";
                    if (thme.attr("type") == '1' || r2.attr("type") == '1') {
                        clz = "rel-val-na";
                    }
                    $d = $("<div class='rotated rel-item " + clz + "' row='" + thme.attr("id").substr(4)
                        + "' col='" + r2.attr("id").substr(4) + "'></div>").appendTo(form);
                    $d.width(ow).height(ow).css({left: (lp - (i + 1) * od / 2 - 11) + 'px',
                        top:($first.position().top + (j) * od - (i * od / 2) - 10) + 'px'});
                }
            }
        }
    };//--]Plugin Define

//jQuery Plugin Implementation
    $.fn.qform = function(conf) {
        //return existing instance // let users can use the Public Methods
        //Usage: var obj = $('#id').qform({ <options> }).data("qform");
        var el = this.eq(typeof conf == 'number' ? conf : 0).data("qform");
        if (!conf && el) {
            return el;
        }

        //setup default options
        var opts = {
            projectId: '',
            formId: '',
            rows: [],
            cols: [],
            editors:[],
            leftRows:[],
            form: {},
            leftCols:[],
            topRows:[],
            topCols:[],
            editor_api: '/qform/form/setCellEditors.json',
            add_row_api: '/qform/form/addRow.json',
            add_rows_api: '/qform/form/addRows.json',
            add_col_api: '/qform/form/addCol.json',
            add_cols_api: '/qform/form/addCols.json',
            load_data_api: '/qform/project/data.json',
            save_data_api: '/qform/project/set.json',
            setEditor: function(type, tds, callback) {
                // 选择只读、填写和选择
                var param = '';
                if ('3' == type) {
                    var v = prompt("输入值");
                    if (v) {
                        param = v;
                    } else {
                        return;
                    }
                }
                $.post(opts.editor_api,
                    {type:type, param:param, cells:tds.join(','), formId: opts.formId}, function(data) {
                        if (callback) {
                            callback.apply(this, data);
                        } else {
                            opts.editorSaveCallback(data);
                        }
                    });

            },
            editorSaveCallback: function(data) {
                opts.editors = data;
                $("td.hilight").removeClass('hilight');
                el.showEditors();
            }
        };

        //if no users options then use the default options
        $.extend(opts, conf);

        // install the plugin for each items in jQuery
        this.each(function() {
            el = new qform(this, opts);
            $(this).data("qform", el);
        });
        //api=true let users can immediate use the Public Methods
//        return opts.api ? el : this;
        return el;
    };
})(jQuery);//--]jQuery Plugin Container
