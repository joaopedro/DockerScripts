<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="processo.priority.increase" var="priorityIncrease" />
<fmt:message key="processo.priority.decrease" var="priorityDecrease" />

<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.notification.header.priority' />">
	<span class="textoBold">
		<fmt:message key="ipdms.notification.header.priority" />
	</span>
</div>
<div class="label" style="width: 10%;" title="<fmt:message key='ipdms.notification.header.priority' />">
	<fmt:message key="${sop.priority.resourceKey}" />
</div>
<div class="label" style="width: 50%;" title="<fmt:message key='ipdms.notification.header.priority' />">
	<c:if test="${sop.priority != 'HIGH'}">
		<c:url var="link" value="servicoOnlinePriority.do2">
			<c:param name="numero" value="${sop.id.numeroConteudo}" />
			<c:param name="method" value="increase"></c:param>
		</c:url>
		(<a href="#" onclick="changePriority('${link}');" class="texto">${priorityIncrease}</a>)
	</c:if>
	<c:if test="${process.servicoOnline.priority != 'LOW'}">
		<c:url var="link" value="servicoOnlinePriority.do2">
			<c:param name="numero" value="${sop.id.numeroConteudo}" />
			<c:param name="method" value="decrease"></c:param>
		</c:url>
	    (<a href="#" onclick="changePriority('${link}');" class="texto">${priorityDecrease}</a>)
	</c:if>
</div>