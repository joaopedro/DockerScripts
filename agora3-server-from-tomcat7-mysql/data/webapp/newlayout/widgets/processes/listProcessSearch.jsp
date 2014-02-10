<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="list" value="${paginatedList.list}"/>
<c:set var="fullListSize" value="${paginatedList.fullListSize}"/>
<c:set var="objectsPerPage" value="${paginatedList.objectsPerPage}"/>
<c:set var="pageNumber" value="${paginatedList.pageNumber}"/>

<fmt:message key="agora.loading" var="loading" />
<fmt:message key='agora.myprocesses.search.results.norecordsfound' var="norecordsfound"/>
<fmt:message key='agora.myprocesses.search.results.id' var="id"/>
<fmt:message key='agora.myprocesses.search.results.numDoc' var="numDoc"/>
<fmt:message key='agora.myprocesses.search.results.processo' var="nomeProcesso"/>
<fmt:message key='agora.myprocesses.search.results.assunto' var="assuntoDes"/>
<fmt:message key='agora.myprocesses.search.results.dataEntrada' var="dataEntrada"/>
<fmt:message key='agora.myprocesses.search.results.etapaActual' var="etapaActual"/>

<c:choose>
	<c:when test="${fn:length(list) gt 0}">
		<c:forEach items="${list}" var="item">
			<c:set var="servicoOnline" value="${item.contentInterface.servicoonline}" />
			
			<c:set var="idProcessoEntidade" value="${servicoOnline.idProcessoEntidade}" />
			<c:set var="numeroDocumento" value="${servicoOnline.numeroDocumento}" />
			<c:set var="processoTitulo" value="${servicoOnline.tipoConteudo.processo.titulo}" />
			
			<c:choose>
				<c:when test="${fn:length(servicoOnline.assunto)<=255}">
					<c:set var="assunto" value="${servicoOnline.assunto}" />
				</c:when>
				<c:otherwise>
					<c:set var="assunto" value="${fn:substring(servicoOnline.assunto,0,254)}..." />
				</c:otherwise>
			</c:choose>
			
			<c:if test="${not empty servicoOnline.dataPreenchimento}">
				<fmt:formatDate type="both" value="${servicoOnline.dataPreenchimento.time}" pattern="dd-MM-yyyy HH:mm" var="dataPreenchimento"/>
			</c:if>
			
			<c:set var="nomeEtapaActual" value="${servicoOnline.nomeEtapaActual}" />
			
			<script>
				$(document).ready(function() {
					var table=document.getElementById("tbody");
					var row=table.insertRow(-1);
					row.className = "no_read";
					
					var cell0=row.insertCell();
					var cell1=row.insertCell();
					var cell2=row.insertCell();
					var cell3=row.insertCell();
					var cell4=row.insertCell();
					var cell5=row.insertCell();
					
					cell0.innerHTML="${idProcessoEntidade}";		
					cell1.innerHTML="${numeroDocumento}";
					cell2.innerHTML="${processoTitulo}";
					cell3.innerHTML="${assunto}";
					cell4.innerHTML="${dataPreenchimento}";
					cell5.innerHTML="${nomeEtapaActual}";
				});
			</script>	
		</c:forEach>
		
		<section>
			<div id="TableSort" class="TabSort">
			    <span class="NumPages"></span>
			</div>
			
			<div id="Table">
				<table>
					<thead>
						<tr>
							<th>${id}</th>
							<th>${numDoc}</th>
							<th>${nomeProcesso}</th>
							<th>${assuntoDes}</th>
							<th>${dataEntrada}</th>
							<th>${etapaActual}</th>
						</tr>
					</thead>
					<tbody id="tbody"></tbody>
				</table>
			</div>
		</section>
		
		<script>
			var fullListSize = parseInt(${fullListSize});
			var objectsPerPage = parseInt(${objectsPerPage});
			var pageNumber = parseInt(${pageNumber});
			var p = $("#nav").serialize();
			var url = "${pageContext.request.contextPath}/newlayout/searchProcess.do2?" + p + "&page=";
			var domElem = ".NumPages";
			
			buildPaginationElement(fullListSize,objectsPerPage,pageNumber,url,domElem,'myprocesses');
		</script>
				
	</c:when>
	<c:otherwise>
		<section>
			${norecordsfound}
		</section>
	</c:otherwise>
</c:choose>