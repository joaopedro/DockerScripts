<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html:form action="/saveCategoria" method="post" styleClass="form">
<html:hidden property="numero"/>

<table class="formtable" align="center">
	<tr>
		<td class="formlabel"><fmt:message key="ipdms.funcao.nome" /> * </td>
		<td class="formfield"><html:text property="nome" size="40" maxlength="80"/></td>
	</tr>

	<tr>
		<td class="formlabel"><fmt:message key="ipdms.funcao.descricao" /></td>
		<td class="formfield"><html:text property="descricao" size="80" maxlength="2000"/></td>
	</tr>

	<tr>
		<td class="formlabel"><fmt:message key="ipdms.funcao.idexterno" /></td>
		<td class="formfield"><html:text property="sigla" size="10" maxlength="20"/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="text-align:center;" colspan="2">
			<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit" />" title="<fmt:message key='ipdms.forms.submit.title' />" />
			<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
				onclick="setActionAndSubmit(this.form, 'listCategoria.do2');" />
			
		</td>
	</tr>
</table>
</html:form>