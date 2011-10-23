<script>
    $(function(){
			$('#qdwxjz').treegrid({
				title:'气动外形矩阵',
				iconCls:'icon-save',
				width:900,
				height:700,
				nowrap: false,
				rownumbers: true,
				animate:true,
				collapsible:true,
				url:'${pageContext.request.contextPath}/ajax/xfmc/qdwxjz_data',
				idField:'characteristics',
				treeField:'characteristics',
				frozenColumns:[[
	                {title:'',field:'characteristics',width:200,
		                formatter:function(value){
		                	return '<span style="color:red">'+value+'</span>';
		                }
	                }
				]],
				columns:[[
					{field:'dddj2a',title:'导弹大径2a',width:120},
					{field:'ddxj2b',title:'导弹小径2b',width:120,rowspan:2},
					{field:'tbcd',title:'头部长度',width:100,rowspan:2},
                    {field:'tbdd',title:'头部钝度',width:120,rowspan:2},
                    {field:'ddcd',title:'导弹长度',width:120,rowspan:2},

					{field:'dy',title:'弹翼',width:150,rowspan:2},
                    {field:'dysl',title:'弹翼数量',width:120},
					{field:'dyfjj',title:'弹翼附加角',width:120,rowspan:2},
					{field:'dypmmj',title:'弹翼平面面积',width:100,rowspan:2},
                    {field:'zdhdxc',title:'最大厚度弦长',width:120,rowspan:2},
                    {field:'dyqypmj',title:'弹翼前缘剖面角',width:120,rowspan:2},
					{field:'dyzxb',title:'弹翼展弦比',width:150,rowspan:2},
                    {field:'dyqywz',title:'弹翼前缘位置',width:120},
					{field:'dysgb',title:'弹翼梢根比',width:120,rowspan:2},

					{field:'wy',title:'尾翼',width:100,rowspan:2},
                    {field:'wybyz',title:'尾翼半翼展',width:120,rowspan:2},
                    {field:'wygx',title:'尾翼根弦',width:120,rowspan:2},
					{field:'wysx',title:'尾翼梢弦',width:150,rowspan:2},
                    {field:'wyhlj',title:'尾翼后掠角',width:120},
					{field:'wypjqdxc',title:'尾翼平均气动弦长',width:120,rowspan:2},
					{field:'wyqdzx1',title:'尾翼气动中心（从尾翼平均气动弦）',width:100,rowspan:2},
                    {field:'wyqdzx2',title:'尾翼气动中心（从弹头起）',width:120,rowspan:2},
                    {field:'wymj',title:'尾翼面积',width:120,rowspan:2},
					{field:'wyyxwz',title:'尾翼压心位置（丫）Cp（从翼根起）',width:150,rowspan:2},
				]],
				onContextMenu: function(e,row){
					e.preventDefault();
					$(this).treegrid('unselectAll');
					$(this).treegrid('select', row.code);
					$('#mm').menu('show', {
						left: e.pageX,
						top: e.pageY
					});
				}
			});
		});
    function showdoc() {
        $("#win").window("open");
    }

    function save() {
        alert("技术规格定义保存成功...");
    }
    function next() {
        location.href = "${pageContext.request.contextPath}/mgr/xfmc/qdParamdata";
    }
</script>
<div style="margin:0 auto;padding:10px;">
    <ul id="mainNav3" class="threeStep">
        <li class="lastDone"><a title=""><em>1: 需求定义</em><span>对原始需求和竞争进行定义</span></a></li>
        <li class="current"><a title=""><em>2: 型号产品技术规格</em><span>选择产品可用方案和设定设计目标</span></a></li>
        <li class="mainNavNoBg"><a title=""><em>3: 冻结方案及指标分解</em><span>冻结产品需求及技术特征定义</span></a></li>
    </ul>
</div>
<div class="clearfloat">&nbsp;</div>
<div class="mainspace">
    <table cellpadding="4" cellspacing="0" width="920">
        <tr>
            <td>
                <button onclick="save()">保存技术规格定义</button>
            </td>
            <td align="right">
                <button onclick="next()">>>需求技术规格关系定义</button>
                <button onclick="showdoc()">查看需求任务书</button>
            </td>
        </tr>
    </table>
</div>
<div class="mainspace">
    <div style="width:920">
        <table id="qdwxjz"></table>
    </div>
</div>

<div id="win" class="easyui-window" closed="true" modal="true" title="型号产品结构查看窗口" style="width:800px;height:500px;">
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




