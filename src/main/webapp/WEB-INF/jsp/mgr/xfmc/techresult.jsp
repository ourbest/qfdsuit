﻿<script>
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
        $('#productResult').treegrid({
                    title:'产品规格参数',
                    iconCls:'icon-save',
                    nowrap: false,
                    rownumbers: true,
                    animate:true,
                    collapsible:true,
                    url:'${pageContext.request.contextPath}/ajax/xfmc/techresult_data',
                    toolbar:[
                        {
                            text:'展开',
                            iconCls:'icon-remove',
                            handler:function() {
                                $('#productResult').treegrid('expandAll');
                            }
                        },
                        '-',
                        {
                            text:'收缩',
                            iconCls:'icon-add',
                            handler:function() {
                                $('#productResult').treegrid('collapseAll');
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
                            {field:'dirOfImp',title:'改进方向',width:120},
                            {field:'weightImp',title:'加权重要度',width:120,rowspan:2},
                            {field:'risk',title:'风险值',width:150,rowspan:2},
                            {field:'relOfImp',title:'相对重要度',width:120,rowspan:2,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<div style="width:80%;background:#fff;border:1px solid #ccc">' +
                                                '<div style="float:left;width:' + value + '%;background:#8cbeff">' + value + '</div>'
                                        '</div>';
                                    }
                                }
                            },
                            {field:'target',title:'目标',width:150,rowspan:2}

                        ]
                    ]
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
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/techself";
    }
    function back() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/pdesign";
    }
</script>
<div class="navstep">
    <div class="stepview">
        <div class="tips"><a href="#" id="tooltips"><img src="${pageContext.request.contextPath}/static/images/toptips.png" border="0"></a>
        </div>
        <ul id="mainNav" class="fiveStep">
            <li class="done"><a href="#" title=""><em>1: 需求分析及目标</em><span>原始需求和竞争分析</span></a></li>
            <li class="done"><a title=""><em>2: 型号技术规格</em><span>型号技术规格定义</span></a></li>
            <li class="done"><a title=""><em>3: 需求技术规格关系</em><span>需求技术规格相关性</span></a></li>
            <li class="lastDone"><a title=""><em>4: 技术规格自相关</em><span>技术规格自相关性定义</span></a></li>
            <li class="current mainNavNoBg"><a title=""><em>5: 技术特性指标及权重</em><span>技术特性指标及权重确定</span></a></li>
        </ul>
    </div>
</div>
<div class="mainspace">
    <div id="att" style="">
        <div title="型号需求分析" style="padding:10px;">
            <div style="width:950px">
                <table cellpadding="4" cellspacing="0" width="950">
                    <tr>
                        <td>
                            <a class="button" href="#" onclick="prev()"><span><<调整技术自相关性定义</span></a>
                        </td>
                        <td style="float:right">
                            <a class="button" href="#" onclick="back()"><span>完成需求分析</span></a>
                        </td>
                    </tr>
                </table>
                <table id="productResult"></table>
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



