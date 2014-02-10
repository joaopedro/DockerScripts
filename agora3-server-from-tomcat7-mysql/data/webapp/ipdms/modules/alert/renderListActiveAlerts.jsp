<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<fmt:message key="ipdms.modules.alert.editarData" var="editarData"/>
<fmt:message key="ipdms.modules.alert.visto" var="visto"/>
<fmt:message key="ipdms.forms.eliminar" var="eliminar"/>

<c:choose>
	<c:when test="${not empty activeAlerts}">
		<c:set var="dataTitle"><fmt:message key="ipdms.modules.alert.dataalerta" /></c:set>
		<c:set var="processoTitle">	<fmt:message key="ipdms.modules.alert.processo" /></c:set>
		<c:set var="subjectTitle"><fmt:message key="ipdms.modules.alert.subject" /></c:set>
		<c:set var="detailTitle"><fmt:message key="ipdms.modules.alert.detail" /></c:set>

		<c:set var="originalMapping" value="${requestScope['org.apache.struts.action.mapping.instance'].path}" />

		<display:table id="alert" name="${activeAlerts}" htmlId="worklist"  requestURI="${originalMapping}.do2"  pagesize="10" excludedParams="method"> 

			<display:column title="Id" property="id" />
			<display:column title="${dataTitle}" style="width:10%">
					<c:forEach items="${alert.triggers}" var="trigger" begin="0" end="0">
						<fmt:formatDate value="${trigger.alertDate.time}" pattern="dd-MM-yyyy"/>
					</c:forEach>
			</display:column>
			<display:column title="${processoTitle}" >
				<a href="${pageContext.request.contextPath}/displayconteudo.do2?numero=${alert.servicoOnline.numeroConteudo}" >
					${alert.servicoOnline.idProcessoEntidade }
				</a>
			</display:column>
			<display:column title="${subjectTitle}" property="subject" />
			<display:column title="${detailTitle}" property="detail" />

			<display:column title="${editarData}" style="width:6%" class="alignCenter">
				<a href="#" onclick="editPostponeAlert('${alert.id}');">
					<img src="${pageContext.request.contextPath}/images/icon/icon-editar.png" class="cursorMao" alt="${editarData}" title="${editarData}" style="border:none" />
				</a>
			</display:column>
			<display:column title="${visto}" style="width:5%">
				<div class="alignCenter"><label for="removeRow_${alert.id}"><input type="checkbox" id="removeRow_${alert.id}" name="removeRow_${entidades.id}" value="checked" class="radion" style="border:0;"/></label></div>
			</display:column>
			<display:footer>
				<td colspan="6" class="tableFooter">&nbsp;</td>
				<td class="tableFooter alignCenter">
					<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" onclick="dismissAlertas();" class="cursorMao" alt="${eliminar}" title="${eliminar}" />
				</td>
			</display:footer>
		</display:table>
	</c:when>
	<c:otherwise>
		<span class="formlabel">
			<fmt:message key="ipdms.modules.active.alert.list.empty" />
		</span>
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
