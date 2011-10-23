<script>
    $(function() {
        $("#tt").tabs();
        $("#stt").tabs({
                    tools:[
                        {
                            iconCls:'icon-add',
                            text:'增加指标'
                        },
                        {
                            iconCls:'icon-remove',
                            text:'注销指标'
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
        $('#kresult').datagrid({
                    title:'总体设计指标',
                    url:'/ajax/xfmc/techvalid_data',
                    nowrap: false,
                    striped: true,
                    frozenColumns:[
                        [
                            {field:'ck',checkbox:true},
                            {title:'编码',field:'code',width:80}
                        ]
                    ],
                    columns:[
                        [
                            {field:'standard',title:'基准导弹',width:120},
                            {field:'qualification',title:'技术指标',width:120,rowspan:2},
                            {field:'sk',title:'定义分析流程',width:100,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<button onclick="def()">定义分析流程</button>';
                                }
                            },
                            {field:'ssk',title:'定义IPT',width:100,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<a href="#" onclick="showipt()"><img src="${pageContext.request.contextPath}/static/images/icon/userm32.png" style="border:0;height:16px"></a>';
                                }
                            },
                            {field:'opts',title:'验证结果',width:140,rowspan:2},
                            {field:'opt',title:'指标验证',width:100,align:'center', rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<span><img src="${pageContext.request.contextPath}/static/images/flow.png" onclick="ih()"></span>';
                                    }
                                }
                            },
                            {field:'vk',title:'指标关联',width:100,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<button onclick="ref()">指标关联</button>';
                                }
                            },
                            {field:'omk',title:'版本比较',width:100,rowspan:2,
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
        location.href = "${pageContext.request.contextPath}/mgr/demx/daflow";
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
        <div title="型号总体系统指标" style="padding:10px;">
            <div style="width:1100px">
                <table cellpadding="4" cellspacing="0" width="950">
                    <tr>
                        <td>
                            <a class="button" href="#" onclick="defd()"><span>定义指标模型</span></a>
                            <a class="button" href="#" onclick="mdd()"><span>修改指标模型</span></a>
                        </td>
                    </tr>
                </table>
                <br/>
                <table id="kresult"></table>
            </div>
        </div>
        <div title="技术指标分解" style="padding:10px;">
            <div class="clearfloat">&nbsp;</div>
            <div class="mainspace">
                <div style="width:950px">
                    <div class="drag" style="margin: 0 auto">总体系统指标</div>
                </div>
                <div style="height:40px"></div>
                <div style="width:950px">
                    <div class="blk">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/mgr/xfmc/qddef">气动系统</a></li>
                            <li><a href="${pageContext.request.contextPath}/mgr/xfmc/tjdef">推进系统</a></li>
                            <li><a href="#">重量</a></li>
                            <li><a href="#">飞行性能</a></li>
                            <li><a href="#">品质要素与发射平台集成</a></li>
                        </ul>
                    </div>
                </div>
            </div>
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
