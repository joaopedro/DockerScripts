<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
LEGACY CODE

<div class="row formlabel_sf" >
 		<div class="leftTab label textoBold" style="width: 18%;" title="${fieldEntry.key.label}">
 		${fieldEntry.key.label}:
 	</div> 
<div class="label formtext_sf" style="width: 75%;" title="${fieldEntry.key.label}">
	<c:choose>
		<c:when test="${fieldEntry.key.type == 'RADIOINPUT' || fieldEntry.key.type == 'COMBOBOX'}">
			<c:forEach items="${fieldEntry.key.options}" var="option">
				<c:if test="${option.value == fieldEntry.value.value}">
					${option.label}
				</c:if>
			</c:forEach>
		</c:when>
		<c:when test="${fieldEntry.key.type == 'MORADA'}">
			<c:if test="${not empty fieldEntry.value.value}">
				<span id="${fieldEntry.key.siglaId}_label">loading...</span>
				<script>
				new Ajax.Updater( {success: '${fieldEntry.key.siglaId}_label'}, 'moradaPopupLocaleAware.do2?method=getLabel', 
						{method: 'get', parameters: 'id=${fieldEntry.value.value}'});
				</script>
			</c:if>
		</c:when>
		<c:otherwise>
			${fieldEntry.value.value}	
			</c:otherwise>
		</c:choose>
	</div>
</div>

--%>