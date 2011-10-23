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
        $('#matrixDiagramRelationships').treegrid({
                    title:'相关矩阵',
                    nowrap:false,
                    rownumbers:true,
                    animate:true,
                    colapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/techref_data',
                    toolbar:[
                        {
                            text:'展开',
                            iconCls:'icon-remove',
                            handler:function() {
                                var node = $('#matrixDiagramRelationships').treegrid('getSelected');
                                if (node) {
                                    $('#matrixDiagramRelationships').treegrid('expandAll', node.code);
                                } else {
                                    $('#matrixDiagramRelationships').treegrid('expandAll');
                                }
                            }
                        },
                        '-',
                        {
                            text:'收缩',
                            iconCls:'icon-add',
                            handler:function() {
                                var node = $('#matrixDiagramRelationships').treegrid('getSelected');
                                if (node) {
                                    $('#matrixDiagramRelationships').treegrid('collapseAll', node.code);
                                } else {
                                    $('#matrixDiagramRelationships').treegrid('collapseAll');
                                }
                            }
                        }
                    ],
                    idField:'code',
                    treeField:'code',
                    frozenColumns:[
                        [
                            {title:'',field:'code',width:150,
                                formatter:function(value) {
                                    return '<span style="color:red">' + value + '</span>';
                                }}
                        ]
                    ],
                    columns:[
                        [
                            {field:'propulsion',title:'推进',width:40, rowspan:2},
                            {field:'thrustToWeigh',title:'推重',width:40, rowspan:2},
                            {field:'ClimbCapability',title:'爬升能力',width:60, rowspan:2},
                            {field:'FuelEfficiency',title:'燃料效能',width:60, rowspan:2},
                            {field:'SFC',title:'燃油消耗率',width:80, rowspan:2},
                            {field:'AirframeTech',title:'弹体技术',width:60, rowspan:2},
                            {field:'MaterialsStructures',title:'材料与结构',width:80, rowspan:2},
                            {field:'MaterialStrength',title:'材料强度',width:60, rowspan:2},
                            {field:'StructuralWeight',title:'结构重量',width:60, rowspan:2},
                            {field:'Aerodynamics',title:'空气动力学',width:80, rowspan:2},
                            {field:'L/D',title:'长度直径比',width:80, rowspan:2},
                            {field:'CrossSectionArea',title:'横截面积',width:60, rowspan:2},
                            {field:'Size',title:'尺寸',width:40, rowspan:2},
                            {field:'FuelVolume',title:'燃油量',width:50, rowspan:2},
                            {field:'GNC',title:'制导系统',width:60, rowspan:2},
                            {field:'GuidanceNavigation',title:'导航',width:40, rowspan:2},
                            {field:'AvionicsTechnology',title:'航空电子技术',width:80, rowspan:2},
                            {field:'CircleErrorProbable',title:'概率圆误差',width:80, rowspan:2},
                            {field:'SignalTimeDelay ',title:'信号延迟时间',width:80, rowspan:2},
                            {field:'Maneuverability',title:'机动性',width:50, rowspan:2},
                            {field:'ControlSystem',title:'控制系统',width:60, rowspan:2},
                            {field:'Operations',title:'运作',width:40, rowspan:2},
                            {field:'IMComplianceIM',title:'符合性',width:50, rowspan:2},
                            {field:'InsensitiveMunitions',title:'非敏感型弹药',width:80, rowspan:2},
                            {field:'Logistics',title:'后勤',width:40, rowspan:2},
                            {field:'Maintenance',title:'维护',width:40, rowspan:2},
                            {field:'DepotLife',title:'存库时间',width:60, rowspan:2},
                            {field:'MissionEffec',title:'任务效能',width:60, rowspan:2},
                            {field:'BeingDetected',title:'被探测性',width:60, rowspan:2},
                            {field:'RadarCrossSection',title:'雷达目标有效截面',width:100, rowspan:2},
                            {field:'Visibility',title:'可见度',width:50, rowspan:2},
                            {field:'Infra-redSignature',title:'红外线标签',width:80, rowspan:2},
                            {field:'Footprint/Noise',title:'信号覆盖率/噪音',width:100, rowspan:2},
                            {field:'BeingHit',title:'被击中性',width:60, rowspan:2},
                            {field:'Altitude',title:'高度',width:40, rowspan:2},
                            {field:'Speed',title:'速度',width:40, rowspan:2},
                            {field:'SystemCapability',title:'系统性能',width:60, rowspan:2},
                            {field:'ResponseTime',title:'反应时间',width:60, rowspan:2},
                            {field:'Lethality',title:'毁灭性',width:50, rowspan:2},
                            {field:'Trajectory',title:'弹道轨迹',width:60, rowspan:2},
                            {field:'Maneuverability',title:'机动性',width:50, rowspan:2},
                            {field:'TurnRadius',title:'回转半径',width:60, rowspan:2}
                        ]
                    ],
                    rownumbers:true
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
    function next() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/techself";
    }
</script>
<div class="navstep">
    <div class="stepview">
        <div class="tips"><a href="#" id="tooltips"><img src="${pageContext.request.contextPath}/static/images/toptips.png" border="0"></a>
        </div>
        <ul id="mainNav" class="fiveStep">
            <li class="done"><a href="#" title=""><em>1: 需求分析及目标</em><span>原始需求和竞争分析</span></a></li>
            <li class="lastDone"><a title=""><em>2: 型号技术规格</em><span>型号技术规格定义</span></a></li>
            <li class="current"><a title=""><em>3: 需求技术规格关系</em><span>需求技术规格相关性</span></a></li>
            <li><a title=""><em>4: 技术规格自相关</em><span>技术规格自相关性定义</span></a></li>
            <li class="mainNavNoBg"><a title=""><em>5: 技术特性指标及权重</em><span>技术特性指标及权重确定</span></a></li>
        </ul>
    </div>
</div>
<div class="clearfloat">&nbsp;</div>
<div class="mainspace">
    <div id="att" style="">
        <div title="型号需求分析" style="padding:10px;">
            <div style="padding:10px">
                <table cellpadding="4" cellspacing="0">
                    <tr>
                        <td style="float:right">
                            <a class="button" href="#" onclick="next()"><span>技术规格自相关定义>></span></a>
                        </td>
                    </tr>
                </table>
                <table id="matrixDiagramRelationships"></table>
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