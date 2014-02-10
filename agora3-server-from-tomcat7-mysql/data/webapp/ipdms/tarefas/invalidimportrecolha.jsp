<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.tarefas.importrecolha.titulo" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<html:form action="${urlAnterior}">
	<input type="hidden" name="method" value="prepare">
	<br/>
	
	<div>
		<p>&nbsp;&nbsp;
		<img src="${pageContext.request.contextPath}/images/icon/icon-stop.png"/>
		<fmt:message key="ipdms.tarefas.importrecolha.invaliddestination" />
		</p>
	</div>		
	
	<br />
	<div class="buttonRow">		
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" 
			title="<fmt:message key='ipdms.forms.anterior.title' />" />
	</div>	
</html:form>
