<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="ENTITIES_DIR" value="/ipdms/webflow/dynamic/field/parts" />

<fmt:message key="ipdms.loading" var="loading" />
<fmt:message key="ipdms.listetapas.signDocs.emptyWinTitle"
	var="emptyWinTitle" />
<fmt:message key="ipdms.listetapas.signDocs.emptyWinMsg"
	var="emptyWinMsg" />
<fmt:message key="ipdms.listetapas.markToSign.selectedWinTitle"
	var="selectedWinTitle" />
<fmt:message key="ipdms.listetapas.markToSign.selectedWinMsg"
	var="selectedWinMsg" />
<fmt:message key="ipdms.documentos.list.consultarDocs"
	var="consultarDocs" />
<fmt:message key="ipdms.documentos.list.docPreview" var="previewDocs" />

<script type="text/javascript">
				
	hideMenu = function(){
		var hideMenu = $$('div.DHTMLSuite_resizeButtonLeft')[0];
		if(hideMenu){
			simulateClick(hideMenu);
		}
	}

	showMenu = function(){
		var showMenu = $$('div.DHTMLSuite_resizeButtonRight')[0];

		if(showMenu){
			simulateClick(showMenu);
		}
	}

	// hide document preview div
	hideDocPreview = function(hidePreview){		
		showMenu();
		hidePreviewPane();
		
	};

	// show document preview div
	showDocPreview = function(hidePreview){		
		hideMenu();
		showPreviewPane();
		
	};

	hidePreviewPane = function() {
    	
		var rightPane = document.getElementById('documentPreviewRight');
		var notification = document.getElementById('notificationLeft');
		rightPane.style.display = 'none';
		notification.style.width = '100%';

     }

	showPreviewPane = function() {
    	
		var rightPane = document.getElementById('documentPreviewRight');
		var notification = document.getElementById('notificationLeft');
		rightPane.style.display = 'block';			
		notification.style.width = '48%';
     }
	
	simulateClick = function(control)
	{
	    if (document.all)
	    {
	        control.click();
	    }
	    else
	    {
	        var evObj = document.createEvent('MouseEvents');
	        evObj.initMouseEvent('click', true, true, window, 1, 12, 345, 7, 220, false, false, true, false, 0, null );
	        control.dispatchEvent(evObj);
	    }
	}
	
</script>

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
	};	
	
</script>


<script type="text/javascript">
	
	showMessage = function(title, msg) {		
		Ext.MessageBox.show({
			title: title,
			msg: msg,
			closable: false,
			buttons: Ext.MessageBox.OK,
			icon: Ext.MessageBox.WARNING 
		});
	};
	
	executeRequest = function(div, url){
		$(div).innerHTML="<br><span class='formfield'><img src='${JS_DIR}/ext/resources/images/default/grid/loading.gif' style='width:16px; height:16px; vertical-align:top;' alt='${loading}' title='${loading}' />${loading}</span> </div>";
		new Ajax.Updater( {success: div}, url, {method: 'get', evalScripts: true} );
	};
	
</script>

