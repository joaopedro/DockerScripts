<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ecm.conteudos.descricao" var="descricao" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.campos" var="campos" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.atencaoMsg" var="atencaoMsg" bundle="${ecmBundle}" />
<fmt:message key="ipdms.emptyRecords" var="emptyRecords" bundle="${ecmBundle}" />

<c:choose>
	<c:when test="${not empty templateEstruturaForm.templateConteudos}">
		<table cellpadding="0" cellspacing="0" class="centro">
			<tr class="hoverTransparente">
				<th class="centro">${descricao}</th>
				<th class="centro" style="width:5%">${campos}</th>
				<th class="centro" style="width:5%">${eliminar}</th>
			</tr>
			<c:forEach items="${templateEstruturaForm.templateConteudos}" var="templateConteudo" varStatus="i">
				<tr style="height:30px;">
					<td class="centro">${templateConteudo.descricaoTemplateConteudo}</td>
					<td class="alignCenter">
						<img class="cursorMao" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" onclick="createTemplateConteudo('${i.index}');" title="${pesquisar}" alt="${pesquisar}" />												
					</td>
					<td class="alignCenter">
						<input type="checkbox" style="checks" name="checkConteudo" id="index" value="${i.index}" />
					</td>
				</tr>							
			</c:forEach>			
		</table>
		<div id="alignRight">
			<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" onclick="removeConteudos(getElementsByName('checkConteudo'));" class="cursorMao" alt="${eliminar}" title="${eliminar}" />
		</div>		
	</c:when>
	<c:otherwise>
		<div class="row formlabel_sf" >
			<div class="mensagenCaixa">
				<div style="float:left; width:3%;">
					<img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;" alt="${atencaoMsg}" title="${atencaoMsg}"/>
				</div>
				<div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
					<div class="info">${emptyRecords}</div>
				</div>
				<div style="clear:both"></div>
			</div>
		</div>
	</c:otherwise>
</c:choose>