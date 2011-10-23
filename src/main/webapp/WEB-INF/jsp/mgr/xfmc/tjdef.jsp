<script>
    $(function() {
        $("#tt").tabs({
                    tools:[
                        {
                            iconCls:'icon-back',
                            text:'返回',
                            handler: function() {
                                location.href = "${pageContext.request.contextPath}/mgr/xfmc/ztdes";
                            }
                        },
                        {
                            iconCls:'icon-save',
                            text:'保存指标'
                        },
                        {
                            iconCls:'icon-search',
                            text:'版本视图'
                        },
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]
                });
        $('#tjSysScheme').treegrid({
                    title:'推进系统方案',
                    nowrap:false,
                    animate:true,
                    colapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/tjdef_data',
                    idField:'code',
                    treeField:'code',
                    frozenColumns:[
                        [
                            {title:'',field:'code',width:250,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }}
                        ]
                    ],
                    columns:[
                        [
                            {field:'grade',title:'评分',width:200, rowspan:2},
                            {field:'diagram',title:'直方图',width:200, rowspan:2}
                        ]
                    ],

                    onBeforeLoad:function(row, param) {
                        if (row) {
                            $(this).treegrid('options').url = 'treegrid_subdata.json';
                        } else {
                            $(this).treegrid('options').url = '${pageContext.request.contextPath}/ajax/xfmc/tjdef_data';
                        }
                    },
                    onContextMenu: function(e, row) {
                        e.preventDefault();
                        $(this).treegrid('unselectAll');
                        $(this).treegrid('select', row.code);
                        $('#mm').menu('show', {
                                    left: e.pageX,
                                    top: e.pageY
                                });
                    },
                    rownumbers:true
                });
        $('#ppRelation').treegrid({
                    title:'推进系统与产品规格矩阵',
                    nowrap: false,
                    rownumbers: true,
                    animate:true,
                    collapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/tjref_data',
                    idField:'characteristics',
                    treeField:'characteristics',
                    frozenColumns:[
                        [
                            {title:'',field:'characteristics',width:200,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }
                            }
                        ]
                    ],
                    columns:[
                        [
                            {field:'wpfdj',title:'亚音速涡喷发动机',width:120},
                            {field:'cyfdj',title:'液体燃料冲压发动机',width:120,rowspan:2},
                            {field:'hdshj',title:'涵道式火箭',width:150,rowspan:2},
                            {field:'crfdj',title:'碳氢燃料超燃发动机',width:120,rowspan:2},
                            {field:'gthjfdj',title:'火箭发动机',width:150,rowspan:2}

                        ]
                    ],
                    onContextMenu: function(e, row) {
                        e.preventDefault();
                        $(this).treegrid('unselectAll');
                        $(this).treegrid('select', row.code);
                        $('#mm').menu('show', {
                                    left: e.pageX,
                                    top: e.pageY
                                });
                    }
                });
        $('#tjSysSchemeSub').treegrid({
                    title:'液体燃料冲压发动机技术规格表',
                    nowrap:false,
                    animate:true,
                    colapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/tjtv_data',
                    idField:'code',
                    treeField:'code',
                    frozenColumns:[
                        [
                            {title:'',field:'code',width:180,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }}
                        ]
                    ],
                    columns:[
                        [
                            {field:'direction',title:'改进方向',width:60, rowspan:2},
                            {field:'techImport',title:'重要度',width:60, rowspan:2},
                            {field:'referPro',title:'参考产品',width:60, rowspan:2},
                            {field:'targetVal',title:'目标值',width:80, rowspan:2},
                            {field:'unit',title:'单位',width:60, rowspan:2},
                            {field:'sk',title:'定义分析流程',width:120,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<button onclick="def()">定义分析流程</button>';
                                }
                            },
                            {field:'ssk',title:'定义IPT',width:60,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<a href="#" onclick="showipt()"><img src="${pageContext.request.contextPath}/static/images/icon/userm32.png" style="border:0;height:16px"></a>';
                                }
                            },
                            {field:'opts',title:'验证结果',width:60,rowspan:2},
                            {field:'opp',title:'指标验证',width:80,align:'center', rowspan:2,
                                formatter:function(value, rec) {
                                    return '<span><img src="${pageContext.request.contextPath}/static/images/flow.png" onclick="ih()"></span>';
                                }
                            },
                            {field:'vk',title:'指标关联',width:80,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<button onclick="ref()">指标关联</button>';
                                }
                            },
                            {field:'omk',title:'版本比较',width:80,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<button onclick="vd()">版本比较</button>';
                                }
                            }
                        ]
                    ],
                    rownumbers:true
                });
    });
    function ih() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/ansysflow";
    }
    function ref() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/cellmap";
    }
    function defd() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/dmod";
    }
    function mdd() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/dmod";
    }
    function def() {
        $.extend($.messager.defaults, {
                    ok:"自研流程",
                    cancel:"FMC流程"
                });
        $.messager.confirm('定义分析模板类型', '选择分析模板类型', function(r) {
            if (r) {
                location.href = "${pageContext.request.contextPath}/mgr/demx/daflow";
            }
            else {
                location.href = "${pageContext.request.contextPath}/mgr/demx/dfflow";
            }
        });
    }
    function showipt() {
        $("#ipt").window('open');
    }
</script>
<div class="mainspace">
    <div id="tt">
        <div title="推进设计方案设计" style="padding:10px;">
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <a class="button" href="#" onclick="defd()"><span>定义指标模型</span></a>
                        <a class="button" href="#" onclick="mdd()"><span>修改指标模型</span></a>
                    </td>
                </tr>
            </table>
            <br/>
            <table id="tjSysScheme" style="width:950px"></table>
        </div>
        <div title="推进方案比较矩阵" style="padding:10px;">
            <table id="ppRelation"></table>
        </div>
        <div title="推进指标设计" style="padding:10px;">
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <a class="button" href="#" onclick="defd()"><span>定义指标模型</span></a>
                        <a class="button" href="#" onclick="mdd()"><span>修改指标模型</span></a>
                    </td>
                </tr>
            </table>
            <br/>
            <table id="tjSysSchemeSub"></table>
        </div>
        <div title="相关型号指标参考" style="padding:10px;">
            <div class="srch">
                输入指标代码或名称快速查询相应指标
            </div>
            <div class="srchcxt">
                <div style="height:40px">
                    <input type="text" value="输入技术指标名称" style="width:400px;height:30px">
                    <button class="prjs">查询指标</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="ipt" class="easyui-window" closed="true" modal="true" title="集成设计团队" style="width:540px;height:500px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <img src="${pageContext.request.contextPath}/static/images/orgchart.png">
            <br/>

            <div class="account">
                <ul>
                    <li><img src="${pageContext.request.contextPath}/static/images/man.gif" style="width:30px"><span style="padding:0 0 0 10px">总设计师：赵文军</span>
                    </li>
                    <li><img src="${pageContext.request.contextPath}/static/images/man.gif" style="width:30px"><span style="padding:0 0 0 10px">总指挥：陈莹</span>
                    </li>
                    <li><img src="${pageContext.request.contextPath}/static/images/man.gif" style="width:30px"><span style="padding:0 0 0 10px">设计师：黄玉</span>
                    </li>
                    <li><img src="${pageContext.request.contextPath}/static/images/man.gif" style="width:30px"><span style="padding:0 0 0 10px">设计师：原力</span>
                    </li>
                </ul>
            </div>
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="viwclose()">确定</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>
