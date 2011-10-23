<script>
    $(function() {
        $('#kresult').datagrid({
            title:'型号产品定义',
            url:'${pageContext.request.contextPath}/ajax/xfmc/product_data',
            sortName: 'kind',
            remoteSort: false,
            fitColumns: true,
            idField:'code',
            frozenColumns:[
                [
                    {field:'ck',checkbox:true},
                    {title:'编码',field:'code',width:80,sortable:true}
                ]
            ],
            columns:[
                [
                    {title:'型号产品基本信息',colspan:4},
                    {field:'proc',title:'任务进度',width:150,align:'center', rowspan:2,
                        formatter:function(value, rec) {
                            if (value != null) {
                                return '<div style="width:80%;background:#fff;border:1px solid #ccc">' +
                                        '<div style="float:left;width:' + value + '%;background:red">' + value + '%' + '</div>'
                                '</div>';
                            }
                        }
                    },
                    {field:'opt',title:'项目查看',width:150,align:'center', rowspan:2,
                        formatter:function(value, rec) {
                            if (value != null) {
                                return '<button onClick="viewprj();">型号信息</button> <button onClick="goprj();">需求分析</button>';
                            }
                        }
                    }
                ],
                [
                    {field:'putname',title:'名称',width:120,
                        formatter:function(value, rec) {
                            if (value != null) {
                                return '<a href="#" onclick="goprj()">' + value + '</a>';
                            }
                        }
                    },
                    {field:'kind',title:'型号分类',width:120,rowspan:2},
                    {field:'cata',title:'总类型',width:100,rowspan:2},
                    {field:'actor',title:'责任人',width:100,rowspan:2}
                ]
            ],
            rownumbers:true
        });
        var p = $('#kresult').datagrid('getPager');
        if (p) {
            $(p).pagination({
                onBeforeRefresh:function() {
                    alert('before refresh');
                }
            });
        }
        $("#tooltips").qtip({
            content: {
                url: '${pageContext.request.contextPath}/static/tips/reqhelp.jsp'
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
                height:440
            }  });
    });
    function viewprj() {
        $('#win').window('open');
    }
    function goprj() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/reqdef";
    }
    function viwclose() {
        $('#win').window('close');
    }
</script>
<div class="navstep">
    <div class="stepview">
        <div class="tips"><a href="#" id="tooltips"><img src="${pageContext.request.contextPath}/static/images/toptips.png" border="0"></a>
        </div>
        <ul id="mainNav" class="fiveStep">
            <li class=""><a href="#" title=""><em>1: 需求分析及目标</em><span>原始需求和竞争分析</span></a></li>
            <li class=""><a title=""><em>2: 型号技术规格</em><span>型号技术规格定义</span></a></li>
            <li class=""><a title=""><em>3: 需求技术规格关系</em><span>需求技术规格相关性</span></a></li>
            <li class=""><a title=""><em>4: 技术规格自相关</em><span>技术规格自相关性定义</span></a></li>
            <li class="mainNavNoBg"><a title=""><em>5: 技术特性指标及权重</em><span>技术特性指标及权重确定</span></a></li>
        </ul>
    </div>
</div>

<div class="mainspace">
    <div style="width:950px">
        <table id="kresult"></table>
    </div>
</div>

<div id="win" class="easyui-window" closed="true" modal="true" title="型号产品结构查看窗口" style="width:800px;height:400px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <table cellpadding="4" cellspacing="0" width=100% class="prjwin">
                <tr>
                    <td width="80"></td>
                    <td width="140">型号产品：</td>
                    <td>xxx-001</td>
                </tr>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/static/images/man.gif"></td>
                    <td>项目负责人</td>
                    <td>张三</td>
                </tr>
                <tr>
                    <td></td>
                    <td>总设计师：</td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>总指挥：</td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>参加团队：</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/static/images/man.gif"> <img
                            src="${pageContext.request.contextPath}/static/images/man.gif"> <img src="${pageContext.request.contextPath}/static/images/man.gif">
                        <img src="${pageContext.request.contextPath}/static/images/man.gif">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>需求方：</td>
                    <td>甲机构</td>
                </tr>
                <tr>
                    <td></td>
                    <td>需求说明书：</td>
                    <td><a href="#">需求说明书01</a> <a href="#">需求说明书02</a> <a href="#">需求说明书03</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td>进度情况：</td>
                    <td>
                        <div style="width:160px;background:#fff;border:1px solid #ccc">
                            <div style="float:left;width:100px;background:red">60%</div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="viwclose()">确定</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>
<div id="pw" class="easyui-window" closed="true" modal="true" title="型号产品结构定义" style="width:660px;height:430px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <div id="source" style="border:1px solid #ccc;width:300px;height:320px;float:left;margin:5px;">
                <div style="height:20px;font-weight:bold;padding:4px;border-bottom:1px solid #ccc;background:#ededed">型号产品结构系统选择</div>
                <div id="d1" class="drag">气动系统</div>
                <div id="d2" class="drag">推进系统</div>
                <div id="d3" class="drag">重量</div>
                <div id="d4" class="drag">飞行性能</div>
                <div id="d5" class="drag">品质要素与发射平台集成</div>
            </div>
            <div id="target" style="border:1px solid #ccc;width:300px;height:320px;float:left;margin:5px;">
                <div style="height:20px;font-weight:bold;padding:4px;border-bottom:1px solid #ccc;background:#ededed">定义本型号产品型号结构</div>
            </div>
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="cclose()">确定</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>




