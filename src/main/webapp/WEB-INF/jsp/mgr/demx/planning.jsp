<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function() {
        $("#tt").tabs({
                    tools:[
                        {
                            iconCls:'icon-more',
                            text:'更多计划'
                        },
                        {
                            iconCls:'icon-search',
                            text:'任务查询',
                            handler: function() {
                                alert('已把选择的任务通知加入今日计划');
                            }
                        }
                    ]});
        $("#ptt").tabs({
                    tools:[
                        {
                            iconCls:'icon-more',
                            text:'自定义任务'
                        }
                    ]});
    });
</script>
<div class="mainspace">
    <div id="tt" style="width:1100px">
        <div title="计划任务安排" style="padding:10px;">
            <div style="width:600px;float: left;margin:0;padding:0;">
                <div class="easyui-calendar" style="width:600px;height:460px"></div>
            </div>
            <div style="float:right;width:460px">
                <div style="width:460px">
                    <table cellpadding="4" cellspacing="0">
                        <tr>
                            <td>
                                <span><a class="button" href="#" onclick="addp()"><span>增加新计划</span></a></span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="ptt" style="width:460px;height:420px">
                    <div title="未安排最新任务" style="padding:20px;">
                        <div class="tabui">
                            <ul>
                                <li>
                                    <span class="a">1</span>
                                <span class="a"><img src="${pageContext.request.contextPath}/static/images/icon/linedpaper32.png"
                                                     style="width:16px;height:16px;border:0"></span>
                                    <span class="n">任务001</span>
                                <span class="a"><img src="${pageContext.request.contextPath}/static/images/icon/star32.png"
                                                     style="width:16px;height:16px;border:0"></span>
                                    <span class="a">自由</span>
                                    <span class="o"><button>加入计划</button></span>
                                </li>
                                <li>
                                    <span class="a">2</span>
                                <span class="a"><img src="${pageContext.request.contextPath}/static/images/icon/linedpaper32.png"
                                                     style="width:16px;height:16px;border:0"></span>
                                    <span class="n">任务002</span>
                                <span class="a"><img src="${pageContext.request.contextPath}/static/images/icon/star32.png"
                                                     style="width:16px;height:16px;border:0"></span>
                                    <span class="a">自由</span>
                                    <span class="o"><button>加入计划</button></span>
                                </li>
                                <li>
                                    <span class="a">3</span>
                                <span class="a"><img src="${pageContext.request.contextPath}/static/images/icon/linedpaper32.png"
                                                     style="width:16px;height:16px;border:0"></span>
                                    <span class="n">任务003</span>
                                <span class="a"><img src="${pageContext.request.contextPath}/static/images/icon/star32.png"
                                                     style="width:16px;height:16px;border:0"></span>
                                    <span class="a">自由</span>
                                    <span class="o"><button>加入计划</button></span>
                                </li>
                                <li>
                                    <span class="a">4</span>
                                <span class="a"><img src="${pageContext.request.contextPath}/static/images/icon/linedpaper32.png"
                                                     style="width:16px;height:16px;border:0"></span>
                                    <span class="n">任务004</span>
                                <span class="a"><img src="${pageContext.request.contextPath}/static/images/icon/star32.png"
                                                     style="width:16px;height:16px;border:0"></span>
                                    <span class="a">自由</span>
                                    <span class="o"><button>加入计划</button></span>
                                </li>
                                <li>
                                    <span class="a">5</span>
                                <span class="a"><img src="${pageContext.request.contextPath}/static/images/icon/linedpaper32.png"
                                                     style="width:16px;height:16px;border:0"></span>
                                    <span class="n">任务005</span>
                                <span class="a"><img src="${pageContext.request.contextPath}/static/images/icon/star32.png"
                                                     style="width:16px;height:16px;border:0"></span>
                                    <span class="a">自由</span>
                                    <span class="o"><button>加入计划</button></span>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfloat">&nbsp;</div>
                        <div style="width:420px">
                            <table cellpadding="4" cellspacing="0">
                                <tr>
                                    <td>
                                        <span><a class="button" href="#" onclick="addp()"><span>加入今日</span></a></span>
                                        <span><a class="button" href="#" onclick="addp()"><span>加入选定</span></a></span>
                                        <span><a class="button" href="#" onclick="addp()"><span>删除</span></a></span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div title="已安排任务" style="padding:20px;">
                    </div>
                    <div title="已完成任务" style="padding:20px;">
                    </div>
                </div>
            </div>
        </div>
        <div title="计划任务记录查询" style="padding:20px;">
        </div>
        <div title="计划安排帮助" style="padding:20px;">
        </div>
    </div>
</div>





