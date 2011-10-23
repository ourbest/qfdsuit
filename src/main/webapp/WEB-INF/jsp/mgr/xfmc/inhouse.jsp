<script>
    $(function() {
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
    <div title="In-House工具进行求解" style="padding:20px;overflow:auto;">
        <table width="90%" border="0" cellspacing="0" cellpadding="8">
            <tr>
                <td width="100"><img src="/static/images/inhouse.png"></td>
                <td colspan="2" style="border-bottom:dotted 1px black"><span style="color:red;font-size:14px">In-House求解器：用于求解气动问题 | <a
                        href="a">获得帮助</a></span></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td width="80">输入参数</td>
                <td><input type="text" size="60"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>参数：</td>
                <td><input type="text" size="60"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>参数：</td>
                <td><input type="text" size="60"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>参数：</td>
                <td><input type="file" size="40"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2" style="border-bottom:dotted 1px black">
                    <a class="button" href="#"><span>保存此参数>></span></a>
                    <a class="button" href="#"><span>开始计算>></span></a>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>查看计算结果</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">
                    <a class="button" href="#"><span>保存结果为Excel文件并下载>></span></a>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2" style="border-bottom:dotted 1px black">
                    <a class="button" href="#"><span>保存结果为TXT文件并下载>></span></a>
                </td>
            </tr>
        </table>
    </div>
    <div title="In-House工具在线帮助" style="padding:20px;">
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

