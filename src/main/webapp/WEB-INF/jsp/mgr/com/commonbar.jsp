﻿<script type="text/javascript">
    $(function() {
        $("#bars").accordion({
                    select:'快捷工作方式',
                    height:440,
                    width:236
                });
    });
</script>
<div id="bars">
    <div title="快捷工作方式" iconCls="icon-quick" style="overflow:auto;padding:0;">
        <div class="accordion-listed">
            <ul>
                <li class="listpanel"><a href="javascript:void(0);"><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/calendar.png"><span>我的任务</span></a></li>
                <li class="listpanel"><a href="javascript:void(0);"><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/prj.png"><span>QFD项目查询</span></a>
                </li>
                <li class="listpanel"><a href="javascript:void(0);"  onclick='_project.create_project();'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/create.png"><span>构建QFD项目</span></a></li>
                <li class="listpanel"><a href="javascript:void(0);"  onclick='_project.show_def_projects();'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/form.png"><span>开始QFD分析</span></a>
                </li>
            </ul>
        </div>
    </div>
    <div title="QFD流程任务访问" iconCls="icon-flow" style="overflow:auto;padding:0;">
        <div class="accordion-listed">
            <ul>
                <li class="listpanel"><a href="javascript:void(0);" title='定义中' onclick='_project.show_def_projects();'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/calendar.png"><span>定义中设计任务</span></a></li>
                <li class="listpanel"><a href="javascript:void(0);" onclick='_project.show_input_projects();' title='处理中'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/prj.png"><span>处理中设计任务</span></a>
                </li>
                <li class="listpanel"><a href="javascript:void(0);" title='已结束'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/create.png"><span>已完成设计任务</span></a></li>
            </ul>
        </div>
    </div>
    <div title="QFD项目" iconCls="icon-prj" style="overflow:auto;padding:0;">
        <div class="accordion-listed">
            <ul>
                <li class="listpanel"><a href="javascript:void(0);"><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/calendar.png"><span>我的任务</span></a></li>
                <li class="listpanel"><a href="javascript:void(0);"><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/prj.png"><span>QFD项目查询</span></a>
                </li>
                <li class="listpanel"><a href="javascript:void(0);"><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/create.png"><span>构建QFD项目</span></a></li>
                <li class="listpanel"><a href="javascript:void(0);" title='定义中' onclick='_project.show_def_projects();'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/calendar.png"><span>定义中设计任务</span></a></li>
                <li class="listpanel"><a href="javascript:void(0);" onclick='_project.show_input_projects();' title='处理中'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/prj.png"><span>处理中设计任务</span></a>
                </li>
                <li class="listpanel"><a href="javascript:void(0);" title='已结束'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/create.png"><span>已完成设计任务</span></a></li>
            </ul>
        </div>
    </div>
    <div title="QFD分析设计工具" iconCls="icon-ant" style="overflow:auto;padding:0;">
        <div class="accordion-listed">
            <ul>
                <li class="listpanel"><a href="javascript:void(0);" title='选择模板' onclick='_project.show_templates(); '><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/calendar.png"><span>类似模板创建</span></a></li>
                <li class="listpanel"><a href="javascript:void(0);" title='编辑器' onclick='_project.create_project();'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/prj.png"><span>新建QFD模板</span></a>
                </li>
                <li class="listpanel"><a href="javascript:void(0);" title='编辑器' onclick='_project.create_project();'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/create.png"><span>构建QFD项目</span></a></li>
                <li class="listpanel"><a href="javascript:void(0);" title='定义中' onclick='_project.show_def_projects();'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/calendar.png"><span>定义中设计任务</span></a></li>
                <li class="listpanel"><a href="javascript:void(0);" onclick='_project.show_input_projects();' title='处理中'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/prj.png"><span>处理中设计任务</span></a>
                </li>
                <li class="listpanel"><a href="javascript:void(0);" title='已结束'><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/create.png"><span>已完成设计任务</span></a></li>

            </ul>
        </div>
    </div>
    <div title="组织与权限管理" iconCls="icon-org" style="overflow:auto;padding:0;">
        <div class="accordion-listed">
            <ul>
                <li class="listpanel"><a href="javascript:void(0);"><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/calendar.png"><span>我的任务</span></a></li>
                <li class="listpanel"><a href="javascript:void(0);"><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/prj.png"><span>QFD项目查询</span></a>
                </li>
                <li class="listpanel"><a href="javascript:void(0);"><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/create.png"><span>构建QFD项目</span></a></li>
                <li class="listpanel"><a href="javascript:void(0);"><img
                        src="${pageContext.request.contextPath}/static/js/themes/icons/form.png"><span>开始QFD分析</span></a>
                </li>
            </ul>
        </div>

    </div>
</div>