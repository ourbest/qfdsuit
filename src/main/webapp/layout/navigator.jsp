<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='realname' value='${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.realname}'/>
<c:set var='role' value='${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}'/>
<script type="text/javascript">
    function query(value, name) {
        alert(value + ":" + name)
    }

    function logout()
    {
        location.href="${pageContext.request.contextPath}/logout";
    }
</script>
<header>
    <div class="topline"></div>
    <div class="lyheader">
        <div class="mainbar">
            <div class="holdbar">
                <ul>
                    <li><img src="${pageContext.request.contextPath}/static/images/home16.png" alt="首页"></li>
                    <li><img src="${pageContext.request.contextPath}/static/images/setting16.png" alt="设置"></li>
                    <li><img src="${pageContext.request.contextPath}/static/images/help16.png" alt="帮助"></li>
                    <li><img src="${pageContext.request.contextPath}/static/images/about16.png" alt="关于"></li>
                </ul>
            </div>
            <c:if test="${!empty role}">
            <div class="userbar"><img src="${pageContext.request.contextPath}/static/images/user16.png" alt="用户"> | ${realname}</div>
            <div class="logon"><a id="add" href="#" class="easyui-linkbutton l-btnf" iconCls="icon-out" onclick="logout()">退出系统</a></div>
            </c:if>
        </div>
        <div class="menuview">
            <div class="breadCrumbHolder">
                <div id="breadcrumb" class="breadCrumb">
                    <ul>
                        <li>
                            <a href="#">QFD开始</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="srchbox">
                <input class="easyui-searchbox"
                       searcher="query"
                       prompt="输入查询关键字" menu="#mm" style="width:300px">
            </div>
            <div id="mm" style="width:120px">
                <div name="all" iconCls="icon-ok">所有关键字</div>
                <div name="prj">项目关键字</div>
                <div name="forms">表单关键字</div>
            </div>
        </div>
    </div>
</header>