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
                                        return '<button onClick="viewprj();">型号信息</button> <button onClick="goprj();">模型设计</button>';
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
                        height:440
                    }  });
    });

    function viewprj() {
        $('#win').window('open');
    }
    function goprj() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/techvalid";
    }
    function showp() {
        $("#mv").show();
        $("#ss").show();
    }

    function save() {
        $("#mv").hide();
        $("#pw").window("open");
    }
    function viwclose() {
        $('#pw').window('close');
        $('#win').window('close');
    }
    function cclose() {
        $('#pw').window('close');
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/reqdef";
    }
</script>
<div class="navstep">
    <div class="stepview">
        <div class="tips"><a href="#" id="tooltips"><img src="${pageContext.request.contextPath}/static/images/toptips.png" border="0"></a>
        </div>
        <ul id="mainNav" class="fiveStep">
            <li class="done"><a href="${pageContext.request.contextPath}/mgr/xfmc/inhouse" title=""><em>1: 原理级模型</em><span>原理级模型设计验证</span></a></li>
            <li class="done"><a href="${pageContext.request.contextPath}/mgr/xfmc/caddb" title=""><em>2: CAD模型</em><span>CAD概念模型级设计</span></a></li>
            <li class="done"><a href="${pageContext.request.contextPath}/mgr/xfmc/caedb" title=""><em>3: 网格模型</em><span>概念级网格模型</span></a></li>
            <li class="done"><a href="${pageContext.request.contextPath}/mgr/xfmc/ansys" title=""><em>4: 多学科仿真</em><span>概念级模型多学科仿真</span></a></li>
            <li class="done mainNavNoBg"><a href="${pageContext.request.contextPath}/mgr/xfmc/fav" title=""><em>5: FAV快速验证</em><span>利用FAV快速验证</span></a></li>
        </ul>
    </div>
</div>
<div class="clearfloat">&nbsp;</div>
<div class="mainspace">
    <div style="width:950px">
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




