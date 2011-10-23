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
                            text:'保存分析流程'
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
        $("#ptt").tabs({
                    tools:[
                        {
                            iconCls:'icon-save',
                            text:'保存参数模型'
                        },
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]});
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
</script>
<div class="mainspace">
    <div id="tt" style="">
        <div title="分析流程模型定义" style="padding:10px;">
            <div style="float:left;width:220px">
                <div class="easyui-panel" title="可定义设计阶段列表" collapsible="true" minimizable="false" maximizable=true closable="false"
                     style="padding:10px;background:#fafafa;">
                    <div id="p" class="draw">
                        <ul>
                            <li class="drag">开始</li>
                            <li class="drag">过程</li>
                            <li class="drag">结束</li>
                            <li class="drag">连接</li>
                            <li class="drag">传递</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div style="float:right;width: 800px">
                <div style="border: #999 solid 1px;padding:4px 0;background: #EEE">分析流程</div>
                <br/>
                <img src="${pageContext.request.contextPath}/static/images/ansflow.png">
            </div>
        </div>
        <div title="分析流程备注信息" style="padding:10px;">
            <textarea name="message" style="width:98%;height:200px;"></textarea>
        </div>
        <div title="引用分析模板" style="padding:10px;">
        </div>
    </div>
    <br/>

    <div id="ptt">
        <div title="分析流程节点" style="padding:10px;text-align: center">
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