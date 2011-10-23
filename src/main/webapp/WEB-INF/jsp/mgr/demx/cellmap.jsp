<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
$(function() {
    $("#gtt").tabs();
    $("#ptt").tabs();
    $("#tt").tabs({
                tools:[
                    {
                        iconCls:'icon-save',
                        text:'保存修改',
                        handler: function() {
                            alert('保存修改');
                        }
                    },
                    {
                        iconCls:'icon-ok',
                        text:'冻结指标',
                        handler: function() {
                            alert('冻结指标');
                        }
                    },
                    {
                        iconCls:'icon-add',
                        text:'新增指标',
                        handler: function() {
                            alert('新增指标');
                        }
                    },
                    {
                        iconCls:'icon-search',
                        text:'指标验证',
                        handler: function() {
                            alert('指标验证');
                        }
                    }
                ]});
    $('#kresult').datagrid({
                url:'${pageContext.request.contextPath}/ajax/demx/lcell_data',
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
                        }
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
    $('#presult').datagrid({
                title:'分析参数模型',
                url:'${pageContext.request.contextPath}/ajax/demx/param_data',
                sortName: 'scode',
                remoteSort: false,
                idField:'scode',
                frozenColumns:[
                    [
                        {title:'编码',field:'scode',width:80,sortable:true}
                    ]
                ],
                columns:[
                    [
                        {title:'可调整参数',colspan:6}
                    ],
                    [
                        {field:'sname',title:'参数名称',width:200},
                        {field:'stype',title:'参数类型',width:120,rowspan:2},
                        {field:'svalue',title:'参数值',width:100,rowspan:2},
                        {field:'sopt',title:'是否优化',width:100,rowspan:2},
                        {field:'sdown',title:'下限值',width:100,rowspan:2},
                        {field:'sup',title:'上限值',width:100,rowspan:2}
                    ]
                ],
                rownumbers:true
            });
});

function anflow() {
    $("#win").window("open");
}
function params() {
    $("#win").window("open");
}
</script>

<div class="mainspace">
    <div id="tt" style="">
        <div title="当前技术指标" style="padding:10px;">
            <table id="kresult"></table>
            <br/>
        </div>
        <div title="技术指标查询" style="padding:10px;">
            <div class="srch">
                输入技术指标代号或名称
            </div>
            <div class="srchcxt">
                <div style="height:40px">
                    <input type="text" value="输入指标代号或名称" style="width:400px;height:30px">
                    <button class="prjs">查询指标</button>
                </div>
            </div>
            <br/>
        </div>
        <div title="技术指标设计帮助" style="padding:10px;">
        </div>
    </div>
</div>

<div class="mainspace">
    <div id="gtt" style="">
        <div title="指标数据地图" style="padding:10px;">
            <div style="margin:0 auto;text-align: center">
                <img src="${pageContext.request.contextPath}/static/images/cellmap.png" style="border:0;">
            </div>
        </div>
        <div title="前关联指标" style="padding:10px;">
            <table id="uresult"></table>
        </div>
        <div title="后关联指标" style="padding:10px;">
            <table id="dresult"></table>
        </div>
    </div>
</div>

<div id="win" class="easyui-window" closed="true" modal="true" title="CAE模型查看" style="width:800px;height:500px;">
    <div class="easyui-layout" fit="true">

        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <div id="ptt">
                <div title="指标分析流程" style="padding:10px;text-align: center">
                    <div style="border: #999 solid 1px;padding:4px 0;background: #EEE">分析流程</div>
                    <br/>
                    <img src="${pageContext.request.contextPath}/static/images/ansflow.png">

                    <div class="clearfix"></div>
                    <br/>

                    <div class="tabui">
                        <ul>
                            <li>
                                <span class="a" style="padding:4px 0;background:#EEE">序号</span>
                                <span class="n" style="padding:4px 0;background:#EEE">程序名称</span>
                                <span class="a" style="padding:4px 0;background:#EEE">分类</span>
                                <span class="n" style="padding:4px 0;background:#EEE">说明</span>
                                <span class="n" style="padding:4px 0;background:#EEE">测试相关</span>
                                <span class="n" style="padding:4px 0;background:#EEE">责任人</span>
                            </li>
                            <li>
                                <span class="a">1</span>
                                <span class="n">分析计算A</span>
                                <span class="a">总体</span>
                                <span class="n"><a href="#">分析计算A说明规范</a></span>
                                <span class="n"><button>测试数据模型</button></span>
                                <span class="n"><a href="#">责任人</a></span>
                            </li>
                            <li>
                                <span class="a">2</span>
                                <span class="n">分析计算B</span>
                                <span class="a">总体</span>
                                <span class="n"><a href="#">分析计算A说明规范</a></span>
                                <span class="n"><button>测试数据模型</button></span>
                                <span class="n"><a href="#">责任人</a></span>
                            </li>
                            <li>
                                <span class="a">3</span>
                                <span class="n">分析计算C</span>
                                <span class="a">总体</span>
                                <span class="n"><a href="#">分析计算A说明规范</a></span>
                                <span class="n"><button>测试数据模型</button></span>
                                <span class="n"><a href="#">责任人</a></span>
                            </li>
                            <li>
                                <span class="a">4</span>
                                <span class="n">分析计算D</span>
                                <span class="a">总体</span>
                                <span class="n"><a href="#">分析计算A说明规范</a></span>
                                <span class="n"><button>测试数据模型</button></span>
                                <span class="n"><a href="#">责任人</a></span>
                            </li>
                            <li>
                                <span class="a">5</span>
                                <span class="n">分析计算E</span>
                                <span class="a">总体</span>
                                <span class="n"><a href="#">分析计算A说明规范</a></span>
                                <span class="n"><button>测试数据模型</button></span>
                                <span class="n"><a href="#">责任人</a></span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div title="指标参数模型" style="padding:10px;">
                    <table id="presult"></table>
                </div>
            </div>
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="viwclose()">确定</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>
