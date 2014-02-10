<form name="newmail" method="post" action="mailnewreg.do2">
<table cellpadding="4" cellspacing="0" width="100%">
	<tr>
		<td class="formlabel" width="15%">Nova Mensagem</td>
    	<td class="formfield">&nbsp;</td>
	</tr>
	<tr>
		<td class="formlabel" width="15%">Para</td>
    	<td class="formfield"><input type="button" value="Destinatários" class="btFormSecundario" click="window.open( 'mailshowusers.do2?ids=' + document.newmail.to.value, '_blank', 'height=500,width=400,top=100,left=100,resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no' );"><input type="hidden" name="to"><div id="idto"></div></td>
	</tr>
	<tr>
		<td class="formlabel" width="15%">Assunto</td>
		<td class="formfield"><input type="text" name="subject" size="50" maxlength="80"></td>
	</tr>
	<tr>
		<td class="formlabel" width="15%">Processo</td>
		<td class="formfield"><input type="text" name="processo" size="20" maxlength="20"></td>
	</tr>
	<tr>
		<td class="formlabel" width="15%">Mensagem</td>
		<td class="formfield"><textarea name="body" cols="50" rows="6"></textarea></td>
	</tr>
	<tr>
		<td class="formlabel" width="15%">&nbsp;</td>
		<td ><input type="button" value="Enviar" class="btForm" onclick="
	if ( document.newmail.to.value == null || document.newmail.to.value == '' )
		{
		alert('Deve preencher o(s) destinatário(s)');
		return false;
		}
	if ( document.newmail.subject.value == null || document.newmail.subject.value == '' )
		{
		alert('Deve preencher o assunto');
		return false;
		}
	if ( document.newmail.body.value == null || document.newmail.body.value == '' )
		{
		alert('Deve preencher o corpo da mensagem');
		return false;
		}
	document.newmail.submit();
"></td>
	</tr>
</table>
</form>