<script>
    $(function() {
        $('#acs').datagrid({
                    height:'auto',
                    url:'${pageContext.request.contextPath}/ajax/demx/prtinfo_data',
                    columns:[
                        [
                            {field:'ck',width:80,checkbox:true},
                            {field:'name',title:'分析流程模板',width:140,
                                formatter:function(value, rec) {
                                    return ''
                                }
                            }                        ]
                    ],
                    rownumbers:true
                });
    });
</script>
<div class="easyui-accordion" fit="true" border="false">
    <div title="分析流程模板分类" style="overflow:auto;">
        <div style="padding:4px;background:#EFEFEF;height:24px;line-height:24px;border-bottom:#ccc 1px solid"><img
                src="${pageContext.request.contextPath}/static/images/icon/search32.png" style="width:16px;height:16px;border:0"><input type="text" size="15">
            <button>搜索</button>
        </div>
        <ul class="easyui-tree" animate="true" dnd="true">
            <li>
                <span>飞行器</span>
                <ul>
                    <li>
                        <span>方案设计</span>
                        <ul>
                            <li><span>总体参数</span></li>
                            <li><span>总体设计</span></li>
                        </ul>
                    </li>
                    <li>
                        <span>指标设计</span>
                        <ul>
                            <li><span>结构</span></li>
                            <li><span>气动</span></li>
                            <li><span>推进</span></li>
                        </ul>
                    </li>
                    <li state="closed">
                        <span>多学科验证</span>
                        <ul>
                            <li><span>结构</span></li>
                            <li><span>气动</span></li>
                        </ul>
                    </li>
                    <li state="closed">
                        <span>方案论证</span>
                        <ul>
                            <li><span>总师</span></li>
                            <li><span>总体</span></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
        <div style="padding:4px;background:#EFEFEF;height:24px;line-height:24px;border:#ccc 1px solid">
            分析流程模板列表
        </div>
        <table id="acs"></table>
    </div>
</div>