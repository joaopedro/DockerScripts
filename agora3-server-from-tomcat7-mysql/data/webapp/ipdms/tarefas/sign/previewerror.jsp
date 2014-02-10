<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.tarefas.assinar.title" var="title" />
<fmt:message key="ipdms.tarefas.assinar.erro" var="erro" />
<fmt:message key="ipdms.tarefas.assinar.erro.title" var="erroTitle" />
<fmt:message key="ipdms.tarefas.assinar.erro.descricao" var="erroDescricao" />
<fmt:message key="ipdms.forms.fechar" var="fechar" />

<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${title} - ${erro}</td>
		  </tr>
		</tbody>
	</table>					
</div>
<div style="padding-left: 10px;">
<p>${erroTitle}</p>
<p><b>${erroDescricao}: ${errorDescription}</b></p>
<br/>
<p><a href="javascript:window.close();">${fechar}</a></p>
</div>

