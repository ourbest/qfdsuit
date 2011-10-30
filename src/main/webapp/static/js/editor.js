var call = $.post, $designer,$desview, $form, $info;
var runtime = {};
var types = ['正常', '分类', '图表', '计算'];
var _project = {

    load_project:function(projectId) {
        $("#project-list").hide();
        projectId = projectId || '3';
        $designer.find("div").remove();
        rpc.qform.project.load({projectId:projectId}, function(pdata) {
            runtime.projectId = projectId;
            runtime.projectData = pdata;
            $form.hide();
            rpc.qform.project.info({projectId: projectId}, function(data) {
                $("#project-name").val(data.name);
                $("#project-status").val(data.status);
                runtime.projectInfo = data;
                $.each(pdata, function(i, a) {
                    _form.draw_form(a, $designer);
                });
                $designer.show();
            });
        });
    },

    show_project_th:function(projectId) {
        projectId = projectId || '3';
        $desview.find("div").remove();
        rpc.qform.project.load({projectId:projectId}, function(pdata) {
            runtime.projectId = projectId;
            runtime.projectData = pdata;
            rpc.qform.project.info({projectId: projectId}, function(data) {
                $("#project-name").val(data.name);
                $("#project-status").val(data.status);
                runtime.projectInfo = data;
                $.each(pdata, function(i, a) {
                    _form.draw_form_th(a, $desview);
                });
                $desview.show();
            });
        });
    },

    close_project:function() {
        runtime.projectId = null;
        $designer.find("div").remove();
        $designer.hide();
    },
    set_project_name:function() {
        rpc.qform.project.setProjectName({projectId: runtime.projectId, name: $("#project-name").val()});
    },
    delete_project:function() {
        var me = this;
        $.messager.confirm('确认', '真的要删除吗？', function(r) {
            if (r) {
                rpc.qform.project.setStatus({projectId:runtime.projectId, status:-1}, function() {
                    me.close_project();
                });
            }
        });
    },

    as_template:function() {
        rpc.qform.project.asTemplate({projectId:runtime.projectId});
    },

    show_def_projects:function() {
        this.toggle_list();
    },

    show_input_projects:function() {
        this.toggle_list();
        // todo 换显示方式
        rpc.qform.project.list({type:1}, this.show_list);
    },

    toggle_list:function() {
        var $uls = $("#project-list ul[class='ullist']");
        $uls.each(function(a) {
            $(this).children().remove();
        });
        $designer.hide();
        $form.hide();
        $("#project-list").show();
        var listtabs = $('#sch_tabs').tabs({
            tools:[
                {
                    iconCls:'icon-ls',
                    handler: function() {
                        alert('add');
                    }
                },
                {
                    iconCls:'icon-bk',
                    handler: function() {
                        alert('save');
                    }
                }
            ],
            onSelect:function(title) {
                if (title == "QFD分析项目") {
                    _project.get_proj_list();


                }
                else if (title == "QFD分析模板") {
                    _project.get_temp_list();
                }
            },
            width:640
        });
        listtabs.tabs('resize');
        return $uls;
    },

    get_temp_list:function() {
        var $ul = $("#temlist");
        $ul.children().remove();
        rpc.qform.project.templates(function(projects) {
            var cnt = 1;
            $.each(projects, function(i, a) {
                var li = $("<li>" +
                    "<span class='tha'>" + cnt + "</span>" +
                    "<span class='showflow'></span>" +
                    "<span class='thb'><a href='#' onclick='_project.clone_project(" + a.projectId + ");'>" + a.name + "</a></span>" +
                    "<span class='thc'>原力</span>" +
                    "<span class='thd'>2011-10-27</span>" +
                    "<span class='tha'>简介</span>" +
                    "<span class='thf'>这里是项目简介</span>" +
                    "</li>");
                li.appendTo($ul);
                $('.showflow').click(function() {
                    _project.show_preflow_view(a.projectId);
                });
                cnt++;
            });
        });
        return $ul;
    },

    show_preflow_view:function(prjid) {
        _project.show_project_th(prjid);
    },
    get_proj_list:function() {

        rpc.qform.project.list({type:0}, this.show_list);
    },

    show_templates:function() {
        var me = this;
        me.toggle_list();
    },

    create_project:function() {
        var title = '新项目';
        var me = this;
        rpc.qform.project.create({name:title}, function(data) {
            me.load_project(data.projectId);
        });
    },

    update_project_status:function() {
        rpc.qform.project.setStatus({projectId:runtime.projectId, status:$("#project-status").val()});
    },

    clone_project:function(projectId) {
        var me = this;

        rpc.qform.project.cloneProject({projectId:projectId}, function(data) {
            me.load_project(data.projectId);
        });
    },

    show_list: function(projects) {
        var $ul = $("#prjlist");
        $ul.children().remove();
        var cnt = 1;
        $.each(projects, function(i, a) {
            var li = $("<li><span class='tha'>" + cnt + "</span>" +
                "<span class='showflow'></span>" +
                "<span class='thb'><a href='#' onclick='_project.load_project(" + a.projectId + ");'>" + a.name + "</a></span>" +
                "<span class='thc'>原力</span>" +
                "<span class='thd'>2011-10-27</span>" +
                "<span class='tha'>简介:</span>" +
                "<span class='thf'>这里是项目简介</span>" +
                "</li>");
            li.appendTo($ul);
            $('.showflow').click(function() {
                _project.show_preflow_view(a.projectId);
            });
            cnt++;
        });
    }
};

