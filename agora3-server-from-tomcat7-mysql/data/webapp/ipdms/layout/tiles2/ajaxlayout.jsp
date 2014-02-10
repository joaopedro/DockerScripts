<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="tilesTituloWizard">
	<tiles:getAsString name="titulo-wizard" />
</c:set>

<c:set var="tilesTituloEcra" >
	<tiles:getAsString name="titulo-ecra" ignore="true"/>
</c:set>


<c:set var="tituloEcra" ></c:set>
<fmt:message key="${tilesTituloWizard}" var="tituloWizard"/>
<c:if test="${not empty tilesTituloEcra}">	
	<fmt:message key="${tilesTituloEcra}" var="tituloEcra"/>
</c:if>

<table style="border:none" cellpadding="0" cellspacing="4" width="100%" >
	<tbody>
	 <tr>
		<td class="vTop">
			<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
						<tbody>
						  <tr>
						    <td class="titulo1">${tituloWizard}: ${tituloEcra}</td>
						  </tr>
						  <%--
						  <tr>
						    <td class="titulo2">${tituloEcra}</td>
						  </tr>
						  --%>
						</tbody>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<tiles:get name="body" flush="false" />
		</td>
	</tr>
</tbody>
</table>