<script type="text/javascript">

	// store the document id's to sign
	var elements = [];
		
	// get id of previous and next document
	createNavigationUrl = function(idDocumento){
				
		var idDocumentos = getIdDocumentos();
		idDocumentos = idDocumentos.substring(0,idDocumentos.length - 1);
		
		var ids = idDocumentos.split(':');
		var anterior = '';
		var proximo = '';
		
		// only if number of docs is > 1
		if(ids.length > 1){
			for(i = 0; i < ids.length; i++) {			
				if(ids[i] == idDocumento) {
					if(i == 0){					
						proximo = ids[i+1];		         		
					} else if(i == ids.length - 1) {
						anterior = ids[i-1];					      	
					} else {				
						anterior = ids[i-1];
						proximo = ids[i+1];
					}
					break;
				}
			}	
		}		
					
		return '&anterior=' + anterior + '&proximo=' + proximo;;
	};
		
	previewDocumento = function(div, idDocumento){
		
		// show element with the document preview
		showDocPreview();
			
		var url = '${pageContext.request.contextPath}/file/previewDocumentInTarefa.do2';
		url += '?idDocumento=' + idDocumento;			
		url += '&resize=false';
		url += createNavigationUrl(idDocumento);
		
		executeRequest(div, url);
	 
	};	
	
	changePreviewDocumentoSettings = function(div, idDocumento, params){
							
		var url = url = '${pageContext.request.contextPath}/file/changePreviewDocumentSettings.do2';
		url += '?idDocumento=' + idDocumento;
		url += params;
				
		executeRequest(div, url);
	 
	};	
	
	// sign all documents marked
	signDocuments = function(){
				
		if(elements.length == 0){
			showMessage('${emptyWinTitle}','${emptyWinMsg}');
		} else {
			var params = '';
			for(var i = 0; i < elements.length; i++){
				params += 'export_' + elements[i]+ '=checked&';					
			}
			
			params = params.substring(0, params.length - 1);		
			var url = 'bundle/downloadBundle.do2' + '?' + params;
			$('exportForm').action = url;
			$('exportForm').submit();
		}
				
	};
	
	// mark document to sign
	removeMark = function(id){				
		if(elements.indexOf(id) != -1){
			var element = $('doc_' + id);
			var dicon = $('mbundle');	
			element.removeChild(dicon);
			var pos = elements.indexOf(id);                		
			elements.splice(pos, 1);                			
		}		
	};
	
	// mark document to sign
	markToSign = function(id){
				
		if(elements.indexOf(id) == -1){
			
			var img = document.createElement("img");
			img.setAttribute("id","mbundle");
			img.setAttribute("class","cursorMao");
			img.setAttribute("src","images/icon/icon-obterDocumento.png");
			img.setAttribute("title","<fmt:message key="ipdms.listetapas.docmarcadoprassinar" />");
			img.setAttribute("alt","<fmt:message key="ipdms.listetapas.docmarcadoprassinar" />");
			img.setAttribute("onclick","removeMark(\'" + id + "\')");
						
			var element = $('doc_' + id);			
			element.appendChild(img);			
			
			var pos = elements.length;                			              			
			elements[pos] = id;                			
		} else {
			showMessage('${selectedWinTitle}','${selectedWinMsg}');			
		}
				
	};
	
</script>

<c:if test="${sistema}">
	<p class="formlabel" style="padding: 5px;">
		<fmt:message key="ipdms.listetapas.titulo" />
		<br>
		<fmt:message key="ipdms.listetapas.subtitulo" />
	</p>
</c:if>
<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 17%; font-weight: bold;"
		title="<fmt:message key="ipdms.listetapas.label.datainicioprocesso" />">
		<c:if test="${sistema}">
			<fmt:message key="ipdms.listetapas.label.datainicioprocesso.pai" />
		</c:if>
		<c:if test="${!sistema}">
			<fmt:message key="ipdms.listetapas.label.datainicioprocesso" />
		</c:if>
	</div>
	<div class="label" style="width: 80%;"
		title="<fmt:message key="ipdms.listetapas.label.datainicioprocesso" />">
		<fmt:formatDate value="${servicoOnline.dataPreenchimento.time}"
			pattern="dd-MM-yyyy HH'h'mm'm'" />
	</div>
</div>
<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 17%; font-weight: bold;"
		title="<fmt:message key="ipdms.notification.header.temposistema" />">
		<fmt:message key="ipdms.notification.header.temposistema" />
	</div>
	<div class="label" style="width: 80%;"
		title="<fmt:message key="ipdms.notification.header.temposistema" />">
		${tempoSistema}
		<fmt:message key="ipdms.notification.header.dias" />
	</div>
</div>
<div style="height: 10px;"></div>

