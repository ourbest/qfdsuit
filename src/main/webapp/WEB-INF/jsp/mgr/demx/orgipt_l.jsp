<script>
    $(function() {
        $('#acs').datagrid({
                    height:'auto',
                    url:'${pageContext.request.contextPath}/ajax/demx/prtinfo_data',
                    columns:[
                        [
                            {field:'ck',width:80,checkbox:true},
                            {field:'name',title:'姓名',width:140,
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
    <div title="机构与组织" style="overflow:auto;">
        <div style="padding:4px;background:#EFEFEF;height:24px;line-height:24px;border-bottom:#ccc 1px solid"><img
                src="${pageContext.request.contextPath}/static/images/icon/search32.png" style="width:16px;height:16px;border:0"><input type="text"  size="15">
            <button>搜索</button>
        </div>
        <ul class="easyui-tree" animate="true" dnd="true">
            <li>
                <span>研发中心</span>
                <ul>
                    <li>
                        <span>管理层</span>
                        <ul>
                            <li><span>主任</span></li>
                            <li><span>总指挥</span></li>
                        </ul>
                    </li>
                    <li>
                        <span>总师</span>
                        <ul>
                            <li><span>总设计师</span></li>
                            <li><span>分系统</span></li>
                        </ul>
                    </li>
                    <li>
                        <span>多学科</span>
                        <ul>
                            <li><span>结构</span></li>
                            <li><span>气动</span></li>
                        </ul>
                    </li>
                    <li state="closed">
                        <span>优化</span>
                        <ul>
                            <li><span>总师</span></li>
                            <li><span>气动</span></li>
                        </ul>
                    </li>
                    <li state="closed">
                        <span>数字机</span>
                        <ul>
                            <li><span>总师</span></li>
                            <li><span>总体</span></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
        <div style="padding:4px;background:#EFEFEF;height:24px;line-height:24px;border:#ccc 1px solid">
            人员列表
        </div>
        <table id="acs"></table>
    </div>
</div>