<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>

<fmt:message key="ipdms.atencaoMsg" var="atencaoMsg" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.emptyRecords" var="emptyRecords" bundle="${calendarioBundle}" />
<fmt:message key="data.designacao" var="designacaoDes" bundle="${calendarioBundle}" />
<fmt:message key="data.data" var="dataDes" bundle="${calendarioBundle}" />
<fmt:message key="data.ponte.organica" var="organicaDes" bundle="${calendarioBundle}" />
<fmt:message key="data.tp.periodo" var="periodoDes" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.forms.editar" var="editarDes" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.forms.eliminar" var="eliminarDes" bundle="${calendarioBundle}" />
<fmt:message key="calendario.removerTP" var="removerTP" bundle="${calendarioBundle}" />
<fmt:message key="data.tp.delete.confirm" var="deleteConfirm" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.sim" var="sim" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.nao" var="nao" bundle="${calendarioBundle}" />

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
		<html:form styleId="tpDeleteForm" action="tp/delete">
		<ajax:displayTag id="displayTagFrameCalendario" ajaxFlag="true" baseUrl="${pageContext.request.contextPath}/calendario/tp/list.do2">
		<display:table style="cursor: pointer;" id="data" name="${paginatedList}"  htmlId="worklist" requestURI="">
			<display:column title="${designacaoDes}" class="realce" sortable="true" property="designacao" />				
			<display:column title="${dataDes}" class="realce" sortable="true">
				<fmt:formatDate value="${data.data.time}" pattern="dd-MM"/>
			</display:column>
			<display:column title="${organicaDes}" class="realce" sortable="true">
				${data.organica.designacao}
			</display:column>
			<display:column title="${periodoDes}" class="realce" sortable="true" property="periodo" />
			<display:column title="${editarDes}" style="width:6%; text-align:center;">
				<a href="#" onclick="editForm${viewPrefix}('${data.id}');"> <img
					src="${pageContext.request.contextPath}/images/icon/icon-editar.png"
					class="cursorMao" alt="${editarDes}" title="${editarDes}" style="border:none" /> </a>
			</display:column>
			<display:column class="alignCenter" style="width:5%;" title="${eliminarDes}">
				<input type="checkbox" id="removeRow_${data.id}" name="removeRow_${data.id}" 
					value="checked" class="radion" style="text-align:center; border:none;"/>
			</display:column>
			<display:footer>
				<td colspan="5" class="tableFooter">&nbsp;</td>
				<td class="tableFooter alignCenter">
					<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png"
						onclick="cancelar(event,'${removerTP}','${deleteConfirm}',deleteFeriadoTp,'${sim}','${nao}');" 
						class="cursorMao" alt="${removerTP}" title="${removerTP}" />
				</td>
			</display:footer>
		</display:table>
		</ajax:displayTag>
		</html:form>
	</c:otherwise>
</c:choose>