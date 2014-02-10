<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/ipdms-versionable.tld" prefix="ipdms"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<fmt:message key="agora.myprocesses.prioridade" var="prioridade"/>
<fmt:message key="agora.myprocesses.estado" var="estado"/>
<fmt:message key="agora.myprocesses.prazoUltrapassado" var="prazoUltrapassado"/>
<fmt:message key="agora.myprocesses.prazoAproximacao" var="prazoAproximacao"/>
<fmt:message key="agora.myprocesses.prazoDentro" var="prazoDentro"/>

<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/newlayout/images" />
<c:set var="list" value="${paginatedList.list}"/>
<c:set var="fullListSize" value="${paginatedList.fullListSize}"/>
<c:set var="objectsPerPage" value="${paginatedList.objectsPerPage}"/>
<c:set var="pageNumber" value="${paginatedList.pageNumber}"/>

<script type="text/javascript">
	//limpa a listagem anterior
	var table=document.getElementById("tbody");
	table.innerHTML="";

	//constroi um novo objecto de paginação
	var fullListSize = parseInt(${fullListSize});
	var objectsPerPage = parseInt(${objectsPerPage});
	var pageNumber = parseInt(${pageNumber});
	var url = "${pageContext.request.contextPath}/newlayout/listProcesses.do2?page=";
	var domElem = ".NumPages";
	
	$(".NumPages").html("");
	
	buildPaginationElement(fullListSize,objectsPerPage,pageNumber,url,domElem,'myprocesses');
</script>

