<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
    $(function() {
        $('.drag').draggable({
                    proxy:'clone',
                    revert:true,
                    cursor:'auto',
                    onStartDrag:function() {
                        $(this).draggable('options').cursor = 'not-allowed';
                        $(this).draggable('proxy').addClass('dp');
                    },
                    onStopDrag:function() {
                        $(this).draggable('options').cursor = 'auto';
                    }
                });
        $('#target').droppable({
                    accept:'#d1,#d2,#d3,#d4,#d5',
                    onDragEnter:function(e, source) {
                        $(source).draggable('options').cursor = 'auto';
                        $(source).draggable('proxy').css('border', '1px solid red');
                        $(this).addClass('over');
                    },
                    onDragLeave:function(e, source) {
                        $(source).draggable('options').cursor = 'not-allowed';
                        $(source).draggable('proxy').css('border', '1px solid #ccc');
                        $(this).removeClass('over');
                    },
                    onDrop:function(e, source) {
                        $(this).append(source)
                        $(this).removeClass('over');
                    }
                });
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
                                        return '<button onClick="viewprj();">型号信息</button> <button onClick="goprj();">型号设计</button>';
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
                        url: '${pageContext.request.contextPath}/static/tips/prjhelp.jsp'
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
<c:if test="${role=='8'||role=='6'}">
<div class="navstep">
    <div class="stepview">
        <div class="tips"><a href="#" id="tooltips"><img src="${pageContext.request.contextPath}/static/images/toptips.png" border="0"></a>
        </div>
        <ul id="mainNav" class="fiveStep">
            <li class="current"><a href="#" title=""><em>1: 型号项目创建</em><span>型号项目初始创建</span></a></li>
            <li class=""><a href="#" title=""><em>2: 型号需求分析</em><span>需求分析和确定</span></a></li>
            <li class=""><a href="#" title=""><em>3: 型号产品定义</em><span>定义型号产品技术特征</span></a></li>
            <li class=""><a href="#" title=""><em>4: 技术指标概念设计</em><span>方案技术指标验证</span></a></li>
            <li class="mainNavNoBg"><a href="#" title=""><em>5: 方案冻结优化</em> <span>多学科方案优化</span></a></li>
        </ul>
    </div>
</div>
<div class="mainspace">
    <table cellpadding="4" cellspacing="0" width="950">
        <tr>
            <td style="float:right" >
                <a class="button" href="#" onclick="showp()"><span>创建型号产品</span></a>
                <a class="button" href="#" onclick="showp()"><span>类似创建型号产品</span></a>
            </td>
        </tr>
    </table>
</div>
</c:if>
<div class="mainspace">
    <div style="width:950px">
        <table id="kresult"></table>
    </div>
</div>
<div class="mainspace">
    <table cellpadding="4" cellspacing="0" class="prjwin">
        <tr>
            <td>
                <span id="ss" style="display:none"><a class="button" href="#" onclick="save()"><span>保存型号并创建结构</span></a></span>
            </td>
        </tr>
    </table>
</div>

<div id="mv" class="mainspace" style="display:none;width:950px">
    <div class="srch">
        型号产品概要信息创建
    </div>
    <div class="srchcxt">
        <table cellpadding="4" cellspacing="0" class="prjwin">
            <tr>
                <td width="80"></td>
                <td width="140">型号产品：</td>
                <td><input type="text" value="xxx-001" style="width:400px"></td>
                <td></td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/static/images/man.gif"></td>
                <td>项目负责人</td>
                <td><select style="width:400px">
                    <option checked>张三</option>
                    <option value="">李四</option>
                    <option value="">王二</option>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>总指挥：</td>
                <td><select style="width:400px">
                    <option checked>张三</option>
                    <option value="">李四</option>
                    <option value="">王二</option>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>总设计师：</td>
                <td><select style="width:400px">
                    <option checked>张三</option>
                    <option value="">李四</option>
                    <option value="">王二</option>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>参加设计师：</td>
                <td>
                    <input type="checkbox"><img src="${pageContext.request.contextPath}/static/images/man.gif">
                    <input type="checkbox"><img src="${pageContext.request.contextPath}/static/images/man.gif">
                    <input type="checkbox"><img src="${pageContext.request.contextPath}/static/images/man.gif">
                    <input type="checkbox"><img src="${pageContext.request.contextPath}/static/images/man.gif">

                </td>
                <td><button>增加设计师</button><br/><button>移除设计师</button></td>
            </tr>
            <tr>
                <td></td>
                <td>需求方联系人：</td>
                <td><select style="width:400px">
                    <option checked>甲方A</option>
                    <option value="">甲方B</option>
                    <option value="">甲方C</option>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>需求说明书：</td>
                <td><input type="file" style="width: 200px"></td>
                <td></td>
            </tr>
        </table>
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




