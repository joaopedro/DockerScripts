<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib prefix="html" uri="/tags/html"  %>

<html:form action="/savestructure">

<html:hidden property="id"/>
<b>Editing structure</b>
<br /><br />
<table>
	<tr>
		<td>
			Nome :
		</td>
		<td>
			<html:text property="nome"/>
		</td>
	</tr>
<table/>			
<br />
<b>Structure Fields</b>
<br />
<table>
	<tr>
		<th>Nome</th>
		<th>Rótulo</th>
		<th>Tipo</th>
		<th>Tamanho</th>
	</tr>
	<c:forEach var="field" items="${structureForm.fields}">
	<tr>
		<td><html:text name="field" property="nome" indexed="true"/></td>
		<td><html:text name="field" property="rotulo" indexed="true"/></td>
		<td><html:text name="field" property="tipo" indexed="true"/></td>
		<td><html:text name="field" property="tamanho" indexed="true"/></td>
	</tr>
	</c:forEach>
	<tr>
 		<td><html:text property="newField.nome"/></td>
		<td><html:text property="newField.rotulo"/></td>
		<td><html:select property="newField.tipo">
				<html:option value="ST">String</html:option>
				<html:option value="DT">Date Time</html:option>
				<html:option value="IT">Integer</html:option>
				<html:option value="BL">Sim/Não</html:option>
			</html:select>
		</td>
		<td><html:text property="newField.tamanho"/></td>
	</tr>
</table>


<html:submit />
</html:form>