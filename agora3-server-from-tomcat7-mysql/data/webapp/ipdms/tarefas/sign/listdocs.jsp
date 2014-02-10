<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.tarefas.assinar.title" var="title" />
<fmt:message key="ipdms.tarefas.assinar.document.empty" var="documentEmpty" />
<fmt:message key="ipdms.tarefas.assinar.numDoc" var="numDoc" />
<fmt:message key="ipdms.tarefas.assinar.designacao" var="designacao" />
<fmt:message key="ipdms.tarefas.assinar.dataRegisto" var="dataRegisto" />
<fmt:message key="ipdms.tarefas.assinar.assinar" var="assinar" />
<fmt:message key="ipdms.tarefas.assinar.pagina" var="pagina" />
<fmt:message key="ipdms.tarefas.assinar.preview" var="preview" />
<fmt:message key="ipdms.tarefas.assinar.assinarDocs" var="assinarDocs" />

<script type="text/javascript">	
	document.title = '${productName} - ${title}';	 
</script>

<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${title}</td>
		  </tr>
		</tbody>
	</table>					
</div>


<html:errors/>

<html:form action="/tarefas/assinarpdfsprocesso" method="post">
	<input type="hidden" name="method" value="save">
	
	<%-- TABELA DE DOCUMENTOS PARA ASSINAR--%>	
	<c:choose>
		<c:when test="${empty addSignatureImageForm.documents}">
			<br/><p>
			${documentEmpty}
			</p>
		</c:when>
		<c:otherwise>
			<table cellpadding="0" cellspacing="0" class="centro" style="width:99%">
				<tr>
					<th class="centro" width="10%">${numDoc}</th>
					<th class="centro" width="30%">${designacao}</th>
					<th class="centro" width="13%">${dataRegisto}</th>
					<th class="centro" width="3%">${assinar}</th>
					<th class="centro" width="4%">${pagina}</th>
					<th class="centro" width="4%">X</th>
					<th class="centro" width="4%">Y</th>
					<th class="centro" width="9%"></th>
				</tr>
				<nested:iterate property="documents" id="documents" indexId="i">
					<tr>
						<td class="centro"><nested:write property="documento.numeroDocumento"/> </td>
						<td class="centro"><nested:write property="documento.titulo"/></td>
						<td class="alignCenter"><fmt:formatDate value="${documents.documento.dataEmissao}" pattern="dd-MM-yyyy HH:mm" /></td>
						<td class="alignCenter"><nested:checkbox property="sign" /></td>
						<td class="alignCenter">
							<nested:select property="page" styleId="page${i}">
								<c:forEach begin="1" end="${documents.numberOfPages}" var="step">
									<html:option value="${step}">${step}</html:option>
								</c:forEach>	
							</nested:select> 
						</td>
						<td class="alignCenter">
							<nested:text property="x" styleId="x${i}" size="3" maxlength="4" />
						</td>
						<td class="alignCenter">
							<nested:text property="y" styleId="y${i}" size="3" maxlength="4" />
						</td>
						<td class="centro">
							<a href="#" onclick="previewAddSignature(${documents.documento.numeroConteudo}, ${i});">
								${preview}
							</a>
						</td>
					</tr>
				</nested:iterate>
			</table>
		</c:otherwise>
	</c:choose>
	<br />
	<div class="buttonRow">		
		<input type="button" class="btForm"
			value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
			onclick="this.form.action='${pageContext.request.contextPath}${urlAnterior}'; this.form.method.value='prepare'; this.form.submit();" />
		<c:if test="${not empty addSignatureImageForm.documents}">
		<input type="submit" class="btForm" title="${assinarDocs}" value="${assinarDocs}" />
		</c:if>
	</div>	
</html:form>


<script>
previewAddSignature = function(documentId, index) {
	var link = '${pageContext.request.contextPath}/tarefas/previewAssinarPdf.do2?';
	link += 'numeroConteudo=' + documentId;
	link += '&page=' + $('page' + index).value;
	link += '&x=' + $('x' + index).value;
	link += '&y=' + $('y' + index).value;
	window.open(link,'previewpdf');
};
</script>
