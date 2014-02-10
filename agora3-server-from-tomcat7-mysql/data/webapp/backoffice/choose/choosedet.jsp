<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<table border="0" cellpadding="0" cellspacing="0">
<tr><td>&nbsp;</td></tr>
<logic:iterate name="listaconts" id="entry">
	<tr><td><a href="javascript: choosenumero(${entry.numeroConteudo}, '${entry.titulo}')">${entry.titulo}</a></td></tr>
</logic:iterate>
</table>
