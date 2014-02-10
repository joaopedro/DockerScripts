<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.atencaoMsg" var="atencaoMsg" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.emptyRecords" var="emptyRecords" bundle="${calendarioBundle}" />
<fmt:message key="calendario.edit.ano" var="anoDes" bundle="${calendarioBundle}" />
<fmt:message key="calendario.edit.descricao" var="des" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.forms.editar" var="editarDes" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.forms.gerir" var="gerirDes" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.activo" var="activoDes" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.estado" var="estadoDes" bundle="${calendarioBundle}" />

<c:choose>
	<c:when test="${paginatedList.fullListSize == 0}">
		<br/>
		<div class="row formlabel_sf" >
			<div class="mensagenCaixa">
				<div style="float:left; width:3%;">
				<img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencaoMsg}" title="${atencaoMsg}"/>
				</div>
				<div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
				<div class="info">${emptyRecords}</div></div><div style="clear:both"></div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<ajax:displayTag id="displayTagFrameCalendario" ajaxFlag="true" baseUrl="${pageContext.request.contextPath}/calendario/edit/list.do2">
		<display:table style="cursor: pointer;" id="calendario" name="${paginatedList}"  htmlId="worklist" requestURI="">
			<display:column title="${anoDes}" class="realce" sortable="true" property="ano" />				
			<display:column title="${des}" class="realce" sortable="true" property="descricao" />
			<display:column title="${editarDes}" style="width:6%; text-align:center;">
				<a href="#" onclick="editForm('${calendario.id}');"> <img
					src="${pageContext.request.contextPath}/images/icon/icon-editar.png"
					class="cursorMao" alt="${editarDes}" title="${editarDes}" style="border:none" /> </a>
			</display:column>
			<display:column title="${gerirDes}" style="width:6%; text-align:center;">
				<a href="${pageContext.request.contextPath}/calendario/manage.do2?id=${calendario.id}">
					<img src="${pageContext.request.contextPath}/images/icon/icon-editar.png"
						class="cursorMao" alt="${gerirDes}" title="${gerirDes}" style="border:none" />
				</a>			
			</display:column>
			<display:column title="${activoDes}" style="width:6%; text-align:center;">
				<c:if test="${calendario.activo}">
					<c:set var="estado" value="${pageContext.request.contextPath}/images/icon/icon-activo.png" />
				</c:if>
				<c:if test="${!calendario.activo}">
					<c:set var="estado" value="${pageContext.request.contextPath}/images/icon/icon-desactivo.png" />
				</c:if>				
			
				<a href="#" onclick="activate('${calendario.id}');">
					<img src="${estado}" class="cursorMao" alt="${estadoDes}" title="${estadoDes}" style="border:none" />						
				</a>
			</display:column>
		</display:table> 	
		</ajax:displayTag>
	</c:otherwise>
</c:choose>

<%-- 
<script>
	$$("table#worklist th.sortable").each(function(s) {
		alert(s);
	});
</script>
--%>