<script>
    $(function() {
        $("#tt").tabs({
                    tools:[
                        {
                            iconCls:'icon-save',
                            text:'保存方案'
                        },
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]});
        $('#tproductResult').treegrid({
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
                            {title:'技术指标名称',field:'characteristics',width:160,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }
                            }
                        ]
                    ],
                    columns:[
                        [
                            {field:'target',title:'技术指标',width:100,rowspan:2},
                            {field:'ck',width:60,checkbox:true},
                            {field:'mkk',title:'验证结果',width:100,rowspan:2},
                            {field:'mmk',title:'是否验证',width:80,rowspan:2,
                                formatter:function(value, rec) {
                                    return '进行中';
                                }
                            }
                        ]
                    ]
                });
    });
    function dov() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/techvalid";
    }
    function subdes() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/subdef";
    }
    function dosplit() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/subsplit";
    }
    function doref() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/dref";
    }
</script>
<div class="mainspace">
    <div id="tt">
        <div title="方案定义" style="padding:10px;">
            <div style="float:left;width:540">
                <table id="tproductResult"></table>
            </div>
            <div style="float:left;width:80px;padding:100px 10px 0 20px;">
                <img src="${pageContext.request.contextPath}/static/images/arrow.png" style="width:80px">
                <br>
                对应需求技术特征目标，选择分系统进行技术指标定义<br/>
            </div>
            <div id="subsys" style="float:left;border:1px solid #ccc;width:400px;height:320px;">
                <div style="height:20px;font-weight:bold;padding:4px;border-bottom:1px solid #ccc;background:#ededed">型号产品结构系统选择</div>
                <div id="d1" class="dragb"><a style="font-size:16px;font-weight:bolder;" href="${pageContext.request.contextPath}/mgr/xfmc/ztdes">总体</a></div>
                <div id="d2" class="dragb"><a style="font-size:16px;font-weight:bolder;" href="${pageContext.request.contextPath}/mgr/xfmc/qddef">气动系统</a></div>
                <div id="d3" class="dragb"><a style="font-size:16px;font-weight:bolder" href="${pageContext.request.contextPath}/mgr/xfmc/tjdef">推进系统</a></div>
                <div id="d4" class="dragb"><a style="font-size:16px;font-weight:bolder" href="#">重量</a></div>
                <div id="d5" class="dragb"><a style="font-size:16px;font-weight:bolder" href="#">飞行性能</a></div>
                <div id="d6" class="dragb"><a style="font-size:16px;font-weight:bolder" href="#">品质要素与发射平台集成</a></div>
            </div>
        </div>
        <div title="型号需求质量屋" style="padding:10px;">
            <img src="${pageContext.request.contextPath}/static/images/qfdh.png">
        </div>
    </div>
</div>




