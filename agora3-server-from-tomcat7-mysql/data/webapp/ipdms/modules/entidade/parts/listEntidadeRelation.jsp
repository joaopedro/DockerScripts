<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.organica.eliminar.aviso" var="avisoMsg" />
<fmt:message key="ipdms.modules.entidaderelations.eliminar.empty" var="emptyMsg" />

<div id="errorEntidadeRelation"></div>

<c:choose>
	<c:when test="${not empty entidadeFormBean.entidadeRelations}">
		<table cellpadding="0" cellspacing="0" class="centro">
			<tr class="hoverTransparente">
				<th class="centro">
					<fmt:message key="ipdms.modules.entidaderelations.roledescription" />
				</th>
				<th class="centro" style="width:70%">
					<fmt:message key="ipdms.modules.entidaderelations.entidadetorelatename" />
				</th>
				<th class="centro" style="width:4%">
					<fmt:message key="ipdms.forms.editar" />
				</th>
				<th class="centro" style="width:5%">
					<fmt:message key="ipdms.forms.eliminar" />
				</th>
			</tr>
			<c:forEach items="${entidadeFormBean.entidadeRelations}" var="relation" varStatus="i">
				<tr style="height:30px;">
					<td class="centro">${relation.roleDescription}</td>
					<td class="centro">${relation.entidadeRelationName}</td>
					<td class="alignCenter">
						<img class="cursorMao" src="${pageContext.request.contextPath}/images/icon/icon-editar.png" 
						onclick="editEntidadeRelation('${i.index}');" 
						title="<fmt:message key='ipdms.forms.editar' />" alt="<fmt:message key='ipdms.forms.editar' />" />
					</td>
					<td class="alignCenter">
						<INPUT type="checkbox" 
							name="checkEntidadeRelation" id="index" value="${i.index}" style="border:none;" />
					</td>
				</tr>
			</c:forEach>
		</table>
		<div id="alignRight">
			<IMG src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" 
				onclick="removeEntidadeRelation(getElementsByName('checkEntidadeRelation'), '${avisoMsg}', '${emptyMsg}');" 
				class="cursorMao" alt="<fmt:message key='ipdms.forms.eliminar' /> <fmt:message key='ipdms.modules.entidade.tab.entidaderelation' />" title="<fmt:message key='ipdms.forms.eliminar' /> <fmt:message key='ipdms.modules.entidade.tab.entidaderelation' />"/>
		</div>		
	</c:when>	
	<c:otherwise>
		<div class="row formlabel_sf" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="<fmt:message key='ipdms.instrucao.pedido.info.title'/>" title="<fmt:message key='ipdms.instrucao.pedido.info.title'/>"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info"><fmt:message key="ipdms.modules.entidaderelations.empty"/></div></div><div style="clear:both"></div></div></div>
	</c:otherwise>
</c:choose>