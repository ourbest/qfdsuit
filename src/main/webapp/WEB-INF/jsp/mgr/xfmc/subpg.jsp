<script>
    $(function() {
        $("#tt").tabs({
                    tools:[
                        {
                            iconCls:'icon-search',
                            text:'选定版本分支'
                        },
                        {
                            iconCls:'icon-add',
                            text:'增加方案'
                        },
                        {
                            iconCls:'icon-save',
                            text:'保存方案'
                        },
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]});
        $("#gtt").tabs();
        $("#stt").tabs();
        $("#dtt").tabs();
        $('#productResult').treegrid({
                    title:'产品规格参数',
                    nowrap: false,
                    rownumbers: true,
                    animate:true,
                    collapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/techresult_data',
                    idField:'characteristics',
                    treeField:'characteristics',
                    frozenColumns:[
                        [
                            {title:'技术规格名称',field:'characteristics',width:120,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }
                            }
                        ]
                    ],
                    columns:[
                        [
                            {field:'target',title:'设计目标',width:60,rowspan:2},
                            {field:'relOfImp',title:'相对重要度',width:80,rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<div style="width:80%;background:#fff;border:1px solid #ccc">' +
                                                '<div style="float:left;width:' + value + '%;background:#8cbeff">' + value + '</div>'
                                        '</div>';
                                    }
                                }
                            },
                            {field:'risk',title:'风险值',width:40,rowspan:2}
                        ]
                    ]
                });
        $('.tproductResult').treegrid({
                    title:'产品规格参数',
                    nowrap: false,
                    rownumbers: true,
                    animate:true,
                    collapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/techresult_data',
                    idField:'characteristics',
                    treeField:'characteristics',
                    frozenColumns:[
                        [
                            {title:'技术指标名称',field:'characteristics',width:120,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }
                            }
                        ]
                    ],
                    columns:[
                        [
                            {field:'target',title:'技术指标',width:60,rowspan:2},
                            {field:'risk',title:'指标分解',width:60,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<a href="#" onclick="dosplit()">指标分解</a>';
                                }
                            },
                            {field:'sk',title:'设计结果',width:60,rowspan:2},
                            {field:'mk',title:'优化结果',width:60,rowspan:2},
                            {field:'mdk',title:'优化设计',width:60,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<a href="#" onclick="mdo()">优化设计</a>';
                                }
                            },
                            {field:'vk',title:'指标关联',width:60,rowspan:2,
                                formatter:function(value, rec) {
                                    return '<a href="#" onclick="doref()">指标关联</a>';
                                }
                            }
                        ]
                    ]
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
    function subdes() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/subdef";
    }
    function dosplit() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/subsplit";
    }
    function doref() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/dref";
    }
    function mdo() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/mdoflow";
    }
</script>
<div class="mainspace" style="width:1100px">
    <div id="tt">
        <div title="方案定义" style="padding:10px;">
            <div style="float:left;width:400px">
                <div id="stt">
                    <div title="型号设计目标" style="padding:10px;">
                        <table id="productResult"></table>
                    </div>
                </div>
            </div>
            <div style="float:left;width:40px;padding:100px 10px 0 10px; text-align:center">
                <img src="${pageContext.request.contextPath}/static/images/arrow.png" style="width:40px">
                <br>
                对应需求技术特征目标，填写方案总体技术指标<br/>
                <img src="${pageContext.request.contextPath}/static/images/arrow.png" style="width:40px">
            </div>
            <div style="float:left;width:600px">
                <div id="gtt">
                    <div title="方案-1" style="padding:10px;">
                        <table class="tproductResult"></table>
                    </div>
                    <div title="方案-2" style="padding:10px;">
                        <table class="tproductResult"></table>
                    </div>
                    <div title="方案-3" style="padding:10px;">
                        <table class="tproductResult"></table>
                    </div>
                </div>
            </div>
        </div>
        <div title="型号设计流程" style="padding:10px;">
            <div id="dtt" style="">
                <div title="方案-1" style="padding:10px;text-align:center">
                    <img src="${pageContext.request.contextPath}/static/images/flowc2.png">
                    <br/>
                    <img src="${pageContext.request.contextPath}/static/images/downarr.png">
                    <br/>
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
                <div title="方案-2" style="padding:10px;"></div>
                <div title="方案-3" style="padding:10px;"></div>
            </div>
        </div>
        <div title="总体参数设计" style="padding:10px;">
            <table id="presult"></table>
        </div>
        <div title="型号需求质量屋" style="padding:10px;">
            <img src="${pageContext.request.contextPath}/static/images/qfdh.png">
        </div>
    </div>
</div>





