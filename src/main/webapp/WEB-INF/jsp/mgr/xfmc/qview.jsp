<script>
    $(function() {
        $('#kresult').datagrid({
                    title:'产品零部件列表',
                    url:'/ajax/xfmcdir/cad/datagrid_data',
                    nowrap: false,
                    striped: true,
                    frozenColumns:[
                        [
                            {field:'ck',checkbox:true},
                            {title:'编码',field:'code',width:80,sortable:true}
                        ]
                    ],
                    columns:[
                        [
                            {title:'产品零部件',colspan:7},
                            {field:'opt',title:'操作此零件',width:120,align:'center', rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<span><img src="${pageContext.request.contextPath}/static/images/flow.png" onclick="showp()"></span>';
                                    }
                                }
                            }
                        ],
                        [
                            {field:'name',title:'名称',width:120},
                            {field:'addr',title:'所属类型',width:120,rowspan:2},
                            {field:'accout',title:'属性',width:100,rowspan:2},
                            {field:'att',title:'任务',width:40,rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<span><img src="${pageContext.request.contextPath}/static/images/task.png"></span>';
                                    }
                                }
                            },
                            {field:'att1',title:'几何',width:40,rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<span><img src="${pageContext.request.contextPath}/static/images/geo.png"></span>';
                                    }
                                }
                            },
                            {field:'att2',title:'仿真',width:40,rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<span><img src="${pageContext.request.contextPath}/static/images/sim.png"></span>';
                                    }
                                }
                            },
                            {field:'att3',title:'求解',width:40,rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<span><img src="${pageContext.request.contextPath}/static/images/ansys.png"></span>';
                                    }
                                }
                            }
                        ]
                    ],
                    rownumbers:true
                });
    });
    function showp() {
        $("#ss").show();
        $("#mv").show();
        $('#sresult').datagrid({
                    title:'可优化参数定义',
                    url:'/ajax/xfmcdir/fmcgrid/data',
                    sortName: 'scode',
                    remoteSort: false,
                    idField:'scode',
                    frozenColumns:[
                        [
                            {field:'sck',checkbox:true},
                            {title:'编码',field:'scode',width:80,sortable:true}
                        ]
                    ],
                    columns:[
                        [
                            {title:'可调整参数',colspan:6}
                        ],
                        [
                            {field:'sname',title:'参数名称',width:200},
                            {field:'stype',title:'参数类型',width:120,rowspan:2},
                            {field:'svalue',title:'参数值',width:100,rowspan:2},
                            {field:'sopt',title:'是否优化',width:100,rowspan:2},
                            {field:'sdown',title:'下限值',width:100,rowspan:2},
                            {field:'sup',title:'上限值',width:100,rowspan:2}
                        ]
                    ],
                    pagination:true,
                    rownumbers:true
                });
    }
    function showCAD() {
        $('#cad').window('open');
    }

    function showCAE() {
        $('#cae').window('open');
    }
    function showSYS() {
        $('#sys').window('open');
    }

</script>
<div class="clearfloat">&nbsp;</div>
<div style="width:980;margin:0 0 0 40px;padding:0;">
    <div class="mainspace">
        <table id="kresult"></table>
    </div>
</div>
<div id="mv" style="width:980;margin:0 0 0 40px;display:none">
    <div class="mainspace" id="ss" style="display:none">
        <table cellpadding="4" cellspacing="0" class="prjwin">
            <tr>
                <td>
                    <button onclick="showCAD()">CAD模型查看</button>
                    <button onclick="showCAE()">CAE模型查看</button>
                    <button onclick="showSYS()">分析结果查看</button>
                </td>
            </tr>
        </table>
    </div>
    <div class="mainspace">
        <table id="sresult"></table>
    </div>
</div>

<div id="cad" class="easyui-window" closed="true" modal="true" title="CAD模型查看" style="width:640px;height:460px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <img src="${pageContext.request.contextPath}/static/images/cadview.png">
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="viwclose()">确定</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>
<div id="cae" class="easyui-window" closed="true" modal="true" title="CAE模型查看" style="width:640px;height:460px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <img src="${pageContext.request.contextPath}/static/images/caeview.png">
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="viwclose()">确定</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>
<div id="sys" class="easyui-window" closed="true" modal="true" title="分析结果查看" style="width:640px;height:480px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <img src="${pageContext.request.contextPath}/static/images/asys.png">
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="viwclose()">确定</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>
