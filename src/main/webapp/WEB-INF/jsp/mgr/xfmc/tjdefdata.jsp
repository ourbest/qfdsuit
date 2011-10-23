<script>
    $(function() {
        $('#tjSysSchemeData').treegrid({
                    title:'推进系统方案',
                    nowrap:false,
                    rownumbers:true,
                    animate:true,
                    colapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/tjdefdata_data',
                    idField:'code',
                    treeField:'code',
                    frozenColumns:[
                        [
                            {title:'',field:'code',width:250,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }}
                        ]
                    ],
                    columns:[
                        [
                            {field:'grade',title:'评分',width:200, rowspan:2},
                            {field:'diagram',title:'直方图',width:200, rowspan:2},
                            {field:'vd',title:'方案验证',width:200, rowspan:2,
                                formatter:function(value) {
                                    return '<button onclick="tv()">指标验证</button>';
                                }
                            }
                        ]
                    ],

                    onBeforeLoad:function(row, param) {
                        if (row) {
                            $(this).treegrid('options').url = 'treegrid_subdata.json';
                        } else {
                            $(this).treegrid('options').url = '${pageContext.request.contextPath}/ajax/xfmc/tjdefdata_data';
                        }
                    },
                    onContextMenu: function(e, row) {
                        e.preventDefault();
                        $(this).treegrid('unselectAll');
                        $(this).treegrid('select', row.code);
                        $('#mm').menu('show', {
                                    left: e.pageX,
                                    top: e.pageY
                                });
                    },
                    rownumbers:true
                });

        $("#tooltips").qtip({
                    content: {
                        url: '${pageContext.request.contextPath}/static/tips/spacehelp.jsp'
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

    function showdoc() {
        $("#win").window("open");
    }

    function save() {
        alert("推进系统方案保存成功...");
    }

    function tv() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/tjtv";
    }

</script>

<div class="navstep">
    <div class="stepview">
        <div class="tips"><a href="#" id="tooltips"><img src="${pageContext.request.contextPath}/static/images/toptips.png" border="0"></a>
        </div>
        <ul id="mainNav" class="threeStep">
            <li class="done"><a title=""><em>1: 方案选型</em><span>针对技术规格选型相应的设计方案</span></a></li>
            <li class="lastDone"><a title=""><em>2: 技术指标分解</em><span>进行分系统技术指标设计定义</span></a></li>
            <li class="current mainNavNoBg"><a title=""><em>3: 方案确定</em><span>通过指标分解确定方案细节</span></a></li>
        </ul>
    </div>
</div>
<div class="clearfloat">&nbsp;</div>
<div class="mainspace">
    <table cellpadding="4" cellspacing="0" width="950">
        <tr>
            <td>
                <a class="button" href="#" onclick="save()"><span>方案确定</span></a>
            </td>
            <td style="float:right">
                <a class="button" href="#" onclick="showdoc()"><span>查看需求任务书</span></a>
            </td>
        </tr>
    </table>
</div>
<div class="mainspace">
    <div style="width:950px">
        <table id="tjSysSchemeData"></table>
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




