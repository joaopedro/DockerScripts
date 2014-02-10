<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="ENTITIES_DIR" value="/ipdms/webflow/dynamic/field/parts"/>

<script type="text/javascript">

getElementsByName_iefix = function(tag, name) {
	var elem = document.getElementsByTagName(tag);

    var arr = new Array();
    for(i = 0,iarr = 0; i < elem.length; i++) {
         att = elem[i].getAttribute("name");
         if(att == name) {
              arr[iarr] = elem[i];
              iarr++;
         }
    }
    return arr;
}
</script>

<c:if test="${suporte}">
	<p class="formlabel" style="padding: 5px;">
        <fmt:message key="ipdms.listetapas.titulo" />
        <br>
        <fmt:message key="ipdms.listetapas.subtitulo" />
    </p>
</c:if>
<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 17%; font-weight: bold;" title="<fmt:message key="ipdms.listetapas.label.datainicioprocesso" />">
		<c:if test="${suporte}">
            <fmt:message key="ipdms.listetapas.label.datainicioprocesso.pai" />
        </c:if>
        <c:if test="${!suporte}">
            <fmt:message key="ipdms.listetapas.label.datainicioprocesso" />
        </c:if>
	</div>
	<div class="textoCinza" style="width: 80%;" title="<fmt:message key="ipdms.listetapas.label.datainicioprocesso" />">
		<fmt:formatDate value="${servicoOnline.dataPreenchimento.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/> 
     </div>
</div>
<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 17%; font-weight: bold;" title="<fmt:message key="ipdms.notification.header.temposistema" />">
		<fmt:message key="ipdms.notification.header.temposistema" />
	</div>
	<div class="textoCinza" style="width: 80%;" title="<fmt:message key="ipdms.notification.header.temposistema" />">${tempoSistema} <fmt:message key="ipdms.notification.header.dias" /></div>
