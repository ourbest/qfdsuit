<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
    $(function() {
        $("#gtt").tabs();
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
        $("#mtt").tabs({
                    tools:[
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]});
        $('#prtinfo').propertygrid({
                    width:700,
                    height:'auto',
                    url:'${pageContext.request.contextPath}/ajax/demx/prtinfo_data',
                    showGroup:true,
                    scrollbarSize:0,
                    columns:[
                        [
                            {field:'name',title:'项目名称',width:200},
                            {field:'value',title:'项目内容',width:500}

                        ]
                    ]
                });
        $('#attach').propertygrid({
                    height:'auto',
                    url:'${pageContext.request.contextPath}/ajax/demx/prtatt_data',
                    scrollbarSize:0,
                    columns:[
                        [
                            {field:'ck',width:80,checkbox:true},
                            {field:'name',title:'附件名称',width:100,
                                formatter:function(value, rec) {
                                    return '附件文件'
                                }
                            },
                            {field:'value',title:'附件文件',width:500,
                                formatter:function(value, rec) {
                                    return '附件文件'
                                }
                            }
                        ]
                    ]
                });
    });
    function req() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/techresult";
    }
    function ds() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/subpg";
    }
    function dv() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/techvalid";
    }
    function mdo() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/dmdo";
    }
</script>
<div class="mainspace">
    <div id="tt" style="">
        <div title="型号案例" style="padding:10px;">
            <table cellpadding="4" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <a class="button" href="#" onclick="req()"><span>需求分析报告</span></a>
                        <a class="button" href="#" onclick="ds()"><span>方案设计报告</span></a>
                        <a class="button" href="#" onclick="dv()"><span>指标验证报告</span></a>
                        <a class="button" href="#" onclick="mdo()"><span>方案优化报告</span></a>
                    </td>
                </tr>
            </table>
            <br/>

            <div style="margin: 0 20px 0 0">
                <div style="float:left">
                    <table id="prtinfo"></table>
                </div>
                <div style="float:right;width:360px;height:120px">
                    <img src="${pageContext.request.contextPath}/static/images/missle.png">
                </div>
            </div>
        </div>
        <div title="IPT团队视图" style="padding:10px;">
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
        <div title="设计过程视图" style="padding:10px;">
            <div style="margin:0 auto;text-align: center">
                <img src="${pageContext.request.contextPath}/static/images/mgrchart.png" style="width:580px">
            </div>
            <div id="gtt" style="">
                <div title="方案一" style="padding:10px;text-align: center">
                    <img src="${pageContext.request.contextPath}/static/images/flowchart.png" style="width:580px">
                </div>
                <div title="方案二" style="padding:10px;text-align: center">
                    <img src="${pageContext.request.contextPath}/static/images/flowchart.png" style="width:580px">
                </div>
                <div title="方案三" style="padding:10px;text-align: center">
                    <img src="${pageContext.request.contextPath}/static/images/flowchart.png" style="width:580px">
                </div>
            </div>
        </div>
        <div title="型号设计相关内容" style="padding:10px;">
        </div>
    </div>
    <br/>

    <div id="att" style="">
        <div title="型号需求任务书" style="padding:10px;">
            <div style="margin: 0 20px 0 0">
                <table id="attach"></table>
            </div>
        </div>
        <div title="需求任务书相关备注" style="padding:10px;">
        </div>
    </div>
    <br/>

    <div id="mtt" style="">
        <div title="型号备注信息" style="padding:10px;">
            <textarea name="message" style="width:98%;height:60px;"></textarea>
        </div>
    </div>
</div>

