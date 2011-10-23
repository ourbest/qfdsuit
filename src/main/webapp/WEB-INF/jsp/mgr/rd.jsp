<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='role' value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.role}"/>
<script type="text/javascript">
    <c:choose>
    <c:when test="${role=='1'}">
    this.location = "${pageContext.request.contextPath}/mgr/qfd/task";
    </c:when>
    <c:when test="${role=='8'}">
    this.location = "${pageContext.request.contextPath}/mgr/demx/pspace";
    </c:when>
    <c:when test="${role=='7'}">
    this.location = "${pageContext.request.contextPath}/mgr/demx/task";
    </c:when>
    <c:when test="${role=='6'}">
    this.location = "${pageContext.request.contextPath}/mgr/demx/planner";
    </c:when>
    <c:otherwise>
    this.location = "${pageContext.request.contextPath}/mgr/demx/task";
    </c:otherwise>
    </c:choose>
</script>