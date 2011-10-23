<script>
    $(function() {
        $("#tt").tabs({
                    tools:[
                        {
                            iconCls:'icon-back',
                            text:'返回',
                            handler: function()
                            {
                                 location.href="${pageContext.request.contextPath}/mgr/xfmc/techvalid";
                            }
                        },
                        {
                            iconCls:'icon-save',
                            text:'保存结果'
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
        $('#qdParam').treegrid({
                    title:'气动外形参数规格表',
                    nowrap:false,
                    rownumbers:true,
                    animate:true,
                    colapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/qdtv_data',
                    idField:'code',
                    treeField:'code',
                    frozenColumns:[
                        [
                            {title:'',field:'code',width:260,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }}
                        ]
                    ],
                    columns:[
                        [
                            {field:'targetImp',title:'指标重要度',width:100},
                            {field:'standardMiss',title:'基准导弹',width:60},
                            {field:'techTarget',title:'技术指标',width:60,rowspan:2},
                            {field:'unit',title:'单位',width:60,rowspan:2},
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
                            {field:'opp',title:'指标验证',width:100,align:'center', rowspan:2,
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
                    ]
                });
        $('#presult').datagrid({
                    title:'分析参数模型',
                    url:'${pageContext.request.contextPath}/ajax/demx/param_data',
                    sortName: 'scode',
                    remoteSort: false,
                    idField:'scode',
                    frozenColumns:[
                        [
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
        <div title="气动方案指标验证" style="padding:10px;">
            <div style="width:1080px">
                <table id="qdParam"></table>
            </div>
        </div>
        <div title="总体参数定义" style="padding:10px;">
            <table id="presult"></table>
        </div>
        <div title="相关型号指标参考" style="padding:10px;">
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
                    <li><img src="${pageContext.request.contextPath}/static/images/man.gif" style="width:30px"><span
                            style="padding:0 0 0 10px">总设计师：赵文军</span>
                    </li>
                    <li><img src="${pageContext.request.contextPath}/static/images/man.gif" style="width:30px"><span
                            style="padding:0 0 0 10px">总指挥：陈莹</span>
                    </li>
                    <li><img src="${pageContext.request.contextPath}/static/images/man.gif" style="width:30px"><span
                            style="padding:0 0 0 10px">设计师：黄玉</span>
                    </li>
                    <li><img src="${pageContext.request.contextPath}/static/images/man.gif" style="width:30px"><span
                            style="padding:0 0 0 10px">设计师：原力</span>
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
