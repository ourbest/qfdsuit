<div style="position:relative;height: 100%;z-index:996;">
    <div class="panel_title">
        <div class="panel_icon icon-designer"></div>
        <div class="low-shadow boldsize left_align">QFD分析流程设计器</div>
        <div class="pmini"></div>
    </div>
    <div class="panel_arrow"></div>
    <div id='project-list'>
        <div class="innerbar">
            <div class="nowmarg">
                <span class="fnt_shaow">名称：</span>
                <input class="moinput"/> |
                <input type="radio" name="qname"/>模板 | <input type="radio" name="qname"/>项目 | <input type="radio" name="qname"/>表格 |
                <a href='#' class='easyui-linkbutton' iconCls='icon-search' plain='true' onclick="_form.save_form_name();">搜索</a>
            </div>
        </div>
        <div class="sheetpanel">
            <div id="sch_tabs">
                <div title="QFD分析项目" class="mytab">
                    <span class="tha"><img src=""></span><span class="thb">项目名称</span>
                    <span class="thc">创建者</span><span class="thd">创建时间</span>

                    <div class="clearfix"></div>
                    <ul id="prjlist" class="ullist">
                    </ul>
                </div>
                <div title="QFD分析模板" class="mytab">
                    <span class="tha"><img src=""></span><span class="thb">项目名称</span>
                    <span class="thc">创建者</span><span class="thd">创建时间</span>

                    <div class="clearfix"></div>
                    <ul id="temlist" class="ullist">
                    </ul>
                </div>
            </div>
            <div id="preflowview">
                <div id="preflag">
                </div>
            </div>
        </div>
    </div>

    <div id='designer-container' style='display:none'>
            <span id='project-info'><label for='project-name'>项目名称</label><input
                    id='project-name'><a href="#"
                                         class='easyui-linkbutton' iconCls='icon-save'
                                         onclick="_project.set_project_name();">保存</a>
                <label for='project-status'>状态</label><select
                        id='project-status' onchange="_project.update_project_status();">
                    <option value='0'>定义中</option>
                    <option value='1'>处理中</option>
                    <option value='2'>已完成</option>
                </select>
                <label></label>
                <a href="#" class="easyui-linkbutton" iconCls="icon-add"
                   onclick="_project.as_template();">设置为模板</a><br/>
                <a href="#" class="easyui-linkbutton" iconCls="icon-add"
                   onclick="_form.create_form();">新建表单</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-add"
                   onclick="_form.create_matrix_form();">新建矩阵</a><br/>
                <a href="#" class="easyui-linkbutton" iconCls="icon-ok"
                   onclick='_project.close_project();'>关闭</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-no"
                   onclick='_project.delete_project();'>删除</a>
                    </span>
    </div>
    <div id='form-editor' style="display: none;" class="editor_panel">
        <div id='form-editor-toolbar' class="innerbar">
            <div id='status-0' class="nowmarg">
                <span class="fnt_shaow">名称：</span>
                <input class="moinput" id='form-name'/>
                <a href='#' class='easyui-linkbutton' iconCls='icon-save' plain='true' onclick="_form.save_form_name();">保存</a>
                <a href='#' class='easyui-linkbutton' iconCls='icon-ok' plain='true' onclick="_form.close_form();">关闭</a>
                <a href='#' class='easyui-linkbutton' iconCls='icon-no' plain='true' onclick="_form.delete_form();">删除</a> |
                <a href='#' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick="_form.edit_rows();">编辑行</a>
                <a href='#' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick="_form.edit_cols();">编辑列</a> |
                    <span id='form-commands'>
                        <a href='#' class='easyui-linkbutton' type='0' iconCls='icon-edit' plain='true' onclick="_form.create_related_form();">创建xx表</a>
                    <a href='#' class='easyui-linkbutton' type='1' iconCls='icon-edit' plain='true' onclick="_form.edit_matrix_info();">质量屋属性</a>
                    </span>
            </div>
            <p id='status-1'>
                <a href='#' class='easyui-linkbutton' type='1'
                   iconCls='icon-edit' plain='true' onclick='_form.show_toolbar();'>编辑表</a>
                <a href='#' class='easyui-linkbutton'
                   iconCls='icon-ok' plain='true' onclick="_form.close_form();">关闭</a>
            </p>
        </div>
        <div class="sheetpanel">
            <div id='form-container'></div>
        </div>
    </div>
</div>

<div id='house-editor' style="display:none">
    <div id='house-editor-top' class="selected" onclick="_form.toggle_selection(this);"></div>
    <div id='house-editor-left' class="selected" onclick="_form.toggle_selection(this);"></div>
    <div id="house-editor-forms">
        <fieldset title="表">
            <legend>表</legend>
            <label for="house-left">左</label><select id='house-left'>
            <option value="0">选择...</option>
        </select>
            <label for="house-top">上</label><select id='house-top'>
            <option value="0">选择...</option>
        </select>
        </fieldset>
    </div>
</div>
<div id='edit-rows' style="display:none">
    <h3>编辑属性</h3>
    <table width='100%'>
        <tr class='header'>
            <th width='15'>序号</th>
            <th width='80'>名称</th>
            <th width='15'>类型</th>
            <th width='15'>级别</th>
            <th width='15'>公式</th>
            <th width='15'>操作</th>
        </tr>
        <tr class='row'>
            <td>1</td>
            <td>名字zzzzzzzzzzzzz</td>
            <td>1</td>
            <td>1</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <p>
        <a href='#' class='easyui-linkbutton' onclick="_form.add_rows();" plain='true' iconCls='icon-add'>增加行</a>
    </p>
</div>
<script type="text/javascript" src="/static/js/editor.js" charset="utf-8"></script>
<script>
    $(function() {
//    $formMenu = $("#form-menu");
        $desview = $("#preflag");
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

        rainbows.init({
            selector: '.nine h4',
            shadow: true,
            from: '#000000',
            to: '#aaaaaa'
        });
    });
</script>
