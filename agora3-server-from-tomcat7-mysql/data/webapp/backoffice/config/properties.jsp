<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form name="properties" method="post" action="configpropertiesreg.do2">
<table border="1">
	<tr><td colspan="2" align="right"><img style="cursor: hand" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick="cleardivs('properties')"></td></tr>
	<tr><th>Código</th><td><input type="text" name="codigo" value="${ codigo }" size="40" maxlength="255" onchange="checkCodigo( document.properties.fullpath.value, document.properties.codigo.value, 'cprop' )"><span id="cprop"></span></td></tr>
	<tr><th>Descrição</th><td><input type="text" name="descricao" value="${ descricao }" size="40" maxlength="100"></td></tr>
	<tr><th>Tipo</th><td><select size="1" name="tipo" onchange="showchoose( this.value, 'btnshow' )">
							<option value="C" <c:if test="${ tipo == 'C' }">selected</c:if>>Conteúdo</option>
							<option value="N" <c:if test="${ tipo == 'N' }">selected</c:if>>Número</option>
							<option value="S" <c:if test="${ tipo == 'S' }">selected</c:if>>String</option>
							<option value="D" <c:if test="${ tipo == 'D' }">selected</c:if>>Data</option>
						</select><button id="btnshow" onclick="choosevalue( document.properties.valor, this )" style="visibility: hidden">?</button></td></tr>
	<tr><th>Valor</th><td><input type="text" name="valor" value="${ valor }" size="40" maxlength="254" onchange=" getDescription( document.properties.tipo.value, document.properties.valor, 'cval' )"><span id="cval"></span></td></tr>
	<tr><td colspan="2"><input type="hidden" name="fullpath" value="${ codigo }"><input type="button" value="Gravar" onclick=" checkandsubmit( document.properties, 'cprop' );"></td></tr>
</table>
<script type="text/javascript" language="JavaScript1.2">
	showchoose( document.properties.tipo.value, 'btnshow' );
	if ( document.properties.tipo.value == 'C' )
		 getDescription( document.properties.tipo.value, document.properties.valor, 'cval' );
</script>
</form>