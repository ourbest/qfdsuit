<script>
    $(function() {
        $("#att").tabs({
                    tools:[
                        {
                            iconCls:'icon-save',
                            text:'保存'
                        },
                        {
                            iconCls:'icon-back',
                            text:'返回主工作区'
                        },
                        {
                            iconCls:'icon-help',
                            text:'获得帮助'
                        }
                    ]
                });
        $('#attach').propertygrid({
                    height:'auto',
                    url:'${pageContext.request.contextPath}/ajax/demx/prtatt_data',
                    scrollbarSize:0,
                    columns:[
                        [
                            {field:'ck',width:80,checkbox:true},
                            {field:'name',title:'附件名称',width:100,
                                formatter:function(value, rec) {
                                    return '附件文件'
                                }
                            },
                            {field:'value',title:'附件文件',width:500,
                                formatter:function(value, rec) {
                                    return '附件文件'
                                }
                            }
                        ]
                    ]
                });
        $('#productSelf').treegrid({
                    title:'产品规格相关度',
                    iconCls:'icon-save',
                    nowrap: false,
                    rownumbers: true,
                    animate:true,
                    collapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/techself_data',
                    toolbar:[
                        {
                            text:'展开',
                            iconCls:'icon-remove',
                            handler:function() {
                                $('#productSelf').treegrid('expandAll');
                            }
                        },
                        '-',
                        {
                            text:'收缩',
                            iconCls:'icon-add',
                            handler:function() {
                                $('#productSelf').treegrid('collapseAll');
                            }
                        }
                    ],
                    idField:'characteristics',
                    treeField:'characteristics',
                    frozenColumns:[
                        [
                            {title:'',field:'characteristics',width:150,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }
                            }
                        ]
                    ],
                    columns:[
                        [
                            {field:'prpulsion',title:'推进',width:30},
                            {field:'thrustWeight',title:'推重',width:30},
                            {field:'climbCapability',title:'爬升能力',width:60},
                            {field:'fuelEfficiency',title:'燃料效能',width:60},
                            {field:'SFC',title:'燃油消耗率',width:75},
                            {field:'airframeTechnology',title:'弹体技术',width:60},
                            {field:'materialStructure',title:'材料与结构',width:75},
                            {field:'materialStrength',title:'材料强度',width:60},
                            {field:'structuralWeight',title:'结构重量',width:60},
                            {field:'aerodynamic',title:'空气动力学',width:75},
                            {field:'ld',title:'长度直径比',width:75},
                            {field:'crossSectionArea',title:'横截面面积',width:75},
                            {field:'size',title:'尺寸',width:30},
                            {field:'fuelVolume',title:'燃油量',width:45},
                            {field:'GNC',title:'制导系统',width:60},
                            {field:'guidance',title:'导航',width:30},
                            {field:'avionics',title:'航空电子技术',width:90},
                            {field:'circle',title:'概率圆误差',width:75},
                            {field:'signal',title:'信号延迟时间',width:90},
                            {field:'maneuverability',title:'机动性',width:45},
                            {field:'control',title:'控制系统',width:60},
                            {field:'operation',title:'操作',width:30},
                            {field:'compliance',title:'符合性',width:45},
                            {field:'munition',title:'非敏感性弹药',width:90},
                            {field:'logistics',title:'后勤',width:30},
                            {field:'maintenance',title:'维护',width:30},
                            {field:'depot',title:'库存时间',width:60},
                            {field:'effectiveness',title:'任务效能',width:60},
                            {field:'detecte',title:'被探测性',width:60},
                            {field:'radar',title:'雷达目标有效截面',width:120},
                            {field:'visibility',title:'可见度',width:45},
                            {field:'signature',title:'红外线标签',width:75},
                            {field:'footprint',title:'信号覆盖区',width:75},
                            {field:'hit',title:'被击中性',width:60},
                            {field:'altitude',title:'高度',width:30},
                            {field:'speed',title:'速度',width:30},
                            {field:'capability',title:'系统性能',width:60},
                            {field:'response',title:'反应时间',width:60},
                            {field:'lethality',title:'毁灭性',width:45},
                            {field:'trajectory',title:'弹道轨迹',width:60},
                            {field:'maneuverablity',title:'机动性',width:45},
                            {field:'radius',title:'回转半径',width:60}

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
        <ul id="mainNav" class="fiveStep">
            <li class="done"><a href="#" title=""><em>1: 需求分析及目标</em><span>原始需求和竞争分析</span></a></li>
            <li class="done"><a title=""><em>2: 型号技术规格</em><span>型号技术规格定义</span></a></li>
            <li class="lastDone"><a title=""><em>3: 需求技术规格关系</em><span>需求技术规格相关性</span></a></li>
            <li class="current"><a title=""><em>4: 技术规格自相关</em><span>技术规格自相关性定义</span></a></li>
            <li class="mainNavNoBg"><a title=""><em>5: 技术特性指标及权重</em><span>技术特性指标及权重确定</span></a></li>
        </ul>
    </div>
</div>
<div class="clearfloat">&nbsp;</div>
<div class="mainspace">
    <div id="att" style="">
        <div title="型号需求分析" style="padding:10px;">
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <a class="button" href="#" onclick="prev()"><span><<调整需求技术相关性定义</span></a>
                    </td>
                    <td style="float:right">
                        <a class="button" href="#" onclick="next()"><span>输出技术特性指标及权重>></span></a>
                    </td>
                </tr>
            </table>
            <div style="padding:10px;">
                <table id="productSelf"></table>
            </div>
        </div>
        <div title="型号需求任务书" style="padding:10px;">
            <div style="margin: 0 20px 0 0">
                <table id="attach"></table>
            </div>
        </div>
        <div title="需求任务书相关备注" style="padding:10px;">
            <textarea name="message" style="width:98%;height:60px;"></textarea>
        </div>
        <div title="相关型号需求分析参考" style="padding:10px;">
            <textarea name="message" style="width:98%;height:60px;"></textarea>
        </div>
    </div>
</div>