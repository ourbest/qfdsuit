<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
    $(function() {
        $("#tt").tabs({
                    tools:[
                        {
                            iconCls:'icon-save',
                            text:'调整分析流程',
                            handler: function() {
                                location.href = "${pageContext.request.contextPath}/mgr/demx/daflow";
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
                            text:'保存参数'
                        },
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]});
        $('.presult').datagrid({
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
            <div style="float:left">
                <div style="border: #999 solid 1px;padding:4px 0;background: #EEE">分析流程</div>
                <br/>
                <img src="${pageContext.request.contextPath}/static/images/ansflow.png">
            </div>
            <div style="float:right;">
                <button style="width:200px;height: 60px">运行分析流程</button>
                <p></p>
                <button style="width:200px;height: 60px">查看分析结果</button>
            </div>
        </div>
        <div title="分析结果查询" style="padding:10px;">
            <table class="presult"></table>
        </div>
        <div title="分析流程备注信息" style="padding:10px;">
            <textarea name="message" style="width:98%;height:200px;"></textarea>
        </div>
        <div title="分析流程定义帮助" style="padding:10px;">
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
            <table class="presult"></table>
        </div>
    </div>
</div>