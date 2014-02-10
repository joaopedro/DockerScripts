<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<fmt:message key="ipdms.servicoonline.histProcesso.dataRegisto" var="dataRegisto"/>
<fmt:message key="ipdms.servicoonline.histProcesso.utilizador" var="utilizador"/>
<fmt:message key="ipdms.servicoonline.histProcesso.resumo" var="resumo"/>
<fmt:message key="ipdms.servicoonline.histProcesso.ficheiro" var="ficheiro"/>

<script type="text/javascript">
	var rules = {
		'#worklist tbody tr': function(el) {
			el.onmouseover = function(){
				Element.addClassName(this,'azulada')
			};
			el.onmouseout = function() {
				Element.removeClassName(this, 'azulada');
			};
		}
	};
	Behaviour.register(rules);
</script>
<br/>
<c:if test="${not empty versoesList}">
<div style="padding:5px;">
	<display:table id="servicoOnline" name="${versoesList}" htmlId="worklist" style="margin-left:20px; margin-bottom:20px; width:96%;">	
 		<display:column title="${dataRegisto}">	
 			<c:if test="${not empty servicoOnline.dataPreenchimento}">
 				<fmt:formatDate value="${servicoOnline.dataPreenchimento.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>
 			</c:if>
 		</display:column>
		<display:column title="${utilizador}">${servicoOnline.creator.titulo}</display:column>
		<display:column title="${resumo}">
			<a href="${pageContext.request.contextPath}/gerarresumo.do2?numero=${servicoOnline.numeroConteudo}&versao=${servicoOnline.versaoConteudo}" target="_blank">resumo</a>
		</display:column>
		<c:if test="${not empty servicoOnline.variante.templateInstrucaoFile}">
		<display:column title="${ficheiro}">
			<a href="${pageContext.request.contextPath}/gerarpdf.do2?numero=${servicoOnline.numeroConteudo}&versao=${servicoOnline.versaoConteudo}" target="_blank">pdf</a>
		</display:column>
		</c:if>
	</display:table>
	</div>
</c:if>

<script type="text/javascript">
	Behaviour.apply();
</script>