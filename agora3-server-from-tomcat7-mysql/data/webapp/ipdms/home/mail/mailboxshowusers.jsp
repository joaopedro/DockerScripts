<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<script>
	var arr = new Array();

	function executaclick()
		{
		var i;
		var valor;
		var s = "";
		var sn = "";
		for ( i = 0; i < arr.length; i++ )
			{

			if ( arr[ i ].obj.checked )
				{
				if ( s != "" )
					{
					s = s + ";";
					sn = sn + ";";
					}
				s = s + arr[i].obj.value;
				sn = sn + arr[i].nome;
				}
			}
			opener.document.newmail.to.value = s;
			opener.document.getElementById( "idto" ).innerHTML = sn;
			window.close();
		}
</script>
<form name="dados">
<table cellpadding="4" cellspacing="0" width="100%">
	<tr>
		<td class="formlabel">Escolha de Destinatários</td>
	</tr>
	<logic:iterate name="colaboradores" id="cob" indexId="i">
	<tr>
    	<td class="formfield"><input type="checkbox" value="<bean:write name="cob" property="codigo" />"
			name="cod<bean:write name="cob" property="codigo" style="border:0;" />" <bean:write name="cob" property="selected" />>
			<bean:write name="cob" property="descricao" />
			<script>
				i = arr.length;
				arr[ i ] = new Object();
				arr[ i ].obj = document.dados.cod<bean:write name="cob" property="codigo" />;
				arr[ i ].nome = '<bean:write name="cob" property="descricao" />';
			</script>
		</td>
	</tr>
	</logic:iterate>
	<tr>
		<td><input type="button" value="Utilizar" onclick="executaclick();" class="btForm"></td>
	</tr>
</table>
</form>