<script>
    $(function() {
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
                            {field:'target',title:'技术指标',width:160,rowspan:2},
                            {field:'ck',width:60,checkbox:true}
                        ]
                    ]
                });
        $("#tooltips").qtip({
                    content: {
                        url: '${pageContext.request.contextPath}/static/tips/deshelp.jsp'
                    },
                    style: {
                        tip: {
                            corner: 'topLeft'
                        },
                        background: '#FFF',
                        border: {
                            width: 2,
                            radius: 5,
                            color: '#8cbeff'
                        },
                        name:'light',
                        width: 920,
                        height:380
                    }  });
    });

    function showopz() {
        $("#win").window("open");
    }

    function save() {
        alert("型号最优方案保存成功...");
    }
    function tovalid() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/techvalid";
    }
    function subdes() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/subdef";
    }
    function dosplit() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/subsplit";
    }
</script>
<div class="navstep">
    <div class="stepview">
        <div class="tips"><a href="#" id="tooltips"><img src="${pageContext.request.contextPath}/static/images/toptips.png" border="0"></a>
        </div>
        <ul id="mainNav" class="twoStep">
            <li class="done"><a href="${pageContext.request.contextPath}/mgr/xfmc/inhouse" title=""><em>1: 方案冻结</em><span>对已进行验证的方案冻结</span></a></li>
            <li class="done mainNavNoBg"><a href="${pageContext.request.contextPath}/mgr/xfmc/caddb" title=""><em>2: 方案优化</em><span>对符合目标的方案自动优化</span></a></li>
        </ul>
    </div>
</div>
<div class="clearfloat">&nbsp;</div>
<div class="mainspace">
    <table cellpadding="4" cellspacing="0" width="950">
        <tr>
            <td width="160">
                <select name="opz" style="width:160px;height:30px">
                    <option>设计方案1</option>
                    <option>设计方案2</option>
                    <option>设计方案3</option>
                </select>
            </td>
            <td>
                <a class="button" href="#" onclick="save()"><span>冻结当前版本</span></a>
                <a class="button" href="#" onclick="save()"><span>确定当前最优版本</span></a>
            </td>
            <td style="float:right">
                <a class="button" href="#" onclick="showopz()"><span>对当前方案自动优化</span></a>
            </td>
        </tr>
    </table>
</div>
<div class="mainspace" style="width:950px">
    <div style="float:left;width:420px">
        <table id="tproductResult"></table>
    </div>
    <div style="float:left;width:80px;padding:100px 10px 0 20px;">
        <img src="${pageContext.request.contextPath}/static/images/arrow.png" style="width:80px">
        <br>
        对应需求技术特征目标，选择分系统进行技术指标验证<br/>
    </div>
    <div id="subsys" style="float:right;border:1px solid #ccc;width:400px;height:320px;">
        <div style="height:20px;font-weight:bold;padding:4px;border-bottom:1px solid #ccc;background:#ededed">型号产品结构系统选择</div>
        <div id="d1" class="dragb"><a style="font-size:16px;font-weight:bolder;" href="${pageContext.request.contextPath}/mgr/xfmc/qdtv">气动系统</a></div>
        <div id="d2" class="dragb"><a style="font-size:16px;font-weight:bolder" href="${pageContext.request.contextPath}/mgr/xfmc/tjtv">推进系统</a></div>
        <div id="d3" class="dragb"><a style="font-size:16px;font-weight:bolder" href="#">重量</a></div>
        <div id="d4" class="dragb"><a style="font-size:16px;font-weight:bolder" href="#">飞行性能</a></div>
        <div id="d5" class="dragb"><a style="font-size:16px;font-weight:bolder" href="#">品质要素与发射平台集成</a></div>
    </div>
</div>
<div class="clearfloat">&nbsp;</div>
<br/>

<div id="win" class="easyui-window" closed="true" modal="true" title="型号产品结构查看窗口" style="width:300px;height:120px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <div style="margin:0 auto;padding:10px">
                开是对当前选定的方案进行优化...
            </div>
        </div>
    </div>
</div>




