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
                            text:'保存优化流程'
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
                    title:'优化参数模型',
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
        <div title="FMC优化流程模型定义" style="padding:10px;">
            <div style="border: #999 solid 1px;padding:4px 0;background: #EEE">优化流程</div>
            <br/>
            <img src="${pageContext.request.contextPath}/static/images/ansflow.png">
        </div>

        <div title="FMC优化流程备注信息" style="padding:10px;">
            <textarea name="message" style="width:98%;height:200px;"></textarea>
        </div>
    </div>
    <br/>

    <div id="ptt">
        <div title="FMC优化流程节点" style="padding:10px;text-align: center">
            <div class="tabui">
                <ul>
                    <li>
                        <span class="a" style="padding:4px 0;background:#EEE">序号</span>
                        <span class="n" style="padding:4px 0;background:#EEE">优化类型</span>
                        <span class="a" style="padding:4px 0;background:#EEE">附件</span>
                        <span class="n" style="padding:4px 0;background:#EEE">轻量级查看</span>
                    </li>
                    <li>
                        <span class="a">1</span>
                        <span class="n">优化计算A</span>
                        <span class="a">CAD</span>
                        <span class="n"><a href="#">优化计算A说明规范</a></span>
                        <span class="n"><button onclick="cad()">模型查看</button></span>
                    </li>
                    <li>
                        <span class="a">2</span>
                        <span class="n">优化计算B</span>
                        <span class="a">CAE</span>
                        <span class="n"><a href="#">优化计算A说明规范</a></span>
                        <span class="n"><button onclick="cae()">模型查看</button></span>
                    </li>
                    <li>
                        <span class="a">3</span>
                        <span class="n">优化计算C</span>
                        <span class="a">CAE</span>
                        <span class="n"><a href="#">优化计算A说明规范</a></span>
                        <span class="n"><button onclick="cae()">模型查看</button></span>
                    </li>
                    <li>
                        <span class="a">4</span>
                        <span class="n">优化计算D</span>
                        <span class="a">CAE</span>
                        <span class="n"><a href="#">优化计算A说明规范</a></span>
                        <span class="n"><button onclick="cae()">模型查看</button></span>
                    </li>
                    <li>
                        <span class="a">5</span>
                        <span class="n">优化计算E</span>
                        <span class="a">Ansys</span>
                        <span class="n"><a href="#">优化计算A说明规范</a></span>
                        <span class="n"><button onclick="ansys()">模型查看</button></span>
                    </li>
                </ul>
            </div>
        </div>
        <div title="优化参数模型" style="padding:10px;">
            <table id="presult"></table>
        </div>
    </div>
</div>