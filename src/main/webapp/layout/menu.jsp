<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<style type="text/css">
    .mymenu {
        float: left;
        position: absolute;
        margin: 0;
        padding: 0;
        height: 40px;
        bottom: 0;
    }

    .mymenu ul {
        padding: 0;
        margin: 0;
        list-style: none;
    }

    .mymenu ul li {
        text-align: center;
        float: left;
        line-height: 40px;
        display: block;
        margin: 0px 10px 0px 4px;
        padding: 0px 0px 0px 0px;
    }

    .mymenu a {
        color: #000;
        font-size: 14px;
        font-weight: bold;
    }

    .mymenu a:hover {
        color: #ff9900;
    }

    #topmenu ul {
        padding: 0;
        margin: 0 auto;
        list-style: none;
    }

    #topmenu ul li {
        text-align: center;
        float: left;
        display: block;
        margin: 4px 10px 0px 4px;
        padding: 4px 0px 0px 0px;
    }

    #banner {
        height: 30px;
        position: relative;
        margin: 0;
        background: #FFFFFF url(${pageContext.request.contextPath}/static/images/logoback.png) no-repeat;
    }

    #title {
        height: 30px;
    }

    #title ul {
        padding: 0;
        margin: 0 0 0 0px;
        list-style: none;
    }

    #title ul li {
        text-align: center;
        float: left;
        display: block;
        line-height: 12px;
        margin: 4px 10px 0px 4px;
        padding: 4px 0px 0px 0px;
    }

    #title span {
        font-size: 18px;
        font-weight: bold
    }
</style>
<div id="banner">
    <div id="title" style="float:left">
        <c:if test="${role=='1'}">
            <ul>
                <li></li>
                <li><span>Missile-<SPAN style="color:green">D</SPAN></span><span style="color:red">E</span><span style="color:#4169e1;">M</span><span>X</span>
                </li>
                <li style="font-size:14px;font-weight:bold;color:#666">多学科综合研发平台(总设计师)</li>
                <li></li>
            </ul>
        </c:if>
        <c:if test="${role=='9'}">
            <ul>
                <li></li>
                <li><span>Missile-<SPAN style="color:green">D</SPAN></span><span style="color:red">E</span><span style="color:#4169e1;">M</span><span>X</span>
                </li>
                <li style="font-size:14px;font-weight:bold;color:#666">多学科综合研发平台(系统管理员)</li>
                <li></li>
            </ul>
        </c:if>
        <c:if test="${role=='8'}">
            <ul>
                <li></li>
                <li><span>Missile-<SPAN style="color:green">D</SPAN></span><span style="color:red">E</span><span style="color:#4169e1;">M</span><span>X</span>
                </li>
                <li style="font-size:14px;font-weight:bold;color:#666">多学科综合研发平台(总设计师)</li>
                <li></li>
            </ul>
        </c:if>
        <c:if test="${role=='7'}">
            <ul>
                <li></li>
                <li><span>Missile-<SPAN style="color:green">D</SPAN></span><span style="color:red">E</span><span style="color:#4169e1;">M</span><span>X</span>
                </li>
                <li style="font-size:14px;font-weight:bold;color:#666">多学科综合研发平台(设计师)</li>
                <li></li>
            </ul>
        </c:if>
        <c:if test="${role=='6'}">
            <ul>
                <li></li>
                <li><span>Missile-<SPAN style="color:green">D</SPAN></span><span style="color:red">E</span><span style="color:#4169e1;">M</span><span>X</span>
                </li>
                <li style="font-size:14px;font-weight:bold;color:#666">多学科综合研发平台(总指挥)</li>
                <li></li>
            </ul>
        </c:if>
    </div>
    <div id="topmenu" style="float:right">
        <ul>
            <li><img src="${pageContext.request.contextPath}/static/images/home.png"> <a href="${pageContext.request.contextPath}/mgr/xfmc/index">设计门户</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/static/images/org.png"> <a href="${pageContext.request.contextPath}/mgr/demxdir/org">组织资源</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/static/images/setting.png"> <a href="#">设置</a></li>
            <li><img src="${pageContext.request.contextPath}/static/images/help.png"> <a href="#">帮助</a></li>
            <li><img src="${pageContext.request.contextPath}/static/images/about.png"> <a href="#">关于</a></li>
            <li><img src="${pageContext.request.contextPath}/static/images/logout.png"> <a href="${pageContext.request.contextPath}/logout">退出</a></li>
        </ul>
    </div>
</div>
<div class="mymenu">
    <ul>
        <li style="padding:0px;margin:0px;width:12px;height:40px;background:#cc3300"></li>
        <c:if test="${role=='1'}">
            <li><a href="${pageContext.request.contextPath}/mgr/demx/task">设计任务</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/planner">计划管理</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pspace">型号构建</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/rspace">需求空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/dspace">设计空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/vspace">多学科分析空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/mdo">优化空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/case">型号案例</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/res/desdb">资源数据库</a></li>
        </c:if>
        <c:if test="${role=='9'}">
            <li><a href="${pageContext.request.contextPath}/mgr/xfmc/index">型号库</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/res/desdb">概念设计库</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/org/org">组织资源库</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/org/priv">权限管理</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/res/desdb">资源数据库</a></li>
        </c:if>
        <c:if test="${role=='8'}">
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pspace">型号构建</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/rspace">需求空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/dspace">设计空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/case">型号案例</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/res/desdb">资源数据库</a></li>
        </c:if>
        <c:if test="${role=='7'}">
            <li><a href="${pageContext.request.contextPath}/mgr/demx/vspace">多学科分析空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/mdo">优化空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/case">型号案例</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/res/desdb">资源数据库</a></li>
        </c:if>
        <c:if test="${role=='5'}">
            <li><a href="${pageContext.request.contextPath}/mgr/demx/dspace">设计空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/vspace">多学科分析空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/mdo">优化空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/case">型号案例</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/res/desdb">资源数据库</a></li>
        </c:if>
        <c:if test="${role=='6'}">
            <li><a href="${pageContext.request.contextPath}/mgr/demx/planner">计划管理</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/pspace">型号构建</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/rspace">需求空间</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/demx/case">型号案例</a></li>
            <li><a href="${pageContext.request.contextPath}/mgr/org/org">组织资源库</a></li>
        </c:if>
    </ul>
</div>