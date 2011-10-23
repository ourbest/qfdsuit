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
        $('#qdScheme').treegrid({
                    title:'气动外形方案',
                    nowrap:false,
                    colapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/qddef_data',
                    idField:'code',
                    treeField:'code',
                    frozenColumns:[
                        [
                            {title:'',field:'code',width:280,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }}
                        ]
                    ],
                    columns:[
                        [
                            {field:'grade',title:'评分',width:80, rowspan:2},
                            {field:'diagram',title:'直方图',width:120, rowspan:2}
                        ]
                    ],
                    rownumbers:true
                });
        $('#pushSystem').treegrid({
                    title:'气动外形与产品规格矩阵',
                    nowrap: false,
                    rownumbers: true,
                    animate:true,
                    collapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/qdvalid_data',
                    idField:'characteristics',
                    treeField:'characteristics',
                    frozenColumns:[
                        [
                            {title:'',field:'characteristics',width:160,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }
                            }
                        ]
                    ],
                    columns:[
                        [
                            {field:'dt',title:'弹体',width:30},
                            {field:'zdct',title:'轴对称体',width:60},
                            {field:'slt',title:'升力体',width:45},
                            {field:'tbxcb',title:'头部细长比',width:75},
                            {field:'da',title:'大',width:30},
                            {field:'zhong',title:'中',width:30},
                            {field:'xiao',title:'小',width:30},
                            {field:'zxdw',title:'锥形弹尾',width:60},
                            {field:'wu',title:'无',width:30},
                            {field:'zh',title:'中',width:30},
                            {field:'zho',title:'重',width:30},
                            {field:'yi',title:'翼（无、有）',width:90},
                            {field:'w',title:'无',width:30},
                            {field:'sjx',title:'三角形',width:45},
                            {field:'hlqytx',title:'后掠前沿梯形',width:90},
                            {field:'qlqytx',title:'前掠前沿梯形',width:90},
                            {field:'jx',title:'矩形',width:30},
                            {field:'kzgs',title:'控制方式',width:60},
                            {field:'wy',title:'尾翼',width:30},
                            {field:'ys',title:'鸭式',width:30},
                            {field:'dy',title:'弹翼',width:30},
                            {field:'fcg',title:'非常规（推力矢量，喷流互动）',width:200}
                        ]
                    ]
                });
        $('#qdParam').treegrid({
                    width:1080,
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
        <div title="气动设计方案设计" style="padding:10px;">
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <a class="button" href="#" onclick="defd()"><span>定义指标模型</span></a>
                        <a class="button" href="#" onclick="mdd()"><span>修改指标模型</span></a>
                    </td>
                </tr>
            </table>
            <br/>
            <table id="qdScheme" style="width:950px"></table>
        </div>
        <div title="气动方案比较矩阵" style="padding:10px;">
            <table id="pushSystem"></table>
        </div>
        <div title="气动指标设计" style="padding:10px;">
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <a class="button" href="#" onclick="defd()"><span>定义指标模型</span></a>
                        <a class="button" href="#" onclick="mdd()"><span>修改指标模型</span></a>
                    </td>
                </tr>
            </table>
            <br/>
            <table id="qdParam"></table>
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
