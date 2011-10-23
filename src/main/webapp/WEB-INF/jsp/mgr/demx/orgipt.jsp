<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
    $(function() {
        $('.drag').draggable({
                    proxy:'clone',
                    revert:true,
                    cursor:'auto',
                    onStartDrag:function() {
                        $(this).draggable('options').cursor = 'not-allowed';
                        $(this).draggable('proxy').addClass('dp');
                    },
                    onStopDrag:function() {
                        $(this).draggable('options').cursor = 'auto';
                    }
                });
        $("#tt").tabs({
                    tools:[
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]});
        $("#att").tabs({
                    tools:[
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]});
        $('#org').propertygrid({
                    height:'auto',
                    showGroup:true,
                    url:'${pageContext.request.contextPath}/ajax/demx/ipt_data',
                    columns:[
                        [
                            {field:'ck',width:80,checkbox:true},
                            {field:'name',title:'姓名',width:100,
                                formatter:function(value, rec) {
                                    return ''
                                }
                            },
                            {field:'value',title:'岗位',width:200,
                                formatter:function(value, rec) {
                                    return ''
                                }
                            },
                            {field:'sk',title:'专业',width:200,
                                formatter:function(value, rec) {
                                    return ''
                                }
                            },
                            {field:'value',title:'参与状态',width:100,
                                formatter:function(value, rec) {
                                    return ''
                                }
                            },
                            {field:'mk',title:'操作',width:200,
                                formatter:function(value, rec) {
                                    return '<button>+</button> <button>-</button>'
                                }
                            }
                        ]
                    ],
                    rownumbers:true
                });
    });
    function prj() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/prjview";
    }
    function dflow() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/dflow";
    }
    function save() {
        alert("型号已保存");
    }
</script>
<div class="mainspace">
    <div id="tt" style="">
        <div title="构建IPT团队" style="padding:10px;">
            <table cellpadding="4" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <a class="button" href="#" onclick="save()"><span>保存团队项目</span></a>
                        <a class="button" href="#" onclick="dflow()"><span>构建设计过程</span></a>
                        <a class="button" href="#" onclick="prj()"><span>制定项目计划</span></a>
                    </td>
                </tr>
            </table>
            <br/>

            <div>
                <div style="float:left;width:220px">
                    <div class="easyui-panel" title="可定义IPT层次列表" collapsible="true" minimizable="false" maximizable=true closable="false"
                         style="padding:10px;background:#fafafa;">
                        <div  id="p" class="draw">
                            <ul>
                                <li class="drag">1.管理过程</li>
                                <li class="drag">2.需求分析</li>
                                <li class="drag">3.方案设计</li>
                                <li class="drag">4.指标设计与验证</li>
                                <li class="drag">5.方案优化</li>
                                <li class="drag">6.方案评估</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div style="float:right;width:860px;text-align:center">
                    <img src="${pageContext.request.contextPath}/static/images/orgc1.png">
                    <p/>
                    <img src="${pageContext.request.contextPath}/static/images/orgc2.png">
                    <p/>
                    <img src="${pageContext.request.contextPath}/static/images/orgc3.png">
                </div>
            </div>
        </div>
        <div title="IPT团队组织帮助" style="padding:10px;">
        </div>
    </div>
    <br/>

    <div id="att" style="">
        <div title="定义IPT人员" style="padding:10px;">
            <div style="margin: 0 20px 0 0">
                <table id="org"></table>
            </div>
        </div>
        <div title="组织备注信息" style="padding:10px;">
            <textarea name="message" style="width:98%;height:200px;"></textarea>
        </div>
    </div>
</div>

