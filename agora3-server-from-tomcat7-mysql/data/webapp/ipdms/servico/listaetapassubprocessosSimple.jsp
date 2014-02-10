<%@page contentType="text/xml; charset=ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<root>
	<c:forEach var="historicoEntry" items="${etapas}">
		<c:choose>
			<c:when test="${historicoEntry.etapa}">
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
					activeDays="<fmt:formatDate value="${historicoEntry.endDate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>" 
					responder="${historicoEntry.responder}"
					result="${historicoEntry.result}"
					motivo="${historicoEntry.comentario}"
					comentario="${informations}"
					atributosEtapa="${atributos}"
					documentos="${documentos}"				
				/>			
			</c:when>			
		</c:choose>
	</c:forEach>
</root>
