<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
$(function() {
    $("#tt").tabs({
                tools:[
                    {
                        iconCls:'icon-save',
                        text:'保存指标模型',
                        handler: function() {
                            alert("型号设计过程已保存");
                        }
                    },
                    {
                        iconCls:'icon-back',
                        text:'返回',
                        handler: function() {
                            location.href = "${pageContext.request.contextPath}/mgr/demx/dflow";
                        }
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
    $('#mod').datagrid({
                title:'设计任务',
                url:'${pageContext.request.contextPath}/ajax/demx/modone_data',
                columns:[
                    [
                        {field:'name',title:'设计内容',width:200,
                            formatter:function(value, rec) {
                                return ''
                            }
                        },
                        {field:'value',title:'执行人',width:100,
                            formatter:function(value, rec) {
                                return ''
                            }
                        },
                        {field:'mt',title:'设计任务',width:120,
                            formatter:function(value, rec) {
                                return ''
                            }
                        },
                        {field:'mp',title:'执行时间',width:120,
                            formatter:function(value, rec) {
                                return ''
                            }
                        }
                    ]
                ],
                rownumbers:true
            });

    $('.vmod').datagrid({
                toolbar:[
                    {
                        text:'增加属性',
                        iconCls:'icon-add'
                    },
                    '-',
                    {
                        text:'删除属性',
                        iconCls:'icon-remove'
                    },
                    '-',
                    {
                        text:'保存修改',
                        iconCls:'icon-save'
                    }
                ],
                title:'设计任务',
                showGroup:true,
                url:'${pageContext.request.contextPath}/ajax/demx/vmod_data',
                columns:[
                    [
                        {field:'name',title:'指标属性名称',width:140,
                            formatter:function(value, rec) {
                                return value
                            }
                        },
                        {field:'value',title:'值属性',width:140,
                            formatter:function(value, rec) {
                                return ''
                            }
                        }
                    ]
                ],
                rownumbers:true
            });
    $('.hmod').datagrid({
                toolbar:[
                    {
                        text:'增加项目',
                        iconCls:'icon-add'
                    },
                    '-',
                    {
                        text:'删除项目',
                        iconCls:'icon-remove'
                    },
                    '-',
                    {
                        text:'保存修改',
                        iconCls:'icon-save'
                    }
                ],
                title:'设计任务',
                url:'${pageContext.request.contextPath}/ajax/demx/hmod_data',
                columns:[
                    [
                        {field:'name',title:'指标项目名称',width:160,
                            formatter:function(value, rec) {
                                return value
                            }
                        },
                        {field:'value',title:'权重',width:100,
                            formatter:function(value, rec) {
                                return ''
                            }
                        },
                        {field:'mt',title:'是否共享',width:80,
                            formatter:function(value, rec) {
                                return ''
                            }
                        },
                        {field:'mp',title:'验证流程',width:80,
                            formatter:function(value, rec) {
                                return '<span><img src="${pageContext.request.contextPath}/static/images/flow.png" onclick="daflow()"></span>'
                            }
                        }
                    ]
                ],
                rownumbers:true
            });
    $('#tmod').treegrid({
                title:'发动机技术规格表',
                nowrap:false,
                rownumbers:true,
                animate:true,
                colapsible:true,
                url:'${pageContext.request.contextPath}/ajax/xfmc/tjtv_data',
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
                        {field:'direction',title:'改进方向',width:100, rowspan:2},
                        {field:'techImport',title:'技术特性重要度',width:100, rowspan:2},
                        {field:'referPro',title:'参考产品',width:100, rowspan:2},
                        {field:'targetVal',title:'目标值',width:100, rowspan:2},
                        {field:'unit',title:'单位',width:100, rowspan:2},
                        {field:'opt',title:'分析流程',width:120,rowspan:2,
                            formatter:function(value, rec) {
                                return '<span><img src="${pageContext.request.contextPath}/static/images/flow.png" onclick="daflow()"></span>';
                            }
                        },
                        {field:'vt',title:'验证结果',width:100, rowspan:2},
                        {field:'vt',title:'结果比较',width:100, rowspan:2}
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
                },
                rownumbers:true
            });
});
function daflow() {
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
</script>
<div class="mainspace">
    <div id="tt" style="">
        <div title="指标参数模型定义" style="padding:10px;">
            <div style="margin: 0 auto;">
                <table id="mod"></table>
            </div>
            <br/>

            <div id="mtt" style="">
                <div title="指标模型构建" style="padding:10px;">
                    <div style="margin: 0 auto;float:left;width:360px">
                        <table class="vmod"></table>
                    </div>
                    <div style="margin: 0 auto;float:left;width:200px;text-align:center;">
                        <img src="${pageContext.request.contextPath}/static/images/add.png">
                    </div>
                    <div style="margin: 0 auto;float:left;width:500px">
                        <table class="hmod"></table>
                    </div>
                </div>
                <div title="指标模型结构预览" style="padding:10px;">
                    <div style="margin: 0 auto;">
                        <table id="tmod"></table>
                    </div>
                </div>
                <div title="参考已有模型" style="padding:10px;">
                    <div style="margin: 0 auto;float:left;width:360px">
                        <table class="vmod"></table>
                    </div>
                    <div style="margin: 0 auto;float:left;width:200px;text-align:center;">
                        <img src="${pageContext.request.contextPath}/static/images/add.png">
                    </div>
                    <div style="margin: 0 auto;float:left;width:500px">
                        <table class="hmod"></table>
                    </div>
                </div>
            </div>
        </div>
        <div title="参数备注信息" style="padding:10px;">
            <textarea name="message" style="width:98%;height:200px;"></textarea>
        </div>
        <div title="指标参数定义帮助" style="padding:10px;">
        </div>
    </div>
    <br/>
</div>