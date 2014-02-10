<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<fmt:message key="ipdms.modules.alert.criar" var="criar" />
<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />

<input type="hidden" id="numero" name="numero" value="${servicoOnline.numeroConteudo}" />

<div class="alignLeft">
	<div class="left" onclick="editAlerta('${servicoOnline.numeroConteudo}');">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png"  class="cursorMao" alt="${criar}" title="${criar}" />
	</div>
	<div class="right" onclick="editAlerta('${servicoOnline.numeroConteudo}');">
	<div class="texto" title="${criar}"><a href="#">${criar}</a></div></div>
</div>

<br/>
<c:choose>
	<c:when test="${not empty alerts}">
		<c:set var="dataCriacaoTitle"><fmt:message key="ipdms.modules.alert.datacriacao"></fmt:message> </c:set>	
		<c:set var="processoTitle">	<fmt:message key="ipdms.modules.alert.processo" /></c:set>
		<c:set var="subjectTitle"><fmt:message key="ipdms.modules.alert.subject" /></c:set>
		<c:set var="dataTitle"><fmt:message key="ipdms.modules.alert.dataalerta" /></c:set>

		<display:table id="alertList" name="${alerts}" htmlId="worklist"  requestURI="alertsByServicoOnlineAndUser.do2" 
				pagesize="10" excludedParams="method"> 
			<display:setProperty name="paging.banner.some_items_found" value="" /> 
			<display:setProperty name="paging.banner.all_items_found" value="" /> 
			<display:setProperty name="paging.banner.one_item_found" value="" /> 
			<display:setProperty name="paging.banner.placement" value="both" /> 

			<display:column title="Id" property="id" />
			<display:column title="${dataCriacaoTitle}"><fmt:formatDate value="${alertList.creationDate.time}" pattern="dd-MM-yyyy"/></display:column>
			<display:column title="${processoTitle}" property="servicoOnline.idProcessoEntidade" />
			<display:column title="${subjectTitle}" property="subject" />
			<display:column title="${dataTitle}" style="width:10%">
					<c:forEach items="${alertList.triggers}" var="trigger" begin="0" end="0">
						<fmt:formatDate value="${trigger.alertDate.time}" pattern="dd-MM-yyyy"/>
					</c:forEach>
			</display:column>
			<display:column title="${editar}" style="width:6%" class="alignCenter">
				<a href="#" onclick="editAlerta('${servicoOnline.numeroConteudo}', '${alertList.id}');">
					<img src="${pageContext.request.contextPath}/images/icon/icon-editar.png" class="cursorMao" alt="${editar}" title="${editar}" style="border:none" />
				</a>
			</display:column>
			<display:column title="${eliminar}" style="width:5%">
				<div class="alignCenter"><label for="removeRow_${alert.id}"><input type="checkbox" id="removeRow_${alertList.id}" name="removeRow_${entidades.id}" value="checked" class="radion" style="border:0;"/></label></div>
			</display:column>
			<display:footer>
				<td colspan="6" class="tableFooter">&nbsp;</td>
				<td class="tableFooter alignCenter">
					<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" onclick="removeAlertas();" class="cursorMao" alt="${eliminar}" title="${eliminar}" />
				</td>
			</display:footer>
		</display:table>
	</c:when>
	<c:otherwise>
		<div class="mensagenCaixa" >
			<span class="info"><fmt:message key="ipdms.modules.entidade.alert.semalertas" /></span>
		</div>
		
	</c:otherwise>
</c:choose>

<script>
	var rules = {
		'#worklist tbody tr': function(el) {
			el.onmouseover = function(){
				Element.addClassName(this,'active-row')				
			};
			el.onmouseout = function() {
				Element.removeClassName(this, 'active-row');
			};	
		}
	}
	
	Behaviour.register(rules);
	Behaviour.apply();
</script>
	