<br />
<input type="hidden" name="parentNConteudo"/>
<c:set var="idDocumentos" value="" />
<c:if test="${not empty entries}">
	<div style="padding-left: 14px; width: 98%;">
		<table id="worklist" name="worklistSimple">
			<tr>
				<th><fmt:message key="ipdms.etapa.designacaoplural" /></th>
				<th><fmt:message key="ipdms.listetapas.tipoaccao" /></th>
				<th><fmt:message key="ipdms.listetapas.dataresposta" /></th>
				<th><fmt:message key="ipdms.listetapas.respondidopor" /></th>
				<th><fmt:message key="ipdms.listetapas.resposta" /></th>
				<th><fmt:message key="ipdms.listetapas.motivo" /></th>
				<th><fmt:message key="ipdms.listetapas.comentarios" /></th>
				<th><fmt:message key="ipdms.listetapas.informacaoetapa" /></th>
				<th><fmt:message key="ipdms.listetapas.documentos" /></th>
			</tr>
			<c:forEach var="soLogListable" items="${entries}">
				<c:choose>
					<c:when test="${soLogListable.logEntry}">
						<c:set var="entry" value="${soLogListable.log}" />
						
							<c:choose>
							<c:when test="${nid==entry.nid && parentNConteudo!=null}">
								<tr style="background-color: #ABC">
							</c:when>
							<c:otherwise>
								<tr>
							</c:otherwise>
							</c:choose>
							<td>
								<c:choose>
								<c:when test="${nid==entry.nid}"><b>* ${entry.etapa.titulo}</b></c:when>
								<c:otherwise>${entry.etapa.titulo}</c:otherwise>
								</c:choose>
							</td>
							<td>${entry.tipomovimento.descricao}</td>
							<td><fmt:formatDate value="${entry.enddate.time}"
									pattern="dd-MM-yyyy HH'h'mm'm'" /></td>
							<td title="${soLogListable.responderUser.titulo}">${entry.responder}</td>
							<td>${entry.result}</td>
							<td><c:choose>
									<c:when test="${fn:length(entry.comentario)<100}">
										${entry.comentario}
									</c:when>
									<c:otherwise>
										${fn:substring(entry.comentario,0,99)}...
									</c:otherwise>
								</c:choose></td>
							<td><c:forEach var="information"
									items="${soLogListable.informations}">
									<b>${information.colaborador.login}:</b> ${information.comentario }<br>
								</c:forEach></td>
							<td><c:forEach var="atributo"
									items="${soLogListable.atributosEtapa}">
									<c:set var="field" value="${atributo.fieldTemplate}"
										scope="request" />
									<c:set var="fieldInstance" value="${atributo}" scope="request" />
									<b>${atributo.fieldTemplate.label}:</b>
									<c:choose>
										<c:when
											test="${atributo.fieldTemplate.type == 'TABLEOFFIELDS'}">-</c:when>
										<c:when test="${atributo.fieldTemplate.type == 'STRING'}"><jsp:include
												page="${ENTITIES_DIR}/stringvaluepart.jsp" /></c:when>
										<c:when test="${atributo.fieldTemplate.type == 'INTEGER'}"><jsp:include
												page="${ENTITIES_DIR}/stringvaluepart.jsp" /></c:when>
										<c:when test="${atributo.fieldTemplate.type == 'DATE'}"><jsp:include
												page="${ENTITIES_DIR}/stringvaluepart.jsp" /></c:when>
										<c:when test="${atributo.fieldTemplate.type == 'COMBOBOX'}"><jsp:include
												page="${ENTITIES_DIR}/optionvaluesvaluepart.jsp" /></c:when>
										<c:when
											test="${atributo.fieldTemplate.type == 'NIVELDIMENSIONAL'}"><jsp:include
												page="${ENTITIES_DIR}/niveldimensionalvaluepart.jsp" /></c:when>
										<c:when test="${atributo.fieldTemplate.type == 'MORADA'}"><jsp:include
												page="${ENTITIES_DIR}/moradavaluepart.jsp" /></c:when>
										<c:when test="${atributo.fieldTemplate.type == 'DIMENSAO'}"><jsp:include
												page="${ENTITIES_DIR}/dimensaovaluepart.jsp" /></c:when>
										<c:when test="${atributo.fieldTemplate.type == 'ENTIDADE'}"><jsp:include
												page="${ENTITIES_DIR}/entidadevaluepart.jsp" /></c:when>
										<c:when test="${atributo.fieldTemplate.type == 'MULTILINE'}"><jsp:include
												page="${ENTITIES_DIR}/stringvaluepart.jsp" /></c:when>
										<c:when
											test="${atributo.fieldTemplate.type == 'EXTERNALOPTION'}"><jsp:include
												page="${ENTITIES_DIR}/externaloptionvaluepart.jsp" /></c:when>
										<c:when test="${atributo.fieldTemplate.type == 'ORGANICA'}"><jsp:include
												page="${ENTITIES_DIR}/organicavaluepart.jsp" /></c:when>
										<c:when test="${atributo.fieldTemplate.type == 'COLABORADOR'}"><jsp:include
												page="${ENTITIES_DIR}/colaboradorvaluepart.jsp" /></c:when>
										<c:when
											test="${atributo.fieldTemplate.type == 'COMENTARIOPESSOAL'}"><jsp:include
												page="${ENTITIES_DIR}/comentariopessoalvaluepart.jsp" /></c:when>
										<c:when test="${atributo.fieldTemplate.type == 'BOOLEAN'}"><jsp:include
												page="${ENTITIES_DIR}/booleanvaluepart.jsp" /></c:when>
									</c:choose>
									<br>
								</c:forEach> <c:set var="parecer" value="${soLogListable.informacaoParecer}" />
								<c:if test="${not empty parecer}">
									<b><fmt:message key="ipdms.comunicacaoparecer.mensagem" />:
									</b>${parecer.mensagem}
							   
									<c:if test="${not empty parecer.documentos}">
										<br />
										<b><fmt:message key="ipdms.listetapas.documentos" />: </b>
										<c:set var="str" value="" />
										<c:forEach var="doc" items="${parecer.documentos}">
											<c:set var="str"
												value="${str}<b>${doc.designacao}</b> <i>(${doc.extensao})</i>," />
										</c:forEach>
										${fn:substring(str,0,fn:length(str) - 1)}
									</c:if>

									<br>
									<b><fmt:message
											key="ipdms.comunicacaoparecer.etapaProcesso.detalhe.parecer" />:
									</b>${parecer.respostaParecer}<br>
								</c:if></td>
							<td valign="top"><c:forEach var="doc"
									items="${soLogListable.documentosEtapa}">
									<c:set var="idDocumentos"
										value="${idDocumentos}${doc.numeroConteudo}:" />
									<div id="doc_${doc.numeroConteudo}">
										<a href="#"
											onclick="previewDocumento('docdiv','${doc.numeroConteudo}');"
											title="${previewDocs}" alt="${previewDocs}">${doc.designacao}
											<i>(${doc.extensao})</i>
										</a> <a class="formfield"
											href="${pageContext.request.contextPath}${secure}/file/getDocumento.do2?nc=${doc.numeroConteudo}"
											target="_blank"> <img
											src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png"
											class="cursorMao" style="border-left: none"
											title="${consultarDocs}" alt="${consultarDocs}" />
										</a>
									</div>
								</c:forEach></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:set var="entry" value="${soLogListable}" />
						<c:choose>
							<c:when test="${parentNConteudo==null}">
							
								<tr class="hoverTransparente"
									id="trbegin_${entry.numeroConteudo}">
									<td align="center"><img src="images/icon/icon-mais.png"
										id="img_${entry.numeroConteudo}"
										onclick="historicoEtapasSimple(${entry.numeroConteudo}, 1, getElementsByName_iefix('table','worklistSimple')[0]);"
										title="<fmt:message key="ipdms.documentos.list.consultarHistory" />"
										alt="<fmt:message key="ipdms.documentos.list.consultarHistory" />"
										class="cursorMao" /></td>
									<td colspan="9"><b> ${entry.variante.activo.titulo}</b> (<fmt:formatDate
											value="${entry.dataPreenchimento.time}"
											pattern="dd-MM-yyyy HH'h'mm'm'" />)</td>
								</tr>
								<tr id="trend_${entry.numeroConteudo}"></tr>
								<script>historicoEtapasSimple(${entry.numeroConteudo}, 1,getElementsByName_iefix('table','worklistSimple')[0]);</script>
							
							</c:when>
							
							<c:when test="${entry.numeroConteudo==numero  && parentNConteudo!=null }">
							
								<tr class="hoverTransparente"
									id="trPadraobegin_${entry.numeroConteudo}">
									<td align="center"><img src="images/icon/icon-mais.png"
										id="imgPadrao_${entry.numeroConteudo}"
										onclick="historicoEtapasWithSimpleAttributes(${entry.numeroConteudo}, 1, getElementsByName_iefix('table','worklistSimple')[0], ${nid},2);"
										title="<fmt:message key="ipdms.documentos.list.consultarHistory" />"
										alt="<fmt:message key="ipdms.documentos.list.consultarHistory" />"
										class="cursorMao" /></td>
									<td colspan="8"><b> ${entry.variante.activo.titulo}</b> (<fmt:formatDate
											value="${entry.dataPreenchimento.time}"
											pattern="dd-MM-yyyy HH'h'mm'm'" />)</td>
								</tr>
								<tr id="trendPadrao_${entry.numeroConteudo}"></tr>
								<script>historicoEtapasWithSimpleAttributes(${entry.numeroConteudo}, 1,getElementsByName_iefix('table','worklistSimple')[0], ${nid},2);</script>
							
							</c:when>				
							<c:otherwise>
								<!--  Quando e subprocesso irmao por s -->
								<tr class="hoverTransparente"
									id="trbegin_${entry.numeroConteudo}">
									<td align="center" />
