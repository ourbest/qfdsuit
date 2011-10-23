<script>
    $(function() {
        $('#kresult').datagrid({
            title:'数据查询结果',
            nowrap: false,
            striped: true,
            url:'/ajax/xfmc/org_data',
            sortName: 'code',
            remoteSort: false,
            idField:'code',
            frozenColumns:[
                [
                    {field:'ck',checkbox:true},
                    {title:'序号',field:'code',width:80,sortable:true}
                ]
            ],
            columns:[
                [
                    {title:'人员基本信息',colspan:7},
                    {field:'opts',title:'分配任务',width:160,rowspan:2,
                        formatter:function(value, rec) {
                            return '<button onClick="viewprj();">查看承担任务</button>';
                        }
                    }
                ],
                [
                    {field:'oo',title:'Icon',width:60,rowspan:2,
                        formatter:function(value, rec) {
                            return '<span><img src="${pageContext.request.contextPath}/static/images/man.gif"></span>';
                        }
                    },
                    {field:'name',title:'名称',width:120},
                    {field:'addr',title:'所属型号',width:120,rowspan:2,sortable:true,
                        sorter:function(a, b) {
                            return (a > b ? 1 : -1);
                        }
                    },
                    {field:'att',title:'任务',width:40,rowspan:2,
                        formatter:function(value, rec) {
                            if (value != null) {
                                return '<span><img src="${pageContext.request.contextPath}/static/images/task.png"></span>';
                            }
                        }
                    },
                    {field:'att1',title:'几何',width:40,rowspan:2,
                        formatter:function(value, rec) {
                            if (value != null) {
                                return '<span><img src="${pageContext.request.contextPath}/static/images/geo.png"></span>';
                            }
                        }
                    },
                    {field:'att2',title:'仿真',width:40,rowspan:2,
                        formatter:function(value, rec) {
                            if (value != null) {
                                return '<span><img src="${pageContext.request.contextPath}/static/images/sim.png"></span>';
                            }
                        }
                    },
                    {field:'att3',title:'求解',width:40,rowspan:2,
                        formatter:function(value, rec) {
                            if (value != null) {
                                return '<span><img src="${pageContext.request.contextPath}/static/images/ansys.png"></span>';
                            }
                        }
                    }
                ]
            ],
            rownumbers:true
        });
    });
    function viewprj() {
        $('#win').window('open');
    }
    function showp() {
        $("#mv").show();
        $("#ss").show();
    }
</script>
<div class="mainspace">
    <div style="width:850px">
        <table id="kresult"></table>
    </div>
</div>
<div class="mainspace">
    <table cellpadding="4" cellspacing="0" width="850">
        <tr>
            <td>
                <button onclick="showp()">进行任务分配</button>
            </td>
            <td style="float:right">
                <span id="ss" style="display:none"><button onclick="req()">保存</button></span>
            </td>
        </tr>
    </table>
</div>
<div id="mv" class="mainspace" style="display:none;width:850px">
    <div class="srch">
        XXX项目中任务承担情况浏览
    </div>
    <div class="srchcxt">
        <table cellpadding="4" cellspacing="0" class="prjwin">
            <tr>
                <td width="80"></td>
                <td width="140">预研型号：</td>
                <td><input type="text" value="xxx-001" style="width:400px"></td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/static/images/man.gif"></td>
                <td>项目负责人</td>
                <td><select style="width:400px">
                    <option checked>张三</option>
                    <option value="">李四</option>
                    <option value="">王二</option>
                </select></td>
            </tr>
            <tr>
                <td></td>
                <td>总设计师：</td>
                <td><select style="width:400px">
                    <option checked>张三</option>
                    <option value="">李四</option>
                    <option value="">王二</option>
                </select></td>
            </tr>
            <tr>
                <td></td>
                <td>总指挥：</td>
                <td><select style="width:400px">
                    <option checked>张三</option>
                    <option value="">李四</option>
                    <option value="">王二</option>
                </select></td>
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
                <td><select style="width:400px">
                    <option checked>张三</option>
                    <option value="">李四</option>
                    <option value="">王二</option>
                </select></td>
            </tr>
            <tr>
                <td></td>
                <td>需求概要：</td>
                <td>以下省略100字...</td>
            </tr>
        </table>
    </div>
</div>
<div id="win" class="easyui-window" closed="true" modal="true" title="任务分配情况" style="width:800px;height:500px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <table cellpadding="4" cellspacing="0" width=100% class="prjwin">
                <tr>
                    <td width="80"></td>
                    <td width="140">预研型号：</td>
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
                    <td>需求概要：</td>
                    <td>以下省略100字...</td>
                </tr>
                <tr>
                    <td></td>
                    <td>进度情况：</td>
                    <td>
                        <div style="width:160px;background:#fff;border:1px solid #ccc">
                            <div style="width:100px;background:red">60%</div>
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

