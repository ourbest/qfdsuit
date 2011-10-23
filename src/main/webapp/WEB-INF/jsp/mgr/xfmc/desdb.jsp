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
                            {title:'编码',field:'code',width:80,sortable:true}
                        ]
                    ],
                    columns:[
                        [
                            {title:'型号产品基本信息',colspan:4},
                            {field:'proc',title:'任务进度',width:150,align:'center', rowspan:2
                            },
                            {field:'opt',title:'项目查看',width:150,align:'center', rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<button onClick="viewprj();">产品定义信息</button>';
                                    }
                                }
                            }
                        ],
                        [
                            {field:'putname',title:'名称',width:120,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<a href="#" onclick="viewprj()">' + value + '</a>';
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
                        url: '${pageContext.request.contextPath}/static/tips/tipshelp.html'
                    },
                    style: {
                        tip: {
                            corner: 'topLeft'
                        },
                        background: '#EFEFEF',
                        border: {
                            width: 2,
                            radius: 5,
                            color: '#8cbeff'
                        },
                        name:'light',
                        width: 920,
                        height:100
                    }  });
    });

    function showdoc() {
        $("#win").window("open");
    }

    function save() {
        alert("技术规格定义保存成功...");
    }
    function prev() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/techref";
    }
    function next() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/techresult";
    }
</script>
<div class="navstep">
    <div class="stepview">
        <div class="tips"><a href="#" id="tooltips"><img src="${pageContext.request.contextPath}/static/images/toptips.png" border="0"></a>
        </div>
        <ul id="mainNav" class="twoStep">
            <li class="current"><a title=""><em>1: 方案评估</em><span>对原始需求和竞争进行定义</span></a></li>
            <li class="mainNavNoBg"><a title=""><em>2: 技术指标分解</em><span>冻结产品需求及技术特征定义</span></a></li>
        </ul>
    </div>
</div>
<div class="clearfloat">&nbsp;</div>
<div class="mainspace">
    <table cellpadding="4" cellspacing="0" width="910">
        <tr>
            <td>
                <a class="button" href="#" onclick="save()"><span>建立概念设计方案</span></a>
            </td>
            <td style="float:right" >
                <a class="button" href="#" onclick="showdoc()"><span>查看需求任务书</span></a>
            </td>
        </tr>
    </table>
</div>
<div class="mainspace">
    <div style="width:910px">
        <table id="kresult"></table>
    </div>
</div>

<div id="win" class="easyui-window" closed="true" modal="true" title="型号产品结构查看窗口" style="width:800px;height:500px;">
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




