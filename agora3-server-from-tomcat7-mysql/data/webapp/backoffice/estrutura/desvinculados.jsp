<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<form action="vincular.do2" name="dadosvinc" method="post" onsubmit="return false;">
<table border="1">
	<tr><td colspan="2" align="right"><img style="cursor: hand" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick="cleardivs('listades')"></td></tr>
	<tr><td colspan="2">
			<input type="hidden" name="elementoPai" value="${elementoPai.numeroConteudo}" />
			<h3>${elementoPai.titulo} :</h3>
			<logic:iterate id="utilizador" name="utilizadoresDesvinculados" >
				<input type="checkbox" name="utilizador" value="${utilizador.numeroConteudo}" />${utilizador.titulo}<br />
			</logic:iterate>
			<input type="submit" value="Vincular" onclick="ajaxSubmitGeneric( document.dadosvinc, 'listades', reloadme ); cleardivs('listades');"/>
</td></tr>
</table>
</form>
