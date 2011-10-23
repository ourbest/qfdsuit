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
                            iconCls:'icon-save',
                            text:'保存设计过程',
                            handler: function() {
                                alert("型号设计过程已保存");
                            }
                        },
                        {
                            iconCls:'icon-redo',
                            text:'IPT团队',
                            handler: function() {
                                location.href = "${pageContext.request.contextPath}/mgr/demx/orgipt";
                            }
                        },
                        {
                            iconCls:'icon-reload',
                            text:'项目计划',
                            handler: function() {
                                location.href = "${pageContext.request.contextPath}/mgr/demx/prjview";
                            }
                        },
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]});
        $("#ttt").tabs({
                    tools:[
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]});
        $("#stt").tabs({
                    tools:[
                        {
                            iconCls:'icon-add',
                            text:'增加方案'
                        },
                        {
                            iconCls:'icon-remove',
                            text:'删除方案'
                        },
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
                            {field:'name',title:'设计内容',width:100,
                                formatter:function(value, rec) {
                                    return ''
                                }
                            },
                            {field:'value',title:'执行人',width:200,
                                formatter:function(value, rec) {
                                    return '';
                                }
                            },
                            {field:'sk',title:'设计指标模型模型',width:200,
                                formatter:function(value, rec) {
                                    return '<button onclick="dmod()">指标模型</button> <button onclick="dref()">指标关联</button>'
                                }
                            },
                            {field:'value',title:'执行时间',width:200,
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
    function dmod() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/dmod";
    }
    function dref() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/dref";
    }
</script>
<div class="mainspace">
    <div id="tt" style="">
        <div title="构建设计过程模型" style="padding:10px;">
            <div>
                <div style="float:left;width:220px">
                    <div class="easyui-panel" title="可定义设计阶段列表" collapsible="true" minimizable="false" maximizable=true closable="false"
                         style="padding:10px;background:#fafafa;">
                        <div id="p" class="draw">
                            <ul>
                                <li class="drag">1.型号管理</li>
                                <li class="drag">2.方案设计</li>
                                <li class="drag">3.指标设计</li>
                                <li class="drag">4.多学科验证</li>
                                <li class="drag">5.方案优化</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div style="float:right;width:860px;text-align:center">
                    <div id="ttt" style="">
                        <div title="构建设计过程模型" style="padding:10px;">
                            <img src="${pageContext.request.contextPath}/static/images/flowc1.png">
                            <img src="${pageContext.request.contextPath}/static/images/downarr.png">
                        </div>
                    </div>
                    <div id="stt" style="">
                        <div title="方案-1" style="padding:10px;">
                            <img src="${pageContext.request.contextPath}/static/images/flowc2.png">
                            <img src="${pageContext.request.contextPath}/static/images/downarr.png">
                            <img src="${pageContext.request.contextPath}/static/images/flowc3.png">
                            <img src="${pageContext.request.contextPath}/static/images/downarr.png">
                            <img src="${pageContext.request.contextPath}/static/images/flowc4.png">
                            <img src="${pageContext.request.contextPath}/static/images/downarr.png">
                            <img src="${pageContext.request.contextPath}/static/images/flowc5.png">
                        </div>
                        <div title="方案-2" style="padding:10px;"></div>
                        <div title="方案-3" style="padding:10px;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div title="设计过程节点" style="padding:10px;">
            <div style="margin: 0 auto">
                <table id="org"></table>
            </div>
        </div>
        <div title="设计过程备注信息" style="padding:10px;">
            <textarea name="message" style="width:98%;height:200px;"></textarea>
        </div>
        <div title="设计过程构建帮助" style="padding:10px;">
        </div>
    </div>
    <br/>
</div>