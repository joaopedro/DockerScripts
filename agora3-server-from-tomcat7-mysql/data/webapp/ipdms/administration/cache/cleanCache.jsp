<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

	<div class="row" style="padding-bottom:20px;">
		${message }
	</div>
	<div class="row" style="padding-bottom:20px;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.cache.menu.clean" />">
			<a href="${pageContext.request.contextPath}/cleanCache.do2?method=cleanMenu" title="<fmt:message key='ipdms.cache.menu.clean' />">
				<fmt:message key="ipdms.cache.menu.clean" />
			</a>		
	  	</div>
	</div>