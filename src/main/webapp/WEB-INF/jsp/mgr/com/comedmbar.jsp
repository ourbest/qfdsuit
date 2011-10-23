<script>
    $(function() {
        var pp = $("#acc").accordion('panels');
        var t = pp[${layout.selectbar}].panel('options').title;
        $("#acc").accordion('select', t);
    });
</script>
<div id="acc" class="easyui-accordion" fit="true" border="false">
<div title="快速访问" selected="true" style="overflow:auto;">
    <div style="padding:4px;background:#EFEFEF;height:24px;line-height:24px;border-bottom:#ccc 1px solid"><img
            src="${pageContext.request.contextPath}/static/images/icon/search32.png" style="width:16px;height:16px;border:0"><input type="text" size="15">
        <button>搜索</button>
    </div>
    <div class="commonbar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pspace"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png"
                                                                                  style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">型号分类数据</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/dspace"><img src="${pageContext.request.contextPath}/static/images/icon/wand32.png"
                                                                                  style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">设计过程数据</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/vspace"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                  style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">指标分类数据</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/anstool"><img src="${pageContext.request.contextPath}/static/images/icon/spanner32.png"
                                                                                   style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">设计工具分类</span></a>
            </li>
        </ul>
    </div>
</div>
<div title="型号分类" style="overflow:auto;">
    <div class="commonbar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pspace"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png"
                                                                                  style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">型号构建</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/dflow"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">设计过程构建</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/prjlists"><img src="${pageContext.request.contextPath}/static/images/icon/notepencil32.png"
                                                                                    style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">型号项目管理构建</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/planning"><img src="${pageContext.request.contextPath}/static/images/icon/note32.png"
                                                                                    style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">型号任务管理</span></a>
            </li>
        </ul>
    </div>
</div>
<div title="项目计划" style="overflow:auto;">
    <ul class="easyui-tree" animate="true" dnd="true">
        <li>
            <span>飞行器</span>
            <ul>
                <li>
                    <span><a href="${pageContext.request.contextPath}/mgr/demx/prjview">型号产品001</a></span>
                </li>
                <li>
                    <span><a href="${pageContext.request.contextPath}/mgr/demx/prjview">型号产品002</a></span>
                </li>
                <li>
                    <span><a href="${pageContext.request.contextPath}/mgr/demx/prjview">型号产品003</a></span>
                </li>
                <li>
                    <span><a href="${pageContext.request.contextPath}/mgr/demx/prjview">型号产品004</a></span>
                </li>
            </ul>
        </li>
    </ul>
</div>
<div title="需求分析" style="overflow:auto;">
    <div class="commonbar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pdesign"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png"
                                                                                   style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">需求任务书</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/xfmc/reqdef"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png"
                                                                                  style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">需求分析</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/xfmc/techresult"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png"
                                                                                      style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">型号项目评估</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/xfmc/subpg"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">设计目标任务书</span></a>
            </li>
        </ul>
    </div>
</div>
<div title="方案设计" style="overflow:auto;">
    <ul class="easyui-tree" animate="true" dnd="true">
        <li>
            <span>总体方案</span>
            <ul>
                <li>
                    <span>型号产品001</span>
                    <ul>
                        <li>
                            <span>方案一</span>
                        </li>
                        <li>
                            <span>方案二</span>
                        </li>
                        <li>
                            <span>方案三</span>
                        </li>
                    </ul>
                </li>
                <li state="closed">
                    <span>型号产品002</span>
                    <ul>
                        <li>
                            <span>方案一</span>
                        </li>
                        <li>
                            <span>方案二</span>
                        </li>
                        <li>
                            <span>方案三</span>
                        </li>
                    </ul>
                </li>
                <li state="closed">
                    <span>型号产品003</span>
                    <ul>
                        <li>
                            <span>方案一</span>
                        </li>
                        <li>
                            <span>方案二</span>
                        </li>
                        <li>
                            <span>方案三</span>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</div>
<div title="方案指标参数" style="overflow:auto;">
    <div class="commonbar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/mgr/xfmc/techvalid"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png"
                                                                                     style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">指标分解</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/dref"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">指标关联定义</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/dmod"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">参数化模型定义</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/datamap"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                   style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">数据地图</span></a>
            </li>
        </ul>
    </div>
</div>
<div title="多学科验证" style="overflow:auto;">
    <div class="commonbar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">分析流程管理</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">分析流程定义</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">分析模型定义</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">In-House分析</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">第三方工具分析</span></a>
            </li>
        </ul>
    </div>
</div>
<div title="方案优化" style="overflow:auto;">
    <div class="commonbar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">优化流程管理</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">优化流程定义</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">优化模型定义</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">优化结果</span></a>
            </li>
        </ul>
    </div>
</div>
<div title="方案报告" style="overflow:auto;">
    <div class="commonbar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">设计目标报告</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">方案评估报告</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">方案设计报告</span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pview"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png"
                                                                                 style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">方案优化报告</span></a>
            </li>
        </ul>
    </div>
</div>
<div title="方案案例" style="overflow:auto;">
    <div class="commonbar">
        <ul>
            <li><a href="#"><img src="${pageContext.request.contextPath}/static/images/icon/box32.png" style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">型号案例查询管理</span></a>
            </li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/static/images/icon/gear32.png" style="width:16px;height:16px;border:0"><span
                    style="padding:0 0 0 10px">收藏方案</span></a>
            </li>
        </ul>
    </div>
</div>
</div>