<!-- 									<img src="images/icon/icon-mais.png" -->
<%-- 										id="img_${entry.numeroConteudo}" --%>
<%-- 										onclick="historicoEtapasSimple(${entry.numeroConteudo}, 1, getElementsByName_iefix('table','worklistSimple')[0]);" --%>
<%-- 										title="<fmt:message key="ipdms.documentos.list.consultarHistory" />" --%>
<%-- 										alt="<fmt:message key="ipdms.documentos.list.consultarHistory" />" --%>
<!-- 										class="cursorMao" /> -->
										
									<td colspan="8">
											<a href="${pageContext.request.contextPath}/displayconteudo.do2?numero=${entry.numeroConteudo}&versao=${entry.versaoConteudo}">
											<b>
											${entry.variante.activo.titulo} (<fmt:formatDate
											value="${entry.dataPreenchimento.time}"
											pattern="dd-MM-yyyy HH'h'mm'm'" />)</b></a>
									</td>
								</tr>

							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</table>
	</div>
</c:if>
<div
		style="width: 95%; padding-left: 15px; font-weight: bold; font-size: 11px;">
		<b>(*) <fmt:message key="ipdms.listetapas.etapacorrente" /></b>
</div>
<br/>

<!-- DOCUMENTOS DE INSTRUCAO -->

