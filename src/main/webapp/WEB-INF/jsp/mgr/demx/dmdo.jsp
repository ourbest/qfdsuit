<script>
    $(function() {
        $("#tt").tabs();
        $("#sst").tabs();
        $("#stt").tabs({
                    tools:[
                        {
                            iconCls:'icon-add',
                            text:'增加指标'
                        },
                        {
                            iconCls:'icon-remove',
                            text:'注销指标'
                        },
                        {
                            iconCls:'icon-save',
                            text:'保存指标'
                        },
                        {
                            iconCls:'icon-search',
                            text:'版本视图'
                        },
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]
                });
        $('#kresult').datagrid({
                    title:'总体优化指标',
                    url:'/ajax/xfmc/techvalid_data',
                    nowrap: false,
                    striped: true,
                    frozenColumns:[
                        [
                            {field:'ck',checkbox:true},
                            {title:'编码',field:'code',width:80}
                        ]
                    ],
                    columns:[
                        [
                            {field:'standard',title:'基准导弹',width:120},
                            {field:'qualification',title:'技术指标',width:120,rowspan:2},
                            {field:'sk',title:'定义优化流程',width:100,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<button onclick="def()">定义优化流程</button>';
                                }
                            },
                            {field:'opts',title:'优化结果',width:200,rowspan:2},
                            {field:'opt',title:'指标优化',width:100,align:'center', rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<span><img src="${pageContext.request.contextPath}/static/images/flow.png" onclick="ih()"></span>';
                                    }
                                }
                            },
                            {field:'vk',title:'指标关联',width:100,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<button onclick="ref()">指标关联</button>';
                                }
                            },
                            {field:'omk',title:'版本比较',width:100,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<button onclick="vd()">版本比较</button>';
                                }
                            }
                        ]
                    ],
                    rownumbers:true
                });
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

    function ih() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/ansysflow";
    }
    function ref() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/daflow";
    }
    function vd() {
    }
    function def() {
        $.extend($.messager.defaults, {
                    ok:"自研流程",
                    cancel:"MDO流程"
                });
        $.messager.confirm('定义优化模板类型', '选择优化模板类型', function(r) {
            if (r) {
                location.href = "${pageContext.request.contextPath}/mgr/demx/daflow";
            }
            else {
                location.href = "${pageContext.request.contextPath}/mgr/demx/dmflow";
            }
        });
    }
</script>
<div class="mainspace">
    <div id="tt">
        <div title="型号总体优化" style="padding:10px;">
            <div id="stt">
                <div title="方案-1" style="padding:10px;">
                    <div style="width:1080px">
                        <table id="kresult"></table>
                    </div>
                </div>
                <div title="方案-2" style="padding:10px;">
                </div>
                <div title="方案-3" style="padding:10px;">
                </div>
            </div>
            <div id="sst">
                <div title="方案优化分解" style="padding:10px;">
                    <div class="mainspace">
                        <div style="width:950px">
                            <div class="drag" style="margin: 0 auto">总体系统指标</div>
                        </div>
                        <div style="height:40px"></div>
                        <div style="width:950px">
                            <div class="blk">
                                <ul>
                                    <li><a href="#">气动系统</a></li>
                                    <li><a href="#">推进系统</a></li>
                                    <li><a href="#">重量</a></li>
                                    <li><a href="#">飞行性能</a></li>
                                    <li><a href="#">品质要素与发射平台集成</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div title="总体参数" style="padding:10px;">
                    <table id="presult"></table>
                </div>
                <div title="方案优化过程" style="padding:10px;text-align:center">
                    <img src="${pageContext.request.contextPath}/static/images/flowc3.png">
                    <br/>
                    <img src="${pageContext.request.contextPath}/static/images/downarr.png">
                    <br/>
                    <img src="${pageContext.request.contextPath}/static/images/flowc4.png">
                    <br/>
                    <img src="${pageContext.request.contextPath}/static/images/downarr.png">
                    <br/>
                    <img src="${pageContext.request.contextPath}/static/images/flowc5.png">
                    <br/>
                </div>
            </div>
        </div>
        <div title="相关优化方案参考" style="padding:10px;">
            <div class="srch">
                输入指标代码或名称快速查询相应指标
            </div>
            <div class="srchcxt">
                <div style="height:40px">
                    <input type="text" value="输入技术指标名称" style="width:400px;height:30px">
                    <button class="prjs">查询指标</button>
                </div>
            </div>
        </div>
    </div>
</div>
