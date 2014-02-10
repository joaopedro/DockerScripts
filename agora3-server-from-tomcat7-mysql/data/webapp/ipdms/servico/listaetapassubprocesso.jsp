<%@page contentType="text/xml; charset=ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<root>
	<c:forEach var="historicoEntry" items="${etapas}">
		<c:choose>
			<c:when test="${historicoEntry.etapa}">
					<c:url var="link" value="/tarefa/notificationToPdf.do2">
							<c:param name="nid" value="${historicoEntry.nid}" />
					</c:url>
					
					<c:set var="atributos" value=""/>
					<c:set var="informations" value=""/>				
					
					<%-- Comentários --%>
					<c:if test="${empty historicoEntry.informations}" >
						<c:set var="informations" value=""/>
					</c:if>		
					<c:remove var="informations"/>						
					<c:forEach var="information" items="${historicoEntry.informations}">
						<c:set var="informations" value="${informations}${information.colaborador.login}:${information.comentario};"/>											
					</c:forEach>
										
					<%-- Informação da Etapa --%>
					<c:if test="${empty historicoEntry.atributosEtapa}" >
						<c:set var="atributos" value=""/>
					</c:if>					
					<c:forEach var="atributo" items="${historicoEntry.atributosEtapa}">
						<c:set var="atributos" value="${atributos}${atributo.fieldTemplate.label}:${atributo.value};"/>											
					</c:forEach>	
					
					<%-- Documentos --%>
					<c:if test="${empty historicoEntry.documentosEtapa}" >
						<c:set var="documentos" value=""/>
					</c:if>		
					<c:remove var="documentos"/>
					<c:forEach var="d" items="${historicoEntry.documentosEtapa}">				
						<c:set var="documentos">
							<c:set var="step1">${fn:replace(d.designacao, ",", "&#44;")}</c:set>
							${documentos}${d.numeroConteudo},${fn:replace(step1, ";", "&#59;")},${d.extensao};
						</c:set>											
					</c:forEach>
						
					
					<historicoEntry
						isEtapa="${historicoEntry.etapa}"
						spanText="processId=${historicoEntry.itemKey},processType=${historicoEntry.itemType},etapaId=${historicoEntry.numeroEtapa},nid=${historicoEntry.nid}"
						titulo="${historicoEntry.titulo}"
						tipomovimento="${historicoEntry.tipoMovimento}" 
						beginDate="<fmt:formatDate value="${historicoEntry.beginDate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>"
						endDate="<fmt:formatDate value="${historicoEntry.endDate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>"
						responder="${historicoEntry.responder}"
						colaborador="${historicoEntry.colaborador.login}"
						assignedUser="${historicoEntry.assignedUser}"
						result="${historicoEntry.result}"
						comentario="${historicoEntry.comentario}"
						nid="${historicoEntry.nid}" 
						pdfImage="${pageContext.request.contextPath}/images/icon/icon-PDF.png"
						pdfAction="${link}"
						activeDays="<fmt:formatDate value="${historicoEntry.endDate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>" 
						motivo="${historicoEntry.comentario}"
						atributosEtapa="${atributos}"
						documentos="${documentos}"
					/>			
			</c:when>
			<c:otherwise>
				<historicoEntry
					isEtapa="${historicoEntry.etapa}"
					nomeProcesso="${historicoEntry.nomeSubProcesso}"
					entryDate="<fmt:formatDate value="${historicoEntry.entryDate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>"
					numeroConteudo="${historicoEntry.numeroConteudo}"
				/>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</root>