<c:if test="${not empty docsInstrucao}">
	<div
		style="width: 95%; padding-left: 15px; font-weight: bold; font-size: 11px;">
		<fmt:message key="ipdms.listetapas.docsinstrucao" />
	</div>
	<div style="margin-left: 14px; width: 98%;">
		<table id="worklist">
			<tr>
				<th><fmt:message key="ipdms.listetapas.data" /></th>
				<th><fmt:message key="ipdms.listetapas.descricao" /></th>
				<th><fmt:message key="ipdms.listetapas.numdoc" /></th>
				<th><fmt:message key="ipdms.listetapas.autor" /></th>
				<th style="width: 36%"><fmt:message
						key="ipdms.listetapas.observacoes" /></th>
				<th><fmt:message key="ipdms.listetapas.documentos" /></th>
			</tr>
			<c:forEach var="documento" items="${docsInstrucao}"
				varStatus="status">
				<tr>
					<td><c:if test="${not empty documento.dataEmissao}">
							<fmt:formatDate value="${documento.dataEmissao}"
								pattern="dd-MM-yyyy HH:mm" />
						</c:if></td>
					<td>${documento.designacao}</td>
					<td>${documento.numeroDocumento}</td>
					<td>${documento.creator.titulo}</td>
					<td>${documento.comentario}</td>
					<td valign="top">
						<div id="doc_${documento.numeroConteudo}">
							<c:set var="idDocumentos"
								value="${idDocumentos}${documento.numeroConteudo}:" />
							<a href="#"
								onclick="previewDocumento('docdiv','${documento.numeroConteudo}');"
								title="${previewDocs}" alt="${previewDocs}">${documento.designacao}
								<i>(${documento.extensao})</i>
							</a> <a class="formfield"
								href="${pageContext.request.contextPath}${secure}/file/getDocumento.do2?nc=${documento.numeroConteudo}"
								target="_blank"> <img
								src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png"
								class="cursorMao" style="border-left: none"
								title="${consultarDocs}" alt="${consultarDocs}" />
							</a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</c:if>

