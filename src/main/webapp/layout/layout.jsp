<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!empty layout.rputs}">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <c:if test="${layout.rputs['header']!=null}">
        <jsp:include page="${layout.rputs['header']}"/>
    </c:if>
    <body>
    <c:if test="${layout.rputs['navigator']!=null}">
        <jsp:include page="${layout.rputs['navigator']}"/>
    </c:if>
    <sidebar>
        <div class="lysidebar">
            <div class="logoview">
                <div class="logoblock"></div>
                <div class="l_shadow"></div>
                <div class="logo"></div>
                <c:if test="${layout.rputs['toolbar']!=null}">
                    <jsp:include page="${layout.rputs['toolbar']}"/>
                </c:if>
                <div class="clearfloat"></div>
                <div class="sidebar">
                    <c:if test="${layout.rputs['sidebar']!=null}">
                        <jsp:include page="${layout.rputs['sidebar']}"/>
                    </c:if>
                    <div class="sidebarbord"></div>
                </div>
            </div>
            <div class="ld_shadow"></div>
        </div>
    </sidebar>
    <c:if test="${layout.rputs['body']!=null}">
        <maintainer>
            <div class="lycontent">
                <div class="wrapper">
                    <jsp:include page="${layout.rputs['body']}"/>
                </div>
            </div>
        </maintainer>
    </c:if>
    <c:if test="${layout.rputs['footer']!=null}">
        <jsp:include page="${layout.rputs['footer']}"/>
    </c:if>
    <c:if test="${layout.rputs['quicktips']!=null}">
        <jsp:include page="${layout.rputs['quicktips']}"/>
    </c:if>
    </body>
    </html>
</c:if>