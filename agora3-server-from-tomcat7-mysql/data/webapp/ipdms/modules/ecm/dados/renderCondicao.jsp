<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ecm.dados.condicao.campo" var="campoDes" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.condicao.operadorComparacao" var="operadorComparacaoDes" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.condicao.valor" var="valorDes" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.condicao.operadorLogico" var="operadorLogicoDes" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.editar" var="editar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.atencaoMsg" var="atencaoMsg" bundle="${ecmBundle}" />
<fmt:message key="ipdms.emptyRecords" var="emptyRecords" bundle="${ecmBundle}" />

<c:choose>
	<c:when test="${not empty dadoForm.condicaoList}">
		<table cellpadding="0" cellspacing="0" class="centro">
			<tr class="hoverTransparente">
				<th class="centro">${campoDes}</th>
				<th class="centro">${operadorComparacaoDes}</th>
				<th class="centro">${valorDes}</th>
				<th class="centro">${operadorLogicoDes}</th>
				<th class="centro" style="width:5%">${editar}</th>
				<th class="centro" style="width:5%">${eliminar}</th>
			</tr>
			<c:forEach items="${dadoForm.condicaoList}" var="condicao" varStatus="i">
				<tr style="height:30px;">
					<td class="centro">${condicao.campo}</td>
					<td class="centro">${condicao.operadorComparacao}</td>
					<td class="centro">${condicao.valor}</td>
					<td class="centro">${condicao.operadorLogico}</td>
					<td class="alignCenter">
						<img class="cursorMao" src="${pageContext.request.contextPath}/images/icon/icon-editar.png" onclick="createCondicao('${i.index}');" title="${editar}" alt="${editar}" />												
					</td>
					<td class="alignCenter">
						<input type="checkbox" style="checks" name="checkConteudo" id="index" value="${i.index}" />
					</td>
				</tr>							
			</c:forEach>			
		</table>
		<div id="alignRight">
			<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" onclick="removeCondicao(getElementsByName('checkConteudo'));" class="cursorMao" alt="${eliminar}" title="${eliminar}" />
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