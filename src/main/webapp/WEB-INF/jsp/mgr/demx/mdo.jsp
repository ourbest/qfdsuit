<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
    $(function() {
        $("#gtt").tabs();
        $("#tt").tabs({
                    tools:[
                        {
                            iconCls:'icon-search',
                            text:'型号查询',
                            handler: function() {
                                alert('查询');
                            }
                        }
                    ]});
        $('#kresult').datagrid({
                    title:'型号优化分析',
                    url:'${pageContext.request.contextPath}/ajax/demx/product_data',
                    sortName: 'kind',
                    remoteSort: false,
                    fitColumns: true,
                    idField:'code',
                    frozenColumns:[
                        [
                            {field:'ck',checkbox:true},
                            {title:'编码',field:'code',width:60,sortable:true}
                        ]
                    ],
                    columns:[
                        [
                            {title:'型号产品基本信息',colspan:4},
                            {field:'proc',title:'研发进度',width:120,align:'center', rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<div style="width:80%;background:#fff;border:1px solid #ccc">' +
                                                '<div style="float:left;width:' + value + '%;background:red">' + value + '%' + '</div>'
                                        '</div>';
                                    }
                                }
                            },
                            {field:'opt',title:'型号创建',width:150,align:'center', rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<button onClick="viewprj();">型号详情</button> <button onClick="goprj();">优化分析</button>';
                                    }
                                }
                            }
                        ],
                        [
                            {field:'putname',title:'型号名称代号',width:160,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<a href="#" onclick="showp()">' + value + '</a>';
                                    }
                                }
                            },
                            {field:'actor',title:'IPT团队',width:100,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<a href="#" onclick="showipt()"><img src="${pageContext.request.contextPath}/static/images/icon/userm32.png" style="border:0;height:16px"></a>';
                                    }
                                }
                            },
                            {field:'cata',title:'研发状态',width:100,rowspan:2},
                            {field:'flow',title:'设计流程',width:150,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<button onClick="flow();">设计过程模型</button>';
                                    }
                                }
                            }
                        ]
                    ],
                    rownumbers:true
                });
    });
    function viewprj() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/pview";
    }
    function goprj() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/dmdo";
    }

    function create() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/dmdo";
    }

    function showp() {
        $("#mv").show();
    }

    function showipt() {
        $("#ipt").window('open');
    }

    function flow() {
        $("#flow").window('open');
    }
</script>

<div class="mainspace">
    <div id="tt" style="">
        <div title="当前型号优化分析" style="padding:10px;">
            <div class="srch">
                输入型号代码或名称快速转到相应型号
            </div>
            <div class="srchcxt">
                <div style="height:40px">
                    <input type="text" value="输入型号名称" style="width:400px;height:30px">
                    <button class="prjs">转到型号</button>
                    <button class="prjs" onclick="create()">型号优化分析</button>
                </div>
            </div>
            <br/>
            <table id="kresult"></table>
            <br/>
        </div>
        <div title="型号高级查询" style="padding:10px;">
            <div class="srch">
                输入型号代码或名称快速转到相应型号
            </div>
            <div class="srchcxt">
                <div style="height:40px">
                    <input type="text" value="输入型号名称" style="width:400px;height:30px">
                    <button class="prjs">转到型号</button>
                    <button class="prjs" onclick="create()">型号优化分析</button>
                </div>
            </div>
            <br/>
        </div>
        <div title="型号优化分析帮助" style="padding:10px;">
        </div>
    </div>
</div>

<div id="mv" class="mainspace" style="display:none;">
    <div class="srch">
        型号产品概要信息创建
    </div>
    <div class="srchcxt">
        <table cellpadding="4" cellspacing="0" class="prjwin">
            <tr>
                <td width="80"></td>
                <td width="140">型号产品：</td>
                <td><input type="text" value="xxx-001" style="width:400px"></td>
                <td></td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/static/images/man.gif"></td>
                <td>项目负责人</td>
                <td><select style="width:400px">
                    <option checked>张三</option>
                    <option value="">李四</option>
                    <option value="">王二</option>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>总指挥：</td>
                <td><select style="width:400px">
                    <option checked>张三</option>
                    <option value="">李四</option>
                    <option value="">王二</option>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>总设计师：</td>
                <td><select style="width:400px">
                    <option checked>张三</option>
                    <option value="">李四</option>
                    <option value="">王二</option>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>参加设计师：</td>
                <td>
                    <input type="checkbox"><img src="${pageContext.request.contextPath}/static/images/man.gif">
                    <input type="checkbox"><img src="${pageContext.request.contextPath}/static/images/man.gif">
                    <input type="checkbox"><img src="${pageContext.request.contextPath}/static/images/man.gif">
                    <input type="checkbox"><img src="${pageContext.request.contextPath}/static/images/man.gif">

                </td>
                <td>
                    <button>增加设计师</button>
                    <br/>
                    <button>移除设计师</button>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>需求方联系人：</td>
                <td><select style="width:400px">
                    <option checked>甲方A</option>
                    <option value="">甲方B</option>
                    <option value="">甲方C</option>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>需求说明书：</td>
                <td><input type="file" style="width: 200px"></td>
                <td></td>
            </tr>
        </table>
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

<div id="flow" class="easyui-window" closed="true" modal="true" title="型号设计过程模型" style="width:640px;height:480px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <div style="margin:0 auto;text-align: center">
                <img src="${pageContext.request.contextPath}/static/images/mgrchart.png" style="width:580px">
            </div>
            <div id="gtt" style="">
                <div title="方案一" style="padding:10px;">
                    <img src="${pageContext.request.contextPath}/static/images/flowchart.png" style="width:580px">
                </div>
                <div title="方案二" style="padding:10px;">
                    <img src="${pageContext.request.contextPath}/static/images/flowchart.png" style="width:580px">
                </div>
                <div title="方案三" style="padding:10px;">
                    <img src="${pageContext.request.contextPath}/static/images/flowchart.png" style="width:580px">
                </div>
            </div>
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="viwclose()">详细过程</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>