<c:forEach items="${list}" var="notification">
	<c:set var="so" value="${notification.process.servicoOnline}" />

	<fmt:message key="${so.priority.resourceKey}" var="priorityText"/>
	
	<c:choose>
		<c:when test="${so.priority.resourceKey == 'processo.priority.high'}">
			<c:set var="priorityImgUrl" value="${IMG_DIR}/icones/Ico_priorvermelho.png" />
	    </c:when>
	    <c:when test="${so.priority.resourceKey == 'processo.priority.medium'}">
			<c:set var="priorityImgUrl" value="${IMG_DIR}/icones/Ico_prioramarelo.png" />
	    </c:when>
	    <c:when test="${so.priority.resourceKey == 'processo.priority.low'}">
			<c:set var="priorityImgUrl" value="${IMG_DIR}/icones/Ico_priorverde.png" />
	    </c:when>
	</c:choose>
	
	<c:choose>
		<c:when test="${notification.outOfDate}">
			<c:set var="notificationStatus" value="${prazoUltrapassado}" />
			<c:set var="notificationStatusImgUrl" value="${IMG_DIR}/icones/Ico_estadovermelho.png" />
		</c:when>
		<c:otherwise>
			<c:if test="${notification.inAlert}">
				<c:set var="notificationStatus" value="${prazoAproximacao}" />
				<c:set var="notificationStatusImgUrl" value="${IMG_DIR}/icones/Ico_estadoamarelo.png" />
			</c:if>
			<c:if test="${!notification.inAlert}">
				<c:set var="notificationStatus" value="${prazoDentro}" />
				<c:set var="notificationStatusImgUrl" value="${IMG_DIR}/icones/Ico_estadoverde.png" />
			</c:if>							
		</c:otherwise>
	</c:choose>
    
    <c:set var="variante" value="${so.variante}" />
    <ipdms:set-latest-variante var="v" conteudo="variante" />
    
    <c:set var="done" value="false" />
	<c:set var="soEntidadeNome" value="" />
	<c:forEach var="soEntidade" items="${so.entidades}">
		<c:if test="${soEntidade.id.role.sigla==notification.etapaConfig.processo.rolePrincipal.sigla && !done}">
			<c:set var="soEntidadeNome" value="${soEntidade.id.entidade.nome}" />
			<c:set var="done" value="true" />
		</c:if>
	</c:forEach>
	
	<c:choose>
		<c:when test="${fn:length(so.assunto)<=50}">
			<c:set var="assunto" value="${so.assunto}" />
		</c:when>
		<c:otherwise>
			<c:set var="assunto" value="${fn:substring(so.assunto,0,47)}..." />
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="logEntrie" items="${so.etapasAbertas}">
		<c:if test="${logEntrie.nid==notification.id}">
			<c:set var="etapa" value="${logEntrie.etapa.titulo}" />
		</c:if>											
	</c:forEach>
	
	<c:forEach var="logEntrie" items="${so.etapasAbertas}">
		<c:if test="${logEntrie.nid==notification.id}">
			<span title="${logEntrie.colaborador.nome}">
				<c:set var="enviadoPor" value="${logEntrie.colaborador.login}" />
			</span>
		</c:if>											
	</c:forEach>
	
	<c:forEach var="logEntrie" items="${so.etapasAbertas}">
		<c:if test="${logEntrie.nid==notification.id}">
			<c:if test="${logEntrie.colaborador.organicaPrincipal!=null}">
				<c:set var="origemProcessoDesignacao" value="${logEntrie.colaborador.organicaPrincipal.designacao}" />
				<c:set var="origemProcessoSigla" value="${logEntrie.colaborador.organicaPrincipal.sigla}" />
			</c:if>
		</c:if>											
	</c:forEach>
	
	<logic:iterate id="assignee" name="notification" property="assignees">
		<logic:iterate id="assigneeKey" name="worklistkey" indexId="assigneeKeyIndex">
			<c:if test="${assignee == assigneeKey}">
				<c:set var="assignado" value="${assignee.titulo}" />
			</c:if>
		</logic:iterate>
	</logic:iterate>
    
    <script>    
		var table=document.getElementById("tbody");		
		var row=table.insertRow(-1);
		row.id= "${notification.id}";
		row.className = "no_read";
		
		var cell0=row.insertCell(0);
		cell0.align="center";
		cell0.innerHTML="<input name='' type='checkbox' value=''>";		

		var cell1=row.insertCell(1);
		cell1.align="center";
		cell1.innerHTML= "<img src='${priorityImgUrl}' alt='${priorityText}' title='${prioridade}: ${priorityText}' width='12' height='12' border='0' />";//"<fmt:message key='${so.priority.resourceKey}' />";

		var cell2=row.insertCell(2);
		cell2.align="center";
		cell2.innerHTML="<img src='${notificationStatusImgUrl}' alt='${notificationStatus}' title='${estado}: ${notificationStatus}' width='12' height='12' border='0' />";

		var cell3=row.insertCell(3);
		cell3.innerHTML="<a href='#' onclick='openNotification(${notification.id},&quot;${so.idProcessoEntidade}&quot;,{nid:${notification.id}})'>${so.idProcessoEntidade}</a>";

		for (var i=0;i<tableDefs.columns.length;i++){
			var cell = row.insertCell(i + 4);
			var dataMapping = tableDefs.columns[i];

			if(!tableDefs.visibility[i]){
				$(cell).toggle();
			}
			
			if(dataMapping == "tipoProcesso"){
				cell.innerHTML="${v.titulo}";
			}
			else if(dataMapping == "dataInicial"){
				cell.innerHTML="<fmt:formatDate value='${so.dataPreenchimento.time}' pattern='dd-MM-yyyy HH:mm'/>";
			}
			else if(dataMapping == "entidade"){
				cell.innerHTML="${soEntidadeNome}";
			}
			else if(dataMapping == "assunto"){
				cell.innerHTML="${assunto}";
			}
			else if(dataMapping == "etapa"){
				cell.innerHTML="${etapa}";
			}
			else if(dataMapping == "enviadoPor"){
				cell.innerHTML="${enviadoPor}";
			}
			else if(dataMapping == "origemProcesso"){
				cell.innerHTML="<span title='${origemProcessoDesignacao}'>${origemProcessoSigla}</span>";
			}
			else if(dataMapping == "assignado"){
				cell.innerHTML="${assignado}";
			}
		}
		
		var cell12=row.insertCell(12);
	</script>
</c:forEach>