var _form = {
    close_form: function() {
        $("#form-container").qform().close();
        $form.hide();
        $designer.show();
    },

    create_related_form: function() {
        var formId = runtime.formId;
        var projectId = runtime.projectId;
        var me = this;
        rpc.qform.project.createRelatedForm({projectId:projectId, formId:formId}, function(data) {
            if (data.formId) {
                runtime.formId = data.formId;
                me.edit_form();
                rpc.qform.project.load({projectId:projectId}, function(data) {
                    runtime.projectId = projectId;
                    $designer.find("div").remove();
                    $.each(data, function(i, a) {
                        me.draw_form(a, $designer);
                    });
                });
            } else {
                $.messager.alert("错误", "创建失败");
            }
        });
    },

    save_form_name: function() {
        var formId = runtime.formId;
        var formName = $("#form-name").val();
        var projectId = runtime.projectId;
        rpc.qform.form.setFormName({projectId:projectId, formId:formId, formName:formName});
    },
    show_toolbar: function() {
        $("#status-1").hide();
        $("#status-0").show();
    },
    edit_form: function() {
        var formId = runtime.formId;
        $designer.hide();
        rpc.qform.form.load({formId:formId}, function(data) {
            data.projectId = runtime.projectId;
            data.formId = formId;
            runtime.formData = data;

            var status = runtime.projectInfo.status;
            $form.show();
            $("#status-0, #status-1").hide();
            $("#form-name").val(data.form.formName);
            $("#form-commands").find('a').each(function(i, a) {
                a = $(a);
                if (a.attr("type") == data.form.formType) {
                    a.show();
                } else {
                    a.hide();
                }
            });
            if (status == 0) {
                $("#status-0").show();
                $("#form-container").qform(data).show();
            } else {
                $("#status-1").show();
                $("#form-container").qform(data).show().input();
            }
        });
    },

    draw_form:function(a, container) {
        var f = $("<div id='" + a.formId + "' class='form-type-" + a.formType + "'>"
            + a.formName + "</div>").appendTo(container);
        f.draggable({
            onStopDrag: function() {
                var pos = $(this).position();
                rpc.qform.project.position({
                    projectId:  runtime.projectId,
                    formId: this.id,
                    posLeft: pos.left,
                    posTop:  pos.top});
            }
        }).css({left: a.posLeft, top: a.posTop});
    } ,

    draw_form_th:function(a, container) {
        var f = $("<div id='" + a.formId + "' class='form-type-th-" + a.formType + "'>"
            + "...." + "</div>").appendTo(container);
        f.css({left: a.posLeft / 2, top: a.posTop / 2});
    } ,

    delete_form: function() {
        rpc.qform.project.deleteForm({formId:runtime.formId}, function(data) {
            _project.load_project(runtime.projectId);
        });
    },

    create_form:function() {
        var projectId = runtime.projectId;
        if (projectId) {
            rpc.qform.project.createForm({projectId:projectId}, function(data) {
                _project.load_project(projectId);
            });
        }
    },

    create_matrix_form:function() {
        var projectId = runtime.projectId;
        if (projectId) {
            rpc.qform.project.createMatrixForm({projectId:projectId}, function(data) {
                _project.load_project(projectId);
            })
        }
    },

    edit_matrix_info:function() {
        var me = this;
        var dlg = getDialog();
        $("#editor-dialog-content").children().hide();
        $("#house-editor").appendTo("#editor-dialog-content").show();
        rpc.qform.project.listFormsByType({projectId:runtime.projectId, formType:0}, function(data) {
            me.add_options(data, "#house-left");
            me.add_options(data, "#house-top");
            $("#house-left").val(runtime.formData.matrix.leftId);
            $("#house-top").val(runtime.formData.matrix.topId);
            if (runtime.formData.matrix.hasRoof) {
                $("#house-editor-top").addClass("selected");
            } else {
                $("#house-editor-top").removeClass("selected");
            }
            if (runtime.formData.matrix.hasLeft) {
                $("#house-editor-left").addClass("selected");
            } else {
                $("#house-editor-left").removeClass("selected");
            }
            dlg.dialog({title:'编辑质量屋属性',resizable: true,
                buttons: [
                    {text:'确认', iconCls:'icon-ok', id:'edit-rows-ok'}
                ]});
            $("#edit-rows-ok").click(function() {
                dlg.dialog('close');
                var leftId = $("#house-left").val();
                var topId = $("#house-top").val();
                var hasRoof = $("#house-editor-top").hasClass('selected');
                var hasLeft = $("#house-editor-left").hasClass('selected');
                rpc.qform.form.editMatrix({formId:runtime.formId, leftId: leftId, topId: topId, hasRoof:hasRoof, hasLeft:hasLeft}, function() {
                    me.edit_form();
                });
                //...
            });
        });
    },

    edit_rows:function() {
        this.do_edit(function(formId, callback) {
            runtime.editing = 'row';
            rpc.qform.form.getRows({formId:formId}, callback);
        });
    },
    edit_cols:function() {
        this.do_edit(function(formId, callback) {
            runtime.editing = 'col';
            rpc.qform.form.getCols({formId:formId}, callback);
        });
    },

    row_up:function(e) {
        var $tr = $(e).parents('tr');
        var rowId = $tr.attr("rowid");
        var prev = $tr.prev();
        if (prev.hasClass('header')) return false;

        rpc.qform.form.swapRow({rowId1:rowId, rowId2:prev.attr("rowId")}, function() {
            $tr.detach().insertBefore(prev);
        });
        return false;
    },

    row_down:function(e) {
        var $tr = $(e).parents('tr');
        var rowId = $tr.attr("rowid");
        var next = $tr.next();
        if (!next.get(0)) return false;
        rpc.qform.form.swapRow({rowId1:rowId, rowId2:next.attr("rowId")}, function() {
            $tr.detach().insertAfter(next);
        });
        return false;
    },

    del_row:function(e) {
        var $tr = $(e).parents('tr');
        var rowId = $tr.attr("rowid");
        rpc.qform.form.deleteRow({rowId:rowId}, function() {
            $tr.remove()
        });
        return false;
    },

    edit_row_title:function(e) {
        var $e = $(e);
        var rowId = $e.parent().attr("rowid");
        var oldTitle = $e.text();
        $e.text('');
        var htm = $('<input value="' + oldTitle + '">');
        var done = function() {
            var t = htm.val();
            rpc.qform.form.setRowTitle({rowId:rowId, title:t}, function() {
                $e.text(t);
            });
        };
        htm.keydown(
            function(e) {
                if (e.keyCode == 13) {
                    done();
                    return false;
                } else if (e.keyCode == 27) {
                    $e.text(oldTitle);
                    return false;
                }
            }).appendTo(e).focus().blur(done);
    },

    edit_row_type:function(e) {
        var $e = $(e);
        var rowId = $e.parent().attr("rowid");
        var oldType = $e.attr("type");
        $e.text('');
        var opts = [];
        $.each(types, function(i, a) {
            opts.push('<option value="' + i + '">' + a + '</option>');
        });
        var htm = $("<select>" + opts.join('') + "</select>");
        var f = function() {
            var t = htm.val();
            if (oldType == t) {
                $e.text(types[t]);
            } else {
                rpc.qform.form.setRowType({rowId:rowId, type:t}, function() {
                    $e.text(types[t]);
                    $e.attr('type', t);
                })
            }
        };
        var $elem = htm.appendTo($e).val(oldType);
        $elem.change(f);
        $elem.blur(f).focus();
    },

    edit_row_ref:function(e) {
        var $e = $(e);
        var rowId = $e.parent().attr("rowid");
        var oldLevel = $e.text();
        $e.text('');
        var htm = $('<input value="' + oldLevel + '">');
        var done = function() {
            var t = htm.val();
            rpc.qform.form.setRowRef({rowId:rowId, ref:t}, function() {
                $e.text(t);
            });
        };
        htm.keydown(
            function(e) {
                if (e.keyCode == 13) {
                    done();
                    return false;
                } else if (e.keyCode == 27) {
                    $e.text(oldLevel);
                    return false;
                }
            }).appendTo(e).focus().blur(done);
    },
    edit_row_level:function(e) {
        var $e = $(e);
        var rowId = $e.parent().attr("rowid");
        var oldLevel = $e.text();
        $e.text('');
        var htm = $('<input value="' + oldLevel + '">');
        var done = function() {
            var t = htm.val();
            rpc.qform.form.setRowLevel({rowId:rowId, level:t}, function() {
                $e.text(t);
            });
        };
        htm.keydown(
            function(e) {
                if (e.keyCode == 13) {
                    done();
                    return false;
                } else if (e.keyCode == 27) {
                    $e.text(oldLevel);
                    return false;
                }
            }).appendTo(e).focus().blur(done);
    },


    draw_row:function(data, $tbl) {
        $.each(data, function(i, r) {
            var tr = [];
            tr.push("<tr class='row' rowid='" + r.rowId + "'><td>" + (i + 1) + "</td>");
            tr.push("<td class='title' ondblclick='_form.edit_row_title(this);'>" + r.title + "</td>");
            tr.push("<td class='type' ondblclick='_form.edit_row_type(this);' type='" + r.type + "'>" + types[r.type] + "</td>");
            tr.push("<td class='level' ondblclick='_form.edit_row_level(this);'>" + r.level + "</td>");
            tr.push("<td class='ref' ondblclick='_form.edit_row_ref(this);'>" + (r.ref ? r.ref : '&nbsp;') + "</td>");
            tr.push("<td class='action'><a href='#' onclick='_form.del_row(this);'>删除</a> " +
                "<a href='#' onclick='_form.row_up(this);'>上移</a> <a href='#' onclick='_form.row_down(this);'>下移</a></td>");
            tr.push("</tr>");
            $(tr.join('')).appendTo($tbl);
        });
    },
    do_edit:function(loadFunc) {
        var me = this;
        // row的类型
        var dlg = getDialog();
        var formId = runtime.formId;
        $("#editor-dialog-content").children().hide();
        $("#edit-rows").appendTo('#editor-dialog-content').show();
        loadFunc(formId, function(data) {
            var $tbl = $("#edit-rows table");
            $tbl.find("tr.row").remove();
            me.draw_row(data, $tbl);
        });
        dlg.dialog({title:'编辑属性',resizable: true,
            buttons: [
                {text:'确认', iconCls:'icon-ok', id:'edit-rows-ok'}
            ]});
        $("#edit-rows-ok").click(function() {
            dlg.dialog('close');
//        edit_form();
        });
    },
    toggle_selection:function(e) {
        $(e).toggleClass('selected');
    },
    add_options:function(data, e) {
        $(e).children().remove();
        $.each(data, function(i, a) {
            $("<option value='" + a.formId + "'>" + a.formName + "</option>").appendTo(e);
        });
    },
    add_rows:function() {
        var me = this;
        var callback = function(data) {
            me.draw_row(data, $("#edit-rows table"));
        };
        __readText('添加行', '输入行数', function(cnt) {
            if (runtime.editing == 'row') {
                rpc.qform.form.addRows({formId: runtime.formId, count:cnt}, callback);
            } else {
                rpc.qform.form.addCols({formId: runtime.formId, count:cnt}, callback);
            }
        });
    }

};

function open_tab(title, href) {
    /*
     $("#tt").tabs('add', {
     title: title,
     href: href,
     closable:true
     });
     */
}
function getDialog() {
    if (!document.getElementById("editor-dialog")) {
        var div = $("<div id='editor-dialog'><div id='editor-dialog-content'" +
            " style='padding: 10px;'></div></div>");
        div.appendTo("body");
        div.width(640).height(480);
        div.dialog({
            modal:true,
            onClose:function() {
                _form.edit_form();
            }
        });
    }
    return $("#editor-dialog");
}
/*

 $(function() {
 //    $formMenu = $("#form-menu");
 $designer = $("#designer-container");
 $form = $("#form-editor");
 $info = $("#project-info");

 $("#menu li a").click(function(e) {
 var $t = $(this);
 open_tab($t.attr("title"), $t.attr("href"));
 e.preventDefault();
 return false;
 });

 $designer.delegate("div", "dblclick", function(e) {
 runtime.formId = this.id;
 _form.edit_form();
 return false;
 });
 });
 */

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
