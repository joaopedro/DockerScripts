<%@page isErrorPage="true" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<div>
	<span class="texto">
		Ocorreu o seguinte erro ao tentar satisfazer o seu pedido:
		<br /><br />
		<strong style="color: red">${exception}</strong>
		<br /><br />
		Por favor tente mais tarde.
	</span>
</div>