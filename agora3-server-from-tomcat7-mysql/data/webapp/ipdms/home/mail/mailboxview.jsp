<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<table cellpadding="4" cellspacing="0" width="100%">
	<tr>
		<td class="formlabel" width="15%">Mensagem de:</td>
    	<td class="formfield"><bean:write name="from" /></td>
	</tr>
	<tr>
		<td class="formlabel" width="15%">Enviada em:</td>
		<td class="formfield"><bean:write name="dataenvio" /></td>
	</tr>
	<tr>
		<td class="formlabel" width="15%">Assunto</td>
		<td class="formfield"><bean:write name="titulo" /></td>
	</tr>
	<logic:present name="processo">
		<tr>
			<td class="formlabel" width="15%">Processo</td>
			<td class="formfield"><a href=""><bean:write name="processo" /></a></td>
		</tr>
	</logic:present>
	<tr>
		<td class="formlabel" width="15%">Conteúdo</td>
		<td class="formfield"><bean:write name="corpo" /></td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" class="btForm" value="Eliminar" 
			onclick="if (confirm('Tem a certeza que quer eliminar definitivamente a mensagem?') ) location.href='mailboxcancel.do2?numero=<bean:write name="numero" />';" ></td>
	</tr>
</table>
