<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
    $(function() {
        $("#tt").tabs({
                    tools:[
                        {
                            iconCls:'icon-more',
                            text:'转到设计过程'
                        },
                        {
                            iconCls:'icon-search',
                            text:'设计团队(IPT)'
                        }
                    ]});
        $("#gtt").tabs({
                    tools:[
                        {
                            iconCls:'icon-remove',
                            text:'取消方案'
                        },
                        {
                            iconCls:'icon-add',
                            text:'增加方案'
                        },
                        {
                            iconCls:'icon-save',
                            text:'保存项目修改'
                        }
                    ]});
    });
    function viwclose() {
        $('#win').window('close');
    }
    function showprj() {
        $('#win').window('open');
    }
</script>
<div class="mainspace">
    <div id="tt" style="">
        <div title="型号项目管理" style="padding:10px;">
            <div class="srch">
                输入型号代码或名称快速转到相应型号
            </div>
            <div class="srchcxt">
                <div style="height:40px">
                    <input type="text" value="输入型号名称" style="width:400px;height:30px">
                    <button class="prjs">转到型号</button>
                    <button class="prjs" onclick="showprj()">本型号项目信息</button>
                </div>
            </div>
            <br/>

            <div id="gtt" style="">
                <div title="方案一" style="padding:10px;">
                    <img src="${pageContext.request.contextPath}/static/images/gantt.png">
                </div>
                <div title="方案二" style="padding:10px;">
                    <img src="${pageContext.request.contextPath}/static/images/gantt.png">
                </div>
                <div title="方案三" style="padding:10px;">
                    <img src="${pageContext.request.contextPath}/static/images/gantt.png">
                </div>
            </div>
        </div>
        <div title="相关型号项目管理" style="padding:10px;">
            <div class="srch">
                输入型号代码或名称快速转到相应型号
            </div>
            <div class="srchcxt">
                <div style="height:40px">
                    <input type="text" value="输入型号名称" style="width:400px;height:30px">
                    <button class="prjs">转到型号</button>
                </div>
            </div>
            <br/>
        </div>
        <div title="项目管理帮助" style="padding:10px;">
        </div>
    </div>
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




