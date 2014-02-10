<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<script src='${CONTEXT_PATH}/newlayout/js/jquery/jquery-ajaxRequest.js' type="text/javascript"></script>


<fmt:message key="agora.process.create" var="createProcess" />
<fmt:message key="agora.process.emptylist" var="emptylist"/>
<fmt:message key="agora.process.area" var="area"/>
<fmt:message key="agora.process.title" var="title"/>
<fmt:message key="agora.process.variante" var="variante"/>

<script type="text/javascript">
	$(document).ready(function() {
		var widgetsContainer = document.getElementById('main-body');
		widgetsContainer.style.height = "80%";

		var menuTab = document.getElementById('MenuTab');

		var exists = $("#MenuTab li:contains('${createProcess}')").length > 0;
		if(!exists){
			var processesTabsScroller = document.getElementById('ProcessesTabsScroller');

			var li = document.createElement("li");

			var a = document.createElement('a');
			a.innerHTML = '${createProcess}';
		    a.href =  '#';
			a.onclick = function(){
				ajaxRequest('/newlayout/processeslist.do');
			}

			li.appendChild(a);

			menuTab.insertBefore(li,processesTabsScroller);
		}

		toggleTab('${createProcess}');
	});
</script>



<c:if test="${not empty processes}">
    <div id="Table">
        <table style="width: 50%; margin-left: auto; margin-right: auto; border-right: none; ">
            <thead>
                <tr>
                    <th>${area}</th>
                    <th>${title}</th>
                    <th>${variante}</th>
                </tr>
            </thead>

            <tbody>

                <c:set var="organica" value="" />
                <c:set var="title" value="" />
                <c:forEach var="process" items="${processes}">

                    <c:set var="variantes" value="${process.variantes}" />
                    <c:forEach var="variante" items="${variantes}">
                        <tr>
                            <c:choose>
                                <c:when test="${organica != process.organica}">
                                    <td>${process.organica}</td>
                                </c:when>
                                <c:otherwise><td></td></c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${title != process.title}">
                                    <td>${process.title}</td>
                                </c:when>
                                <c:otherwise><td></td></c:otherwise>
                            </c:choose>
                            <c:set var="organica" value="${process.organica}" />
                            <c:set var="title" value="${process.title}" />

                            <c:set var="url" value="${CONTEXT_PATH}${variante.link}&tipo=${variante.id}" />
                            <td><a href="#" onclick="simpleAjaxRequest('${url}','main-body','body')">${variante.title}</td>

                        </tr>
                    </c:forEach>

                </c:forEach>

            </tbody>

        </table>
    </div>
</c:if>

<c:if test="${empty processes}">${emptylist}</c:if>
