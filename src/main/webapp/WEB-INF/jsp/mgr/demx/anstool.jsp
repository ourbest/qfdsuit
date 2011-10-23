<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script>
    $(function() {
        $("#tt").tabs({
                    tools:[
                        {
                            iconCls:'icon-add',
                            text:'增加工具'
                        },
                        {
                            iconCls:'icon-remove',
                            text:'注销工具'
                        }
                    ]});
    });
    function viewprj() {
        $('#win').window('open');
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
        <div title="CAD工具" style="padding:10px;">
            <div class="tiles">
                <ul>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cad.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cad.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cad.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cad.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cad.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cad.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cad.png" style="border: #ccc solid 1px"></a>
                    </li>
                </ul>
            </div>
            <br/>
        </div>
        <div title="网格分析工具" style="padding:10px;">
            <div class="tiles">
                <ul>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cae.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cae.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cae.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cae.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cae.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cae.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/cae.png" style="border: #ccc solid 1px"></a>
                    </li>
                </ul>
            </div>
            <br/>
        </div>
        <div title="多学科分析工具" style="padding:10px;">
            <div class="tiles">
                <ul>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/ans.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/ans.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/ans.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/ans.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/ans.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/ans.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/ans.png" style="border: #ccc solid 1px"></a>
                    </li>
                </ul>
            </div>
            <br/>
        </div>
        <div title="后处理工具" style="padding:10px;">
            <div class="tiles">
                <ul>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/proc.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/proc.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/proc.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/proc.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/proc.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/proc.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/proc.png" style="border: #ccc solid 1px"></a>
                    </li>
                </ul>
            </div>
            <br/>
        </div>
        <div title="优化工具" style="padding:10px;">
            <div class="tiles">
                <ul>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/mdo.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/mdo.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/mdo.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/mdo.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/mdo.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/mdo.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/mdo.png" style="border: #ccc solid 1px"></a>
                    </li>
                </ul>
            </div>
            <br/>
        </div>
        <div title="FAV手册" style="padding:10px;">
            <div class="tiles">
                <ul>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/fav.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/fav.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/fav.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/fav.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/fav.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/fav.png" style="border: #ccc solid 1px"></a>
                    </li>
                    <li><a href="#" onclick="showp()"><img src="${pageContext.request.contextPath}/static/images/tiles/fav.png" style="border: #ccc solid 1px"></a>
                    </li>
                </ul>
            </div>
            <br/>
        </div>
    </div>
    <br/>

    <div id="mv" style="display:none;">
        <div class="srch">
            设计和分析工具简介
        </div>
        <div class="srchcxt">
            <table cellpadding="4" cellspacing="0" class="prjwin">
                <tr>
                    <td width="80"></td>
                    <td width="140">工具：</td>
                    <td>设计工具</td>
                    <td></td>
                </tr>
                <tr>
                    <td rowspan="4" valign="top"><img src="${pageContext.request.contextPath}/static/images/tiles/cad.png"></td>
                    <td>启动工具：</td>
                    <td><a class="button" href="#" onclick="showSys()"><span>启动本地工具</span></a></td>
                    <td></td>
                </tr>
                <tr>
                    <td>下载本工具：</td>
                    <td><a class="button" href="#" onclick="showSys()"><span>安装本地工具</span></a></td>
                    <td></td>
                </tr>
                <tr>
                    <td>工具用途：</td>
                    <td>几何设计</td>
                    <td></td>
                </tr>
                <tr>
                    <td>工具简介：</td>
                    <td>
                    <span> • AutoCAD®——通用设计<br/>
      • AutoCAD LT®——专业的二维绘图和详图设计<br/>
      • AutoCAD® Mechanical——机械设计<br/>
      • AutoCAD® Electrical——电气控制设计<br/>
      • AutoCAD® Map 3D——空间数据创建和管理<br/>
      • AutoCAD® P&amp;ID——工艺流程设计</span>
                    </td>
                    <td></td>
                </tr>
            </table>

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