<!-- docs do parent -->
<c:if test="${not empty parentDocsInstrucao}">
	<div
		style="width: 95%; padding-left: 15px; font-weight: bold; font-size: 11px;">
		<fmt:message key="ipdms.listetapas.docsinstrucao.procPaiDocs" />
		${parentDocsInstrucao[0].servicoOnline.idProcessoEntidade}
	</div>
	<div style="margin-left: 14px; width: 98%;">
		<table id="worklist">
			<tr>
				<th><fmt:message key="ipdms.listetapas.data" /></th>
				<th><fmt:message key="ipdms.listetapas.descricao" /></th>
				<th><fmt:message key="ipdms.listetapas.numdoc" /></th>
				<th><fmt:message key="ipdms.listetapas.autor" /></th>
				<th style="width: 36%"><fmt:message
						key="ipdms.listetapas.observacoes" /></th>
				<th><fmt:message key="ipdms.listetapas.documentos" /></th>
			</tr>
			<c:forEach var="documento" items="${parentDocsInstrucao}"
				varStatus="status">
				<tr>
					<td><c:if test="${not empty documento.dataEmissao}">
							<fmt:formatDate value="${documento.dataEmissao}"
								pattern="dd-MM-yyyy HH:mm" />
						</c:if></td>
					<td>${documento.designacao}</td>
					<td>${documento.numeroDocumento}</td>
					<td>${documento.creator.titulo}</td>
					<td>${documento.comentario}</td>
					<td valign="top">
						<div id="doc_${documento.numeroConteudo}">
							<c:set var="idDocumentos"
								value="${idDocumentos}${documento.numeroConteudo}:" />
							<a href="#"
								onclick="previewDocumento('docdiv','${documento.numeroConteudo}');"
								title="${previewDocs}" alt="${previewDocs}">${documento.designacao}
								<i>(${documento.extensao})</i>
							</a> <a class="formfield"
								href="${pageContext.request.contextPath}${secure}/file/getDocumento.do2?nc=${documento.numeroConteudo}"
								target="_blank"> <img
								src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png"
								class="cursorMao" style="border-left: none"
								title="${consultarDocs}" alt="${consultarDocs}" />
							</a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</c:if>
<!-- end of docs do parent -->

<c:if test="${not empty childsDocsInstrucao}">
	<c:forEach var="childsDocs" items="${childsDocsInstrucao}"
		varStatus="status">
		<div
			style="width: 95%; padding-left: 15px; font-weight: bold; font-size: 11px;">
			<fmt:message key="ipdms.listetapas.docsinstrucao.procFilho" />
			${childsDocs.servicoOnline.idProcessoEntidade}
		</div>
		<div style="margin-left: 14px; width: 98%;">
			<table id="worklist">
				<tr>
					<th><fmt:message key="ipdms.listetapas.data" /></th>
					<th><fmt:message key="ipdms.listetapas.descricao" /></th>
					<th><fmt:message key="ipdms.listetapas.numdoc" /></th>
					<th><fmt:message key="ipdms.listetapas.autor" /></th>
					<th style="width: 36%"><fmt:message
							key="ipdms.listetapas.observacoes" /></th>
					<th><fmt:message key="ipdms.listetapas.documentos" /></th>
				</tr>
				<tr>
					<td><c:if test="${not empty childsDocs.dataEmissao}">
							<fmt:formatDate value="${childsDocs.dataEmissao}"
								pattern="dd-MM-yyyy HH:mm" />
						</c:if></td>
					<td>${childsDocs.designacao}</td>
					<td>${childsDocs.numeroDocumento}</td>
					<td>${childsDocs.creator.titulo}</td>
					<td>${childsDocs.comentario}</td>
					<td valign="top">
						<div id="doc_${childsDocs.numeroConteudo}">
							<c:set var="idDocumentos"
								value="${idDocumentos}${childsDocs.numeroConteudo}:" />
							<a href="#"
								onclick="previewDocumento('docdiv','${childsDocs.numeroConteudo}');"
								title="${previewDocs}" alt="${previewDocs}">${childsDocs.designacao}
								<i>(${childsDocs.extensao})</i>
							</a> <a class="formfield"
								href="${pageContext.request.contextPath}${secure}/file/getDocumento.do2?nc=${childsDocs.numeroConteudo}"
								target="_blank"> <img
								src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png"
								class="cursorMao" style="border-left: none"
								title="${consultarDocs}" alt="${consultarDocs}" />
							</a>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</c:forEach>
</c:if>

<br>

<div class="leftTab label" style="width: 97%;"
	title="<fmt:message key='ipdms.listetapas.consultarProc'/> ${servicoOnline.idProcessoEntidade}">
	<a
		href="${pageContext.request.contextPath}/displayconteudo.do2?numero=${servicoOnline.numeroConteudo}&versao=${servicoOnline.versaoConteudo}"
		class="texto"> <img
		src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png">
		<fmt:message key="ipdms.listetapas.consultarProc" />
		${servicoOnline.idProcessoEntidade}
	</a>
</div>

<script type="text/javascript">

	getIdDocumentos = function(){				
		return '${idDocumentos}';	
	};

</script>
