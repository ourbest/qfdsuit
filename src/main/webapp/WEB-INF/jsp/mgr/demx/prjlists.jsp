<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
    $(function() {
        $("#tt").tabs();
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
                                        return '<button onClick="viewprj();">型号信息</button> <button onClick="goprj();">项目管理</button>';
                                    }
                                }
                            }
                        ],
                        [
                            {field:'putname',title:'名称',width:120,
                                formatter:function(value, rec) {
                                    if (value != null) {
                                        return '<a href="#" onclick="showp()">' + value + '</a>';
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
    });
    function viewprj() {
        $('#win').window('open');
    }
    function goprj() {
        location.href = "${pageContext.request.contextPath}/mgr/demx/prjview";
    }
    function showp() {
        $("#mv").show();
    }
    function viwclose() {
        $('#win').window('close');
    }
</script>
<div class="mainspace">
    <div id="tt" style="">
        <div title="我的型号项目" style="padding:10px;">
            <div style="width:950px">
                <table id="kresult"></table>
            </div>
            <br/>

            <div id="mv" style="display:none;width:950px">
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
                            <td>
                                <button>增加设计师</button>
                                <br/>
                                <button>移除设计师</button>
                            </td>
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
        </div>
        <div title="型号项目查询" style="padding:10px;">
        </div>
        <div title="项目管理帮助" style="padding:10px;">
        </div>
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




