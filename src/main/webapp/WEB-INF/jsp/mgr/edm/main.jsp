<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
    $(function() {
        $("#tt").tabs({
                    tools:[
                        {
                            iconCls:'icon-more',
                            text:'更多计划'
                        },
                        {
                            iconCls:'icon-add',
                            text:'加入今日计划',
                            handler: function() {
                                alert('已把选择的任务通知加入今日计划');
                            }
                        },
                        {
                            iconCls:'icon-save',
                            text:'进行工作计划制定',
                            handler: function() {
                                location.href = "${pageContext.request.contextPath}/mgr/demx/planning";
                            }
                        }
                    ]});
        $("#reftt").tabs({
                    tools:[
                        {
                            iconCls:'icon-more',
                            text:'更多计划'
                        },
                        {
                            iconCls:'icon-add',
                            text:'加入今日计划',
                            handler: function() {
                                alert('已把选择的任务通知加入今日计划');
                            }
                        },
                        {
                            iconCls:'icon-save',
                            text:'进行工作计划制定',
                            handler: function() {
                                location.href = "${pageContext.request.contextPath}/mgr/demx/planning";
                            }
                        }
                    ]});
        $('#kresult').datagrid({
                    title:'最新任务列表',
                    url:'${pageContext.request.contextPath}/ajax/demx/task_data',
                    sortName: 'kind',
                    remoteSort: false,
                    fitColumns: true,
                    idField:'code',
                    frozenColumns:[
                        [
                            {field:'ck',checkbox:true},
                            {title:'编码',field:'code',width:40,sortable:true}
                        ]
                    ],
                    columns:[
                        [
                            {title:'任务信息',colspan:4},
                            {field:'opt',title:'任务操作',width:100,align:'center', rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<button onClick="viewprj();">进入任务</button>';
                                    }
                                }
                            }
                        ],
                        [
                            {field:'taskname',title:'任务名称',width:120,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<a href="#" onclick="goprj()">' + value + '</a>';
                                    }
                                }
                            },
                            {field:'taskcode',title:'任务代号',width:80,rowspan:2},
                            {field:'cata',title:'任务类型',width:80,rowspan:2},
                            {field:'actor',title:'分析流程',width:80,
                                formatter:function(value, rec) {
                                    return '<button onclick="viewflow()">进入分析流程</button>';
                                }
                            }
                        ]
                    ],
                    rownumbers:true
                });
        $('#qresult').datagrid({
                    title:'关联任务列表',
                    url:'${pageContext.request.contextPath}/ajax/demx/task_data',
                    sortName: 'kind',
                    remoteSort: false,
                    fitColumns: true,
                    idField:'code',
                    frozenColumns:[
                        [
                            {field:'ck',checkbox:true},
                            {title:'编码',field:'code',width:40,sortable:true}
                        ]
                    ],
                    columns:[
                        [
                            {title:'任务信息',colspan:6},
                            {field:'opt',title:'任务操作',width:100,align:'center', rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<button onClick="viewprj();">进入任务</button>';
                                    }
                                }
                            }
                        ],
                        [
                            {field:'taskname',title:'任务名称',width:100,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<a href="#" onclick="goprj()">' + value + '</a>';
                                    }
                                }
                            },
                            {field:'taskcode',title:'任务代号',width:80,rowspan:2},
                            {field:'actor',title:'IPT人员',width:60,rowspan:2},
                            {field:'proc',title:'活动状态',width:60,rowspan:2},
                            {field:'cata',title:'任务类型',width:50,rowspan:2},
                            {field:'map',title:'数据地图',width:80,
                                formatter:function(value, rec) {
                                    return '<button onclick="viewmap()">数据关系地图</button>';
                                }
                            }
                        ]
                    ],
                    rownumbers:true
                });
    });
    function viewflow() {
        location.href="${pageContext.request.contextPath}/mgr/demx/ansysflow";
    }

    function viewmap() {
        location.href="${pageContext.request.contextPath}/mgr/demx/cellmap";
    }
    function viwclose() {
        $('#win').window('close');
    }
</script>
<div class="mainspace">
    <div id="tt">
        <div title="我的最新任务通知" style="padding:20px;">
            <div>
                <table id="kresult"></table>
            </div>
        </div>
        <div title="任务记录查询" style="padding:20px;">
        </div>
        <div title="任务访问帮助" style="padding:20px;">
        </div>
    </div>
    </br>
    <div id="reftt">
        <div title="关联任务通知" style="padding:20px;">
            <div>
                <table id="qresult"></table>
            </div>
        </div>
        <div title="关联任务查询" style="padding:20px;">
        </div>
        <div title="关联任务帮助" style="padding:20px;">
        </div>
    </div>
</div>
<div class="mainspace">

</div>
<div id="win" class="easyui-window" closed="true" modal="true" title="型号产品结构查看窗口" style="width:800px;height:400px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <table cellpadding="4" cellspacing="0" width=100% class="prjwin">
                <tr>
                    <td width="80"></td>
                    <td width="140">型号产品：</td>
                    <td>xxx-001</td>
                </tr>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/static/images/man.gif"></td>
                    <td>项目负责人</td>
                    <td>张三</td>
                </tr>
                <tr>
                    <td></td>
                    <td>总设计师：</td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>总指挥：</td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>参加团队：</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/static/images/man.gif"> <img
                            src="${pageContext.request.contextPath}/static/images/man.gif"> <img src="${pageContext.request.contextPath}/static/images/man.gif">
                        <img src="${pageContext.request.contextPath}/static/images/man.gif">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>需求方：</td>
                    <td>甲机构</td>
                </tr>
                <tr>
                    <td></td>
                    <td>需求说明书：</td>
                    <td><a href="#">需求说明书01</a> <a href="#">需求说明书02</a> <a href="#">需求说明书03</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>进度情况：</td>
                    <td>
                        <div style="width:160px;background:#fff;border:1px solid #ccc">
                            <div style="float:left;width:100px;background:red">60%</div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="viwclose()">确定</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>
<div id="pw" class="easyui-window" closed="true" modal="true" title="型号产品结构定义" style="width:660px;height:430px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <div id="source" style="border:1px solid #ccc;width:300px;height:320px;float:left;margin:5px;">
                <div style="height:20px;font-weight:bold;padding:4px;border-bottom:1px solid #ccc;background:#ededed">型号产品结构系统选择</div>
                <div id="d1" class="drag">气动系统</div>
                <div id="d2" class="drag">推进系统</div>
                <div id="d3" class="drag">重量</div>
                <div id="d4" class="drag">飞行性能</div>
                <div id="d5" class="drag">品质要素与发射平台集成</div>
            </div>
            <div id="target" style="border:1px solid #ccc;width:300px;height:320px;float:left;margin:5px;">
                <div style="height:20px;font-weight:bold;padding:4px;border-bottom:1px solid #ccc;background:#ededed">定义本型号产品型号结构</div>
            </div>
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="cclose()">确定</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>




