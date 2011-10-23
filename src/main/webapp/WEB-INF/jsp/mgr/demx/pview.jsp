<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
    $(function() {
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
                            iconCls:'icon-add',
                            text:'新增附件'
                        },
                        {
                            iconCls:'icon-remove',
                            text:'删除附件'
                        },
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
                            },
                            {field:'mk',title:'上载附件',width:200,
                                formatter:function(value, rec) {
                                    return '<button>+</button> <button>-</button>'
                                }
                            }
                        ]
                    ]
                });
    });
    function orgipt() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/orgipt";
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
        <div title="构建新型号" style="padding:10px;">
            <table cellpadding="4" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <a class="button" href="#" onclick="save()"><span>保存型号项目</span></a>
                        <a class="button" href="#" onclick="orgipt()"><span>组织IPT团队</span></a>
                        <a class="button" href="#" onclick="dflow()"><span>定义设计过程</span></a>
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
        <div title="构建型号相关内容" style="padding:10px;">
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

