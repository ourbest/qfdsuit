<script>
    $(function() {
        $('#pushSystem').treegrid({
                    title:'气动外形与产品规格矩阵',
                    nowrap: false,
                    rownumbers: true,
                    animate:true,
                    collapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/qdvalid_data',
                    toolbar:[
                        {
                            text:'展开',
                            iconCls:'icon-remove',
                            handler:function() {
                                var node = $('#pushSystem').treegrid('getSelected');
                                if (node) {
                                    $('#pushSystem').treegrid('expandAll', node.code);
                                } else {
                                    $('#pushSystem').treegrid('expandAll');
                                }
                            }
                        },
                        '-',
                        {
                            text:'收缩',
                            iconCls:'icon-add',
                            handler:function() {
                                var node = $('#pushSystem').treegrid('getSelected');
                                if (node) {
                                    $('#pushSystem').treegrid('collapseAll', node.code);
                                } else {
                                    $('#pushSystem').treegrid('collapseAll');
                                }
                            }
                        }
                    ],
                    idField:'characteristics',
                    treeField:'characteristics',
                    frozenColumns:[
                        [
                            {title:'',field:'characteristics',width:200,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }
                            }
                        ]
                    ],
                    columns:[
                        [
                            {field:'dt',title:'弹体',width:30},
                            {field:'zdct',title:'轴对称体',width:60},
                            {field:'slt',title:'升力体',width:45},
                            {field:'tbxcb',title:'头部细长比',width:75},
                            {field:'da',title:'大',width:30},
                            {field:'zhong',title:'中',width:30},
                            {field:'xiao',title:'小',width:30},
                            {field:'zxdw',title:'锥形弹尾',width:60},
                            {field:'wu',title:'无',width:30},
                            {field:'zh',title:'中',width:30},
                            {field:'zho',title:'重',width:30},
                            {field:'yi',title:'翼（无、有）',width:90},
                            {field:'w',title:'无',width:30},
                            {field:'sjx',title:'三角形',width:45},
                            {field:'hlqytx',title:'后掠前沿梯形',width:90},
                            {field:'qlqytx',title:'前掠前沿梯形',width:90},
                            {field:'jx',title:'矩形',width:30},
                            {field:'kzgs',title:'控制方式',width:60},
                            {field:'wy',title:'尾翼',width:30},
                            {field:'ys',title:'鸭式',width:30},
                            {field:'dy',title:'弹翼',width:30},
                            {field:'fcg',title:'非常规（推力矢量，喷流互动）',width:200}
                        ]
                    ],
                    onContextMenu: function(e, row) {
                        e.preventDefault();
                        $(this).treegrid('unselectAll');
                        $(this).treegrid('select', row.code);
                        $('#mm').menu('show', {
                                    left: e.pageX,
                                    top: e.pageY
                                });
                    }
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
        alert("技术规格定义保存成功...");
    }
    function prev() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/qddef";
    }
    function next() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/qddefdata";
    }
</script>
<div class="navstep">
    <div class="stepview">
        <div class="tips"><a href="#" id="tooltips"><img src="${pageContext.request.contextPath}/static/images/toptips.png" border="0"></a>
        </div>
        <ul id="mainNav" class="threeStep">
            <li class="lastDone"><a title=""><em>1: 方案选型</em><span>针对技术规格选型相应的设计方案</span></a></li>
            <li class="current"><a title=""><em>2: 技术指标分解</em><span>进行分系统技术指标设计定义</span></a></li>
            <li class="mainNavNoBg"><a title=""><em>3: 方案确定</em><span>通过指标分解确定方案细节</span></a></li>
        </ul>
    </div>
</div>
<div class="clearfloat">&nbsp;</div>
<div class="mainspace">
    <table cellpadding="4" cellspacing="0" width="950">
        <tr>
            <td>
                <a class="button" href="#" onclick="save()"><span>保存技术指标</span></a>
            </td>
            <td style="float:right">
                <a class="button" href="#" onclick="next()"><span>进行方案确定>></span></a>
                <a class="button" href="#" onclick="showdoc()"><span>查看需求任务书</span></a>
            </td>
        </tr>
    </table>
</div>
<div class="mainspace">
    <div style="width:1100px">
        <table id="pushSystem"></table>
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




