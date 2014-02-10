<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.tarefas.anexarDocs.tile" var="tile" />
<fmt:message key="ipdms.tarefas.anexarDocs.help.pt1" var="helpPt1" />
<fmt:message key="ipdms.tarefas.anexarDocs.help.pt2" var="helpPt2" />
<fmt:message key="ipdms.tarefas.anexarDocs.help.pt3" var="helpPt3" />
<fmt:message key="ipdms.tarefas.anexarDocs.infoMsg" var="infoMsg" />
<fmt:message key="ipdms.tarefas.anexarDocs.nomeDoc" var="nomeDoc" />
<fmt:message key="ipdms.tarefas.anexarDocs.doc" var="doc" />
<fmt:message key="ipdms.tarefas.anexarDocs.tipo" var="tipo" />
<fmt:message key="ipdms.tarefas.anexarDocs.anexados" var="anexados" />
<fmt:message key="ipdms.tarefas.anexarDocs.formato" var="formato" />
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />

<%-- lockMessages --%>
<fmt:message key="processo.priority.running" var="running" />
<fmt:message key="ipdms.tarefas.anexarDocs.lock.error.title" var="errorTitle" />
<fmt:message key="ipdms.tarefas.anexarDocs.lock.error.msg" var="errorMsg" />
<fmt:message key="ipdms.tarefas.anexarDocs.lock.error.msgPt2" var="errorMsgPt2" />
<fmt:message key="ipdms.tarefas.anexarDocs.lock.accessNotAllowed" var="accessNotAllowed" />
<fmt:message key="ipdms.tarefas.anexarDocs.lock.alreadyLock" var="alreadyLock" />
<fmt:message key="ipdms.tarefas.anexarDocs.lock.alreadyLockPt2" var="alreadyLockPt2" />
<fmt:message key="ipdms.tarefas.anexarDocs.lock.success.title" var="successTitle" />
<fmt:message key="ipdms.tarefas.anexarDocs.lock.success.msg" var="successMsg" />
<fmt:message key="ipdms.tarefas.anexarDocs.lock.success.msgPt2" var="successMsgPt2" />

<c:set var="IMGDIR" value="${pageContext.request.contextPath}/images/" />

<script src="${pageContext.request.contextPath}/ipdms/js/documentlock.js" type="text/javascript"></script>
<script type="text/javascript">	
	document.title = '${productName} - ${tile}';	 
</script>
<%-- DIV AJUDA --%>
<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${tile}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${IMGDIR}icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${tile}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${IMGDIR}icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" /></td>
		  </tr>
		</tbody>
	</table>	
	<ul>
		<li> ${helpPt1} </li>
		<c:if test="${not empty documentosGenericosForm.savedDocuments}">
			<li> ${helpPt2} </li>
		</c:if>
		<li> ${helpPt3} </li>
	</ul>				
</div>

<%-- MENSAGENS DE ERRO--%>
<div id="MensagemErro">
	<html:errors />
	<c:if test="${not empty missingTipos}">
	<br/>
	<div class="mensagenCaixa">
		<div style="float:left; width:2%;">
			<img src="${IMGDIR}icon/icon-atencao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/>
		</div>
		<div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
			<div class="info" style="margin-left:-10px;">
				${infoMsg}:
				<ul style="margin-left:40px;">
					<c:forEach items="${missingTipos}" var="tipo">
						<li style="list-style-image: url(images/icon/icon-seta.png); margin-left:-27px; font-weight:normal; color:#000000; padding-top:3px; ">
						${tipo.descricao}
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div style="clear:both">
		</div>
	</div>	
</c:if>
</div>

<br/>
<c:set var="hasTipificacao" value="${not empty documentosGenericosForm.tiposDocumento}" />