</div>
<br>
<c:if test="${not empty entries}">
<div style="padding:5px;">
	<table id="worklist" name="worklistSimple" cellpadding="0" cellspacing="0" class="worklist, centro">
		<tr>
		    <th>&nbsp;</th>
			<th><fmt:message key="ipdms.etapa.designacaoplural" /></th>
			<th><fmt:message key="ipdms.listetapas.tipoaccao" /></th>
			<th><fmt:message key="ipdms.listetapas.dataresposta" /></th> 
			<th><fmt:message key="ipdms.listetapas.respondidopor" /></th>
			<th><fmt:message key="ipdms.listetapas.resposta" /></th>
			<th><fmt:message key="ipdms.listetapas.motivo" /></th>
			<th><fmt:message key="ipdms.listetapas.comentarios" /></th>
			<th><fmt:message key="ipdms.listetapas.informacaoetapa" /></th>
			<th><fmt:message key="ipdms.listetapas.documentos" /></th>
			<%--<th>Consultar Etapa</th>--%>
		</tr>
		<c:forEach var="soLogListable" items="${entries}">

		<c:choose>
			<c:when test="${soLogListable.logEntry}"> <%-- E' um soLog --%>
				<c:set var="entry" value="${soLogListable.log}" />
				<tr>
					<td>&nbsp;</td>
					<td>${entry.etapa.titulo}</td>
					<td>${entry.tipomovimento.descricao}</td>
					<td><fmt:formatDate value="${entry.enddate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/></td>
					<td title="${soLogListable.responderUser.titulo}">${entry.responder}</td>
					<td>${entry.result}</td>
					<td>
						<c:choose> 
							<c:when test="${fn:length(entry.comentario)<100}">
								${entry.comentario}
							</c:when>
							<c:otherwise>
								${fn:substring(entry.comentario,0,99)}...
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:forEach var="information" items="${soLogListable.informations}">
							<b>${information.colaborador.login}:</b> ${information.comentario }<br>
						</c:forEach>
					</td>
					<td>
					   	<c:forEach var="atributo" items="${soLogListable.atributosEtapa}">
					    	<c:set var="field" value="${atributo.fieldTemplate}" scope="request" />
									<c:set var="fieldInstance" value="${atributo}" scope="request" />
									<b>${atributo.fieldTemplate.label}:</b>
							   			<c:choose>
							   				<c:when test="${atributo.fieldTemplate.type == 'TABLEOFFIELDS'}">-</c:when>
											<c:when test="${atributo.fieldTemplate.type == 'STRING'}"><jsp:include page="${ENTITIES_DIR}/stringvaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'INTEGER'}"><jsp:include page="${ENTITIES_DIR}/stringvaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'DATE'}"><jsp:include page="${ENTITIES_DIR}/stringvaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'COMBOBOX'}"><jsp:include page="${ENTITIES_DIR}/optionvaluesvaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'NIVELDIMENSIONAL'}"><jsp:include page="${ENTITIES_DIR}/niveldimensionalvaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'MORADA'}"><jsp:include page="${ENTITIES_DIR}/moradavaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'DIMENSAO'}"><jsp:include page="${ENTITIES_DIR}/dimensaovaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'ENTIDADE'}"><jsp:include page="${ENTITIES_DIR}/entidadevaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'MULTILINE'}"><jsp:include page="${ENTITIES_DIR}/stringvaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'EXTERNALOPTION'}"><jsp:include page="${ENTITIES_DIR}/externaloptionvaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'ORGANICA'}"><jsp:include page="${ENTITIES_DIR}/organicavaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'COLABORADOR'}"><jsp:include page="${ENTITIES_DIR}/colaboradorvaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'COMENTARIOPESSOAL'}"><jsp:include page="${ENTITIES_DIR}/comentariopessoalvaluepart.jsp" /></c:when>
											<c:when test="${atributo.fieldTemplate.type == 'BOOLEAN'}"><jsp:include page="${ENTITIES_DIR}/booleanvaluepart.jsp" /></c:when>
							   			</c:choose>
							    	  <br> 
					   	</c:forEach>
					   
					   	<c:set var="parecer" value="${soLogListable.informacaoParecer}" />
							<c:if test="${not empty parecer}">
								<b><fmt:message key="ipdms.comunicacaoparecer.mensagem" />: </b>${parecer.mensagem}
							   
								<c:if test="${not empty parecer.documentos}">									   
									<br/><b><fmt:message key="ipdms.listetapas.documentos" />: </b>
									<c:set var="str" value="" />
									<c:forEach var="doc" items="${parecer.documentos}">
										<c:set var="str" value="${str}<b>${doc.designacao}</b> <i>(${doc.extensao})</i>," /> 
									</c:forEach>
									${fn:substring(str,0,fn:length(str) - 1)}
								</c:if>
									   						   
								<br>
								<b><fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.detalhe.parecer" />: </b>${parecer.respostaParecer}<br>	
							</c:if>
					   						
					</td>
					<td valign="top">
						<c:forEach var="doc" items="${soLogListable.documentosEtapa}">
							<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${doc.numeroConteudo}" target="_blank">
								${doc.designacao} <i>(${doc.extensao})</i>
							</a><br/>		
						</c:forEach>
					</td>
				</tr>
			</c:when>
			<c:otherwise> <%-- E' um processo--%>
				<c:set var="entry" value="${soLogListable}" />
				<tr class="hoverTransparente" id="trbegin_${entry.numeroConteudo}">
					<td align="center">
							<img src="images/icon/icon-mais.png" id="img_${entry.numeroConteudo}" 
								onclick="historicoEtapasSimple(${entry.numeroConteudo}, 1, getElementsByName_iefix('table','worklistSimple')[0]);" title="<fmt:message key="ipdms.documentos.list.consultarHistory" />" alt="<fmt:message key="ipdms.documentos.list.consultarHistory" />" class="cursorMao" />
					</td>
					<td colspan="9">
						<b>${entry.variante.activo.titulo}</b> (<fmt:formatDate value="${entry.dataPreenchimento.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>)
					</td>
				</tr>
				<tr id="trend_${entry.numeroConteudo}"></tr>
				<%-- Automaticly load info --%>
				<script>historicoEtapasSimple(${entry.numeroConteudo}, 1,getElementsByName_iefix('table','worklistSimple')[0]);</script>
			</c:otherwise>
		</c:choose>
		
		</c:forEach>
	</table>
	</div>
</c:if>

<c:if test="${not empty docsInstrucao}">
	<label class="leftTab formlabel"><b><fmt:message key="ipdms.listetapas.docsinstrucao" /></b></label>
	<table cellpadding="0" cellspacing="0" class="centro" style="margin-left:14px; width:97%">
	<tr>
		<th class="centro"><fmt:message key="ipdms.listetapas.data" /></th>
		<th class="centro"><fmt:message key="ipdms.listetapas.descricao" /></th>
		<th class="centro"><fmt:message key="ipdms.listetapas.numdoc" /></th>
		<th class="centro"><fmt:message key="ipdms.listetapas.autor" /></th>
		<th class="centro" style="width:25%"><fmt:message key="ipdms.listetapas.observacoes" /></th>
		<th class="centro"><fmt:message key="ipdms.documentos.list.consultarDoc" /></th>
	</tr>
	
	<c:forEach var="documento" items="${docsInstrucao}" varStatus="status">
		<tr>
			<td class="centro">		
				<%-- DATE OF THE DOCUMENT --%>		
				<c:if test="${not empty documento.dataEmissao}">
					<a href="#" onclick="previewDocumento('${documento.numeroConteudo}');">
						<fmt:formatDate value="${documento.dataEmissao}" pattern="dd-MM-yyyy HH:mm" />
					</a>
				</c:if>
			</td>
			<td class="centro">
				<a href="#" onclick="previewDocumento('${documento.numeroConteudo}');">
					${documento.designacao}		
				</a>
			</td>
			<td class="centro">${documento.numeroDocumento}</td>
			<td class="centro">${documento.creator.titulo}</td>
			<td class="centro">${documento.comentario}</td>
			<td class="alignCenter">
				<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${documento.numeroConteudo}" target="_blank" title="<fmt:message key="ipdms.documentos.list.consultarDocs" />">
					<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" class="cursorMao" alt="<fmt:message key="ipdms.documentos.list.consultarDocs" />" title="<fmt:message key="ipdms.documentos.list.consultarDocs" />" />
				</a>
			</td>
		</tr>
	</c:forEach>
	</table>
</c:if>

<fmt:message key="ipdms.documentos.list.docPreview" var="docPreview"/>

<script>
getElementsByName_iefix = function(tag, name) {
    var elem = document.getElementsByTagName(tag);

    var arr = new Array();
    for(i = 0,iarr = 0; i < elem.length; i++) {
         att = elem[i].getAttribute("name");
         if(att == name) {
              arr[iarr] = elem[i];
              iarr++;
         }
    }
    return arr;
}

previewDocumento = function(idDocumento) {	
	var action = "${pageContext.request.contextPath}/file/previewDocumento.do2?idDocumento="+idDocumento+"&resize=true";
	ExtWindowSizeParam('${docPreview}',action,'','html', 500, 600); //width, height
};
</script>

<%-- 
<c:if test="${suporte}">
	<p class="formlabel"><fmt:message key="ipdms.listetapas.etapasprocesso" /></p>
	<c:if test="${not empty entries}">
		<display:table id="entry" name="${entries}" htmlId="worklist">
			<display:column title="Etapa" >
				<span style="display: none">processId=${entry.itemkey},processType=${entry.itemtype},etapaId=${entry.etapa.numeroConteudo},nid=${entry.nid}</span>
				${entry.titulo}
			</display:column>
			<display:column title="Tipo de Acção">
				${entry.tipomovimento.descricao}
			</display:column>
	 		<display:column title="Início">
	 			<fmt:formatDate value="${historicoEntry.begindate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>	
	 		</display:column>
			<display:column title="Fim">
				<fmt:formatDate value="${historicoEntry.enddate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>
			</display:column>
			<display:column title="Assignado a" >${entry.responder}</display:column>
			<display:column title="Resposta">${entry.result}</display:column>		
		</display:table>
	</c:if>
</c:if>
--%>