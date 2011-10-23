<script>
    $(function() {
        $('#sresult').datagrid({
                    title:'可优化参数定义',
                    url:'${pageContext.request.contextPath}/ajax/xfmc/fmc_data',
                    sortName: 'scode',
                    remoteSort: false,
                    idField:'scode',
                    frozenColumns:[
                        [
                            {field:'sck',checkbox:true},
                            {title:'编码',field:'scode',width:80,sortable:true}
                        ]
                    ],
                    columns:[
                        [
                            {title:'可调整参数',colspan:6}
                        ],
                        [
                            {field:'sname',title:'参数名称',width:200},
                            {field:'stype',title:'参数类型',width:120,rowspan:2},
                            {field:'svalue',title:'参数值',width:100,rowspan:2},
                            {field:'sopt',title:'是否优化',width:100,rowspan:2},
                            {field:'sdown',title:'下限值',width:100,rowspan:2},
                            {field:'sup',title:'上限值',width:100,rowspan:2}
                        ]
                    ],
                    pagination:true,
                    rownumbers:true
                });
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
                        height:400
                    }  });
    });
    function showCAD() {
        $('#win').window('open');
    }

    function updatew() {
        $('#updatew').window('open');
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
<div class="easyui-tabs" fit="true" border="false">
    <div title="网格模型验证" style="overflow:auto;">
        <div id="mv" class="mainspace">
            <table cellpadding="4" cellspacing="0" width="950">
                <tr>
                    <td>
                        <a class="button" href="#" onclick="updatew()"><span>新创建Mesh</span></a>
                        <a class="button" href="#" onclick="showCAD()"><span>Mesh模型查看</span></a>
                        <a class="button" href="#"><span>保存概念模型参数>></span></a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="mainspace">
            <div style="width:950px">
                <table id="sresult"></table>
            </div>
        </div>
    </div>
    <div title="网格模型在线帮助">
        <br/>
        <table width="100%" border="0" cellspacing="0" cellpadding="8">
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">
                    <input type="text" value="输入型号名称" style="width:400px;height:30px">
                    <button>开始搜索</button>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">
                    借助世界领先的二维和三维设计软件之一——AutoCAD®软件中强大、灵活的功能，实现卓越的设计和造型。28年来，Autodesk一直在坚持不懈地帮助客户提高设计流程效率。AutoCAD提供了可靠的三维自由形状设计工具以及强大的绘图和文档制作功能，在全球拥有数百万用户。
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2" style="border-bottom:dotted 1px black"><p>设计各种形状</p>

                    <p>加快文档编制速度，更精确地共享设计方案，更直观地在三维环境中探索设计创意。</p>

                    <p>现在，您可以让设计走得更远。AutoCAD的时代已经到来。</p>

                    <p><strong>AutoCAD产品系列</strong></p>

                    <p>选择适合您所在行业和专业的AutoCAD软件。</p>

                    <p>借 助世界领先的二维和三维设计软件之一——AutoCAD®软件中强大、灵活的功能，实现卓越的设计和造型。28年来，Autodesk一直在坚持不懈地帮
                        助客户提高设计流程效率。AutoCAD提供了可靠的三维自由形状设计工具以及强大的绘图和文档制作功能，在全球拥有数百万用户。</p>

                    <p><strong>加速文档编制</strong></p>

                    <p>借助AutoCAD中强大的文档编制工具，您可以加速项目从概念到完成的过程。自动化、管理和编辑工具能够最大限度地减少重复性工作，提升您的工作效率。无论项目规模和范围如何，AutoCAD都能够帮助您轻松应对挑战。</p>

                    <p>AutoCAD中种类丰富的工具集可以帮助您在任何一个行业的绘图和文档编制流程中提高效率。</p>
                    <ul>
                        <li><strong>参数化绘图——</strong>定义对象间的关系。</li>
                        <li><strong>图纸集——</strong>有效整理和管理您的图纸。</li>
                        <li><strong>动态块——</strong>使用标准的重复组件，显著节约时间。</li>
                        <li><strong>标注比例——</strong>节约用于确定和调整标注比例的时间。</li>
                    </ul>
                    <p>追求卓越，永不满足。依靠AutoCAD中的绘图和文档编制工具超越客户期望。</p>

                    <p><strong>探索设计创意</strong></p>

                    <p>AutoCAD 支持您灵活地以二维和三维方式探索设计创意，并且提供了直观的工具帮助您实现创意的可视化和造型，将创新理念变为现实。</p>
                    <ul>
                        <li><strong>三维自由形状设计——</strong>使用曲面、网格和实体建模工具探索并改进您的创意。</li>
                        <li><strong>强大的可视化工具——</strong>让您的设计更具影响力。</li>
                        <li><strong>三维导航工具——</strong>在模型中漫游或飞行。</li>
                        <li><strong>点云支持——</strong>将三维激光扫描图导入AutoCAD，加快改造和重建项目的进展。</li>
                    </ul>
                    <p>这个世界就是您的画布，您将如何挥洒自己的创意？</p>

                    <p><strong>参数化绘图</strong></p>

                    <p>有了参数化绘图工具，设计修订变得轻而易举。</p>

                    <p><strong>三维自由形状设计</strong></p>

                    <p>利用三维曲面、网格和实体建模工具自由探索设计创意。</p>

                    <p><strong>三维打印支持</strong></p>

                    <p>现在，您不仅仅能够实现设计的可视化，还能将其变为现实。</p>

                    <p>“整个设计过程我都使用AutoCAD完成。”</p></td>
            </tr>
        </table>
    </div>
</div>

<div id="win" class="easyui-window" closed="true" modal="true" title="CAE模型查看" style="width:640px;height:440px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <img src="${pageContext.request.contextPath}/static/images/caeview.png">
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="viwclose()">确定</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>
<div id="updatew" class="easyui-window" closed="true" modal="true" title="CAE模型创建" style="width:810px;height:480px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <img src="${pageContext.request.contextPath}/static/images/mesh.png">
        </div>
        <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="viwclose()">确定</a>
            <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="viwclose()">取消</a>
        </div>
    </div>
</div>
