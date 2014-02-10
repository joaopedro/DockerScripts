<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.tarefas.assinar.title" var="title" />
<fmt:message key="ipdms.tarefas.assinar.resultado" var="resultado" />
<fmt:message key="ipdms.tarefas.assinar.numDoc" var="numDoc" />
<fmt:message key="ipdms.tarefas.assinar.designacao" var="designacao" />
<fmt:message key="ipdms.tarefas.assinar.dataRegisto" var="dataRegisto" />
<fmt:message key="ipdms.tarefas.assinar.doc" var="doc" />
<fmt:message key="ipdms.tarefas.assinar.consultarFicheiro" var="consultarFicheiro" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" />

<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${title} - ${resultado}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<html:form action="${urlAnterior}" method="post">
	
	<table cellpadding="0" cellspacing="0" class="centro" style="width:99%">
		<tr>
			<th class="centro" width="10%">${numDoc}</th>
			<th class="centro" width="30%">${designacao}</th>
			<th class="centro" width="13%">${dataRegisto}</th>
			<th class="centro" width="9%">${doc}</th>
		</tr>
		<c:forEach items="${signedDocuments}" var="signeddoc">
			<tr>
				<td class="centro">${signeddoc.numeroDocumento}</td>
				<td class="centro">${signeddoc.titulo}</td>
				<td class="alignCenter"><fmt:formatDate value="${signeddoc.dataEmissao}" pattern="dd-MM-yyyy HH:mm" /></td>
				<td class="centro">				
					<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${signeddoc.numeroConteudo}" target="_blank" title="${consultarFicheiro}">
						<img src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" class="cursorMao" alt="${pesquisar}" title="${pesquisar}" />
					</a>				
				</td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<div class="buttonRow">		
		<input type="submit" class="btForm"
			value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />" />
	</div>	
</html:form>

