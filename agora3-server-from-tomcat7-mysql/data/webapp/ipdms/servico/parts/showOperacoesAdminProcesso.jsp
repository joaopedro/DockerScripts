<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<fmt:message key="ipdms.processo.operacoesadministrativas.operacao" var="operacao" />
<fmt:message key="ipdms.processo.operacoesadministrativas.dataOperacao" var="dataOperacao" />
<fmt:message key="ipdms.processo.operacoesadministrativas.realizouOperacao" var="realizouOperacao" />
<fmt:message key="ipdms.processo.operacoesadministrativas.etapa" var="etapa" />
<fmt:message key="ipdms.processo.operacoesadministrativas.assignedUser" var="assignedUser" />
<fmt:message key="ipdms.processo.operacoesadministrativas.listarUtilizadores" var="listarUtilizadores" />
<fmt:message key="ipdms.processo.operacoesadministrativas.processoDataTerminus" var="processoDataTerminus" />


<link type=text/css rel=stylesheet href='${pageContext.request.contextPath}/ipdms/themes/estilos.css' />
<link type=text/css rel=stylesheet href='${pageContext.request.contextPath}/ipdms/themes/forms.css'  />

<script src='${pageContext.request.contextPath}/ipdms/js/prototype.js' type="text/javascript"></script>

<script type="text/javascript">
	showAssignedUser = function (img) {
		var child = img;
		var myajax = new Ajax.Updater( {success: "users_" + child.attributes['id'].value},
							child.attributes['action'].value,
							{method: 'get',evalScripts:true} );
	};
</script>


<div style="padding:5px;">

	<c:if test="${not empty wrapperList}"> 
			
		<display:table id="entry" name="${wrapperList}" htmlId="worklist" requestURI="">
			<c:set var="logAdministrativo" value="${entry.logAdministrativo}"/>
				
			<display:column title="${operacao}" >${logAdministrativo.movimento}</display:column>
			<display:column title="${dataOperacao}">
				<fmt:formatDate value="${logAdministrativo.dataMovimento.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>
			</display:column>
			<display:column title="${realizouOperacao}">${logAdministrativo.utilizador}</display:column>
			<display:column title="${etapa}">${entry.etapa}</display:column>
			<display:column title="${assignedUser}">
				<c:if test="${not empty logAdministrativo.oldAssignedUser}">
					<c:set var="role" value="${logAdministrativo.oldAssignedUser}" />
					<c:set var="id" value="${entry.nid}_${logAdministrativo.id}" />
												
					<c:if test="${fn:startsWith(role, 'R')}">
						
						<img src="images/icon/icon-mais.png" 
							class="cursorMao" 
							style="vertical-align:top" 
							title="${listarUtilizadores}" 
							alt="${listarUtilizadores}" 
							action="workflowusers.do2?role=${role}&nid=${id}" 
							onClick="showAssignedUser(this);" 
							id="${id}" />						
					</c:if>${role}
					<span id="users_${id}" style="font-size: 9px; border-left: none; vertical-align: top;"></span>
						
				</c:if>								
			</display:column>		
			<display:column title="${processoDataTerminus}">
				<c:if test="${logAdministrativo.movimento == 'reabrir_processo'}">
					<fmt:formatDate value="${logAdministrativo.oldDataTerminus.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>
				</c:if>
			</display:column>
		</display:table>		
		
		
		<div>
			<span style="font-weight:bold; font-size: 9px; color: #000000;" >
				* &nbsp;  ${operacao} "<fmt:message key="ipdms.processo.operacoesadministrativas.reassignaretapa" />" <br/>
				**  ${operacao} "<fmt:message key="ipdms.processo.operacoesadministrativas.terminarprocesso" />"
			</span>
		</div>		
		
	</c:if>
	
	<c:if test="${empty wrapperList}">
		<span class="texto"><fmt:message key="ipdms.processo.operacoesadministrativas.semoperacoesadmin" /></span>
	</c:if>	

</div>