<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib prefix="html" uri="/tags/html"  %>

<html:form action="/savestructuredcontent">

<html:hidden property="id"/>
<b>Adding structure data</b>

<table>
	<tr>
		<td>Label</td>
		<td>Valor</td>
	</tr>
	<c:forEach items="${structure.linhas}" var="linha">
	<tr>
		<td>${linha.rotulo }</td>
		<td><input type="text" name="${linha.colunaFisica}" id="${linha.colunaFisica}"/></td>
	</tr>
	</c:forEach>
</table>



<html:submit />
</html:form>