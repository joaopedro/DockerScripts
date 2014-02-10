<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib prefix="html" uri="/tags/html"  %>

<jsp:useBean id="now" class="java.util.Date"/>

<table width="100%" cellpadding="0" cellspacing="0" style="border:none">
	<tr>
		<td class="listaCinzenta">
			Actualizado em ${now}.
		</td>
	</tr>
	<tr>
		<td class="listaCinzenta">
			Valor da ComboBox ${param.value}.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
