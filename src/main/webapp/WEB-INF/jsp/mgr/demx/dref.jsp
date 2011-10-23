<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
$(function() {
    $("#tt").tabs({
                tools:[
                    {
                        iconCls:'icon-save',
                        text:'保存指标关联',
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
                        iconCls:'icon-add',
                        text:'增加关联'
                    },
                    {
                        iconCls:'icon-save',
                        text:'保存关联'
                    },
                    {
                        iconCls:'icon-search',
                        text:'查询指标'
                    },
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
    $('#kresult').datagrid({
                url:'${pageContext.request.contextPath}/ajax/demx/dcell_data',
                sortName: 'kind',
                remoteSort: false,
                fitColumns: true,
                idField:'code',
                frozenColumns:[
                    [
                        {title:'编码',field:'code',width:60,sortable:true}
                    ]
                ],
                columns:[
                    [
                        {field:'parname',title:'指标名称',width:160,align:'center', rowspan:2},
                        {field:'pvalue',title:'指标值',width:120,align:'center', rowspan:2},
                        {field:'base',title:'指标基准',width:120,align:'center', rowspan:2},
                        {field:'actor',title:'指标权重',width:80,
                            formatter:function(value, rec) {
                                if (value != null) {
                                    return '<img src="${pageContext.request.contextPath}/static/images/icon/star32.png" style="border:0;height:16px">';
                                }
                            }
                        },
                        {field:'opt',title:'参数模型',width:150,
                            formatter:function(value, rec) {
                                if (value != null) {
                                    return '<button onClick="params();">参数模型</button>';
                                }
                            }
                        },
                        {field:'flow',title:'分析流程',width:150,
                            formatter:function(value, rec) {
                                if (value != null) {
                                    return '<button onClick="anflow();">设计流程</button>';
                                }
                            }
                        },
                        {field:'rd',title:'选择指标',width:150,
                            formatter:function(value, rec) {
                                return '<input type="radio">';
                            }
                        },
                    ]
                ],
                rownumbers:true
            });
    $('#uresult').datagrid({
                url:'${pageContext.request.contextPath}/ajax/demx/ucell_data',
                sortName: 'kind',
                remoteSort: false,
                fitColumns: true,
                idField:'code',
                frozenColumns:[
                    [
                        {title:'编码',field:'code',width:60,sortable:true}
                    ]
                ],
                columns:[
                    [
                        {field:'parname',title:'指标名称',width:160,align:'center', rowspan:2},
                        {field:'pvalue',title:'指标值',width:120,align:'center', rowspan:2},
                        {field:'base',title:'指标基准',width:120,align:'center', rowspan:2},
                        {field:'imp',title:'指标权重',width:80,
                            formatter:function(value, rec) {
                                if (value != null) {
                                    return '<img src="${pageContext.request.contextPath}/static/images/icon/star32.png" style="border:0;height:16px">';
                                }
                            }
                        },
                        {field:'opt',title:'参数模型',width:150,
                            formatter:function(value, rec) {
                                if (value != null) {
                                    return '<button onClick="params();">参数模型</button>';
                                }
                            }
                        },
                        {field:'flow',title:'分析流程',width:150,
                            formatter:function(value, rec) {
                                if (value != null) {
                                    return '<button onClick="anflow();">设计流程</button>';
                                }
                            }
                        },
                        {field:'actor',title:'选择关联',width:150,
                            formatter:function(value, rec) {
                                return '<input type="checkbox">';
                            }
                        }
                    ]
                ],
                rownumbers:true
            });
    $('#dresult').datagrid({
                url:'${pageContext.request.contextPath}/ajax/demx/dcell_data',
                sortName: 'kind',
                remoteSort: false,
                fitColumns: true,
                idField:'code',
                frozenColumns:[
                    [
                        {title:'编码',field:'code',width:60,sortable:true}
                    ]
                ],
                columns:[
                    [
                        {field:'parname',title:'指标名称',width:160,align:'center', rowspan:2},
                        {field:'pvalue',title:'指标值',width:120,align:'center', rowspan:2},
                        {field:'base',title:'指标基准',width:120,align:'center', rowspan:2},
                        {field:'imp',title:'指标权重',width:80,
                            formatter:function(value, rec) {
                                if (value != null) {
                                    return '<img src="${pageContext.request.contextPath}/static/images/icon/star32.png" style="border:0;height:16px">';
                                }
                            }
                        },
                        {field:'opt',title:'参数模型',width:150,
                            formatter:function(value, rec) {
                                if (value != null) {
                                    return '<button onClick="params();">参数模型</button>';
                                }
                            }
                        },
                        {field:'flow',title:'分析流程',width:150,
                            formatter:function(value, rec) {
                                if (value != null) {
                                    return '<button onClick="anflow();">分析流程</button>';
                                }
                            }
                        },
                        {field:'actor',title:'联系责任人',width:150,
                            formatter:function(value, rec) {
                                if (value != null) {
                                    return '<button onClick="anflow();">' + value + '</button>';
                                }
                            }
                        }
                    ]
                ],
                rownumbers:true
            });
});
</script>
<div class="mainspace">
    <div id="tt" style="">
        <div title="指标关联模型定义" style="padding:10px;">
            <div style="margin: 0 auto;">
                <table id="mod"></table>
            </div>
            <br/>

            <div id="mtt" style="">
                <div title="指标关联关系构建" style="padding:10px;">
                    <div style="margin: 0 auto;">
                        <table id="kresult"></table>
                        <br/>

                        <div class="srchcxt" style="border-top: #666 solid 1px">
                            <div style="height:40px">
                                <input type="text" value="输入型号名称" style="width:400px;height:30px">
                                <button class="prjs">查询指标模型</button>
                                <button class="prjs" onclick="showprj()">任务树中选取指标模型</button>
                            </div>
                        </div>
                        <br/>
                        <table id="uresult"></table>
                    </div>
                </div>
                <div title="指标关联地图" style="padding:10px;">
                    <div style="margin: 0 auto; text-align: center">
                        <img src="${pageContext.request.contextPath}/static/images/cellmap.png" style="border:0;">
                    </div>
                </div>
                <div title="参考已有模型" style="padding:10px;">
                </div>
            </div>
        </div>
        <div title="关联备注信息" style="padding:10px;">
            <textarea name="message" style="width:98%;height:200px;"></textarea>
        </div>
        <div title="指标关联定义帮助" style="padding:10px;">
        </div>
    </div>
    <br/>
</div>