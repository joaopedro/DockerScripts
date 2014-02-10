<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page errorPage="/backoffice/errors/error.jsp" %>

<script language="javascript1.2" type="text/javascript">
	function selectAll(button)
	{
		var i = 0;
		var	elements = document.forms['conteudoForm'].elements
		var checked = "Check" == button.value;
		var valueChecked;	
		if (checked) {
			button.value = 'UnCheck';
			valueChecked = true;
		} else {
			button.value = 'Check';
			valueChecked = false;		
		}
		
		for (i = 0; i < elements.length; i++) {
			var element = elements[i];

			if (element.name.indexOf(button.id) != -1){
				element.checked = valueChecked;
			}
		}
	}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody>
		<tr>
			<td class="titulos" height="35">
				&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.perfis.titulo.label" locale="locale"/>
			</td>
		</tr>
		<tr>
			<td align="left" class="texto" colspan="2">
			<table border="0" width="90%" cellpadding="0" cellspacing="0" style="margin-left: 19px">
				<tbody>
					<tr bgcolor="#dd2222">
						<td class="texto" style="color: 'white'">&nbsp;<bean:message key="kcms.perfis.perfil.label" locale="locale"/></td>
						<td class="texto" align="center" style="color: 'white'"><bean:message key="kcms.perfis.leitura.label" locale="locale"/></td>
						<td class="texto" align="center" style="color: 'white'"><bean:message key="kcms.perfis.escrita.label" locale="locale"/></td>
						<td class="texto" align="center" style="color: 'white'"><bean:message key="kcms.perfis.listar.label" locale="locale"/></td>
					</tr>
					
					
					<logic:iterate id="perfil" name="perfis">
						<bean:define id="baseProp">perfil(${perfil.numeroConteudo})</bean:define>
						<tr>
							<td class="texto">${perfil.titulo}</td>
							<td class="texto" align="center">
							
								<html:checkbox property='${baseProp}.leitura' />
							</td>
							<td class="texto" align="center">
								<html:checkbox property='${baseProp}.escrita' />
							</td>
							<td class="texto" align="center">
								<html:checkbox property='${baseProp}.browse' />
							</td>
						</tr>
					</logic:iterate>
					<tr bgcolor="gainsboro">
						<td></td>
						<td align="center">
							<input  type="button" 
									class="gainsboroButton" 
									id="leitura" 
									value="Check" 
									onclick="selectAll(this)" />
						</td>
						<td align="center">
							<input type="button" 
								   class="gainsboroButton" 
								   id="escrita" 
								   value="Check" 
								   onclick="selectAll(this)" />
						</td>
						<td align="center">
							<input type="button" 
									class="gainsboroButton" 
									id="browse" 
									value="Check" 
									onclick="selectAll(this)" />
						</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
	</tbody>
</table>