<%-- FORM DE UPLOAD OU REMOCAO --%>
<html:form action="/tarefas/gravardocsgenericos" method="post" enctype="multipart/form-data">
	<input type="hidden" name="method" value="save">
	<nested:hidden property="numero"/>
	<nested:hidden property="nid"/>
	
	<%-- TABELA DE UPLOAD --%>
	<table cellpadding="0" cellspacing="0" class="centro" style="width:500px;">
		<tr>
			<th width="250" class="centro">${nomeDoc}</th>
			<th width="150" class="centro">${doc}</th>
			<c:if test="${hasTipificacao}">
				<th width="250" class="centro">${tipo}</th>
			</c:if>
		</tr>
	
		<nested:iterate property="documentos" id="documentos" indexId="i">
			<nested:root name="documentos">
			<tr class="hoverTransparente">
				<td><nested:text property="description" size="30" maxlength="30" indexed="true" /></td>
				<td class="centro"><nested:file property="formFile" size="30" indexed="true"/></td>
				<c:if test="${hasTipificacao}">
					<td class="centro">
						<nested:select property="idTipoDocumento" indexed="true">
							<html:option value="0"><fmt:message key="ipdms.forms.select.default" /></html:option>
							<html:optionsCollection property="tiposDocumento" value="id.tipoDocumento.id" label="id.tipoDocumento.descricao" />				
	    				</nested:select>	
					</td>
				</c:if>
			</tr>
			</nested:root>
		</nested:iterate>
		<tr class="hoverTransparente">
			<td colspan="2">&nbsp;</td>
		</tr>
	</table>
	
	<br />
	
	<%-- SAVED DOCUMENTS --%>
	<c:if test="${not empty documentosGenericosForm.savedDocuments}">
	<table cellpadding="0" cellspacing="0" class="centro" style="width:500px; border:none;">
		<tr>
			<th width="175" class="centro" style="text-align: left;">${anexados}</th>
			<th width="110" class="centro">${formato}</th>
			<c:if test="${hasTipificacao}">
				<th width="210" class="centro">${tipo}</th>
			</c:if>
			<th width="15" class="centro"><fmt:message key="ipdms.forms.eliminar" /></th>
			<th width="5" class="centro">&nbsp;</th>
		</tr>
		<nested:iterate property="savedDocuments" id="savedDocuments">
		<nested:root name="savedDocuments">
			<c:set var="documentId" value="${savedDocuments.document.numeroConteudo}" />
			<tr>
				<td class="centro">
					<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${documentId}" target="_blank">
						${savedDocuments.document.designacao}
					</a>
				</td>
				<td class="alignCenter">
					${savedDocuments.document.extensao}
				</td>
				<c:if test="${hasTipificacao}">
					<td class="centro">
						<c:choose>
							<c:when test="${not empty savedDocuments.document.tipoDocumentoAnexado}">
								${savedDocuments.document.tipoDocumentoAnexado.descricao}
							</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
				</c:if>				
				<td class="centro">
					<nested:checkbox property="selected" indexed="true" style="border:0;" />
				</td>
				<td class="centro">
					<c:choose>
						<c:when test="${savedDocuments.document.locked}">
							<input id="${documentId}_lock" style="display: none;" 
								type="button" value="Lock" class="btFormEscuro" onclick="documentLock('${documentId}');">
							<input id="${documentId}_unlock" 
								type="button" value="Unlock" 
								class="btFormEscuro" onclick="documentUnlock('${documentId}');">
						</c:when>
						<c:otherwise>
							<input id="${documentId}_lock" 
								type="button" value="Lock" class="btFormEscuro" onclick="documentLock('${documentId}');">
							<input id="${documentId}_unlock" 
								type="button" value="Unlock" style="display: none;" 
								class="btFormEscuro" onclick="documentUnlock('${documentId}');">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</nested:root>
		</nested:iterate>
	</table>
	<div id="resultDiv"></div>
	</c:if>
	
	<br />
	<div class="buttonRow">		
		<input type="button" class="btForm"
			value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
			onclick="this.form.action='${pageContext.request.contextPath}${urlAnterior}'; this.form.method.value='prepare'; this.form.submit();" />
		<input type="submit" class="btForm" title="<fmt:message key='ipdms.forms.submit.title' />"
			value="<fmt:message key="ipdms.forms.submit" />" />
	</div>	
</html:form>
<script>
var lockMessages = new Array();
	lockMessages["running"] = "${running}";
	lockMessages["errorTitle"] = "${errorTitle}";
	lockMessages["errorMsg"] = "${errorMsg}";
	lockMessages["errorMsgPt2"] = "${errorMsgPt2}";
	lockMessages["accessNotAllowed"] = "${accessNotAllowed}";
	lockMessages["alreadyLock"] = "${alreadyLock}";
	lockMessages["alreadyLockPt2"] = "${alreadyLockPt2}";
	lockMessages["successTitle"] = "${successTitle}";
	lockMessages["successMsg"] = "${successMsg}";
	lockMessages["successMsgPt2"] = "${successMsgPt2}";

function documentLock(ncDocumento) {
	lock('${pageContext.request.contextPath}', ncDocumento, lockMessages);
}

function documentUnlock(ncDocumento) {
	unlock('${pageContext.request.contextPath}', ncDocumento, lockMessages);
}
</script>