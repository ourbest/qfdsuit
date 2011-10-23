<script>
    $(function() {
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
        alert("型号方案保存成功...");
    }
    function tovalid() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/techvalid";
    }
    function subdes() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/subsplit";
    }
</script>
<div class="navstep">
    <div class="stepview">
        <div class="tips"><a href="#" id="tooltips"><img src="${pageContext.request.contextPath}/static/images/toptips.png" border="0"></a>
        </div>
        <ul id="mainNav" class="threeStep">
            <li class="current"><a title=""><em>1: 方案选型</em><span>针对技术规格选型相应的设计方案</span></a></li>
            <li class=""><a title=""><em>2: 技术指标分解</em><span>进行分系统技术指标设计定义</span></a></li>
            <li class="mainNavNoBg"><a title=""><em>3: 方案确定</em><span>通过指标分解确定方案细节</span></a></li>
        </ul>
    </div>
</div>
<div class="clearfloat">&nbsp;</div>
<div class="mainspace">
    <table cellpadding="4" cellspacing="0" width="950">
        <tr>
            <td>
                <a class="button" href="#" onclick="save()"><span>保存设计方案</span></a>
            </td>
            <td style="float:right">
                <a class="button" href="#" onclick="tovalid()"><span>方案原理级验证</span></a>
                <a class="button" href="#" onclick="subdes()"><span>分系统指标分解>></span></a>
                <a class="button" href="#" onclick="showdoc()"><span>参考型号质量屋</span></a>
            </td>
        </tr>
    </table>
</div>
<div class="mainspace" style="width:950px">
<div style="float:left;width:400px;height:410px;border:#000 1px solid;">
    <div style="margin: 0;padding:4px;height:30px;line-height:30px;font-size:14px;background: #EFEFEF;border-bottom: #000 1px solid">
        可选择导弹指标设计模板
    </div>
    <div style="height:350px;margin:0;padding:10px;overflow:auto">
        <ul id="temp" class="easyui-tree" animate="true" dnd="true">
            <li><span>战术导弹</span>
                <ul>
                    <li><span>地对地</span>
                        <ul>
                            <li>
                                <span>型号产品001</span>
                                <ul>
                                    <li>
                                        <span>总体系统</span>
                                        <ul>
                                            <li>
                                                <span>总体设计</span>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span>分系统</span>
                                        <ul>
                                            <li>
                                                <span>气动系统</span>
                                            </li>
                                            <li>
                                                <span>推进系统</span>
                                            </li>
                                            <li>
                                                <span>重量</span>
                                            </li>
                                            <li>
                                                <span>飞行性能</span>
                                            </li>
                                            <li>
                                                <span>品质要素与发射平台集成</span>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li state="closed">
                                <span>型号产品002</span>
                                <ul>
                                    <li>
                                        <span>总体系统</span>
                                        <ul>
                                            <li>
                                                <span>总体设计</span>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span>分系统</span>
                                        <ul>
                                            <li>
                                                <span>气动系统</span>
                                            </li>
                                            <li>
                                                <span>推进系统</span>
                                            </li>
                                            <li>
                                                <span>重量</span>
                                            </li>
                                            <li>
                                                <span>飞行性能</span>
                                            </li>
                                            <li>
                                                <span>品质要素与发射平台集成</span>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li state="closed"><span>地对空</span>
                        <ul>
                            <li>
                                <span>型号产品001</span>
                                <ul>
                                    <li>
                                        <span>总体系统</span>
                                        <ul>
                                            <li>
                                                <span>总体设计</span>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span>分系统</span>
                                        <ul>
                                            <li>
                                                <span>气动系统</span>
                                            </li>
                                            <li>
                                                <span>推进系统</span>
                                            </li>
                                            <li>
                                                <span>重量</span>
                                            </li>
                                            <li>
                                                <span>飞行性能</span>
                                            </li>
                                            <li>
                                                <span>品质要素与发射平台集成</span>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li state="closed"><span>空对空</span>
                        <ul>
                            <li>
                                <span>型号产品001</span>
                                <ul>
                                    <li>
                                        <span>总体系统</span>
                                        <ul>
                                            <li>
                                                <span>总体设计</span>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span>分系统</span>
                                        <ul>
                                            <li>
                                                <span>气动系统</span>
                                            </li>
                                            <li>
                                                <span>推进系统</span>
                                            </li>
                                            <li>
                                                <span>重量</span>
                                            </li>
                                            <li>
                                                <span>飞行性能</span>
                                            </li>
                                            <li>
                                                <span>品质要素与发射平台集成</span>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li state="closed"><span>空对地</span>
                        <ul>
                            <li>
                                <span>型号产品001</span>
                                <ul>
                                    <li>
                                        <span>总体系统</span>
                                        <ul>
                                            <li>
                                                <span>总体设计</span>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span>分系统</span>
                                        <ul>
                                            <li>
                                                <span>气动系统</span>
                                            </li>
                                            <li>
                                                <span>推进系统</span>
                                            </li>
                                            <li>
                                                <span>重量</span>
                                            </li>
                                            <li>
                                                <span>飞行性能</span>
                                            </li>
                                            <li>
                                                <span>品质要素与发射平台集成</span>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<div style="float:left;width:80px;padding:20px 20px 0 20px;">
    <img src="${pageContext.request.contextPath}/static/images/arrow.png" style="width:80px">
    <br>
    对应需求技术特征目标，填写方案总体技术指标<br/>
    <img src="${pageContext.request.contextPath}/static/images/arrow.png" style="width:80px">
</div>
<div style="float:right;width:400px;height:410px;border:#000 1px solid;">
    <div style="margin: 0;padding:4px;height:30px;line-height:30px;font-size:14px;background: #EFEFEF;border-bottom: #000 1px solid">
        目标导弹设计模板
    </div>
    <div style="height:350px;margin:0;padding:10px;overflow:auto">
        <ul id="tar" class="easyui-tree" animate="true" dnd="true">
            <li>
                <span>总体系统</span>
                <ul>
                    <li>
                        <span>总体设计</span>
                    </li>
                </ul>
            </li>
            <li>
                <span>分系统</span>
            </li>
        </ul>
    </div>
</div>
</div>
<div class="clearfloat">&nbsp;</div>
<br/>

<div id="win" class="easyui-window" closed="true" modal="true" title="型号产品结构查看窗口" style="width:800px;height:600px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
            <div style="margin:0 auto;padding:10px">
                <img src="${pageContext.request.contextPath}/static/images/qfdh.png">
            </div>
        </div>
    </div>
</div>




