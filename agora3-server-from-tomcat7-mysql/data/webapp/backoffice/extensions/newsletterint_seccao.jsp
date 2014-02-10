<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- 
	coluna a coluna da seccao.
	seccao é a seccao a tratar.
--%>
<hr/>
<c:choose>
	<c:when test="${not empty seccao}">
		<span class="subtitleRed"> 
			Secção: <html:text property="extension.colunas[${statusColuna.index}].seccoes[${statusSeccao.index}].nome" maxlength="30" size="25"/>
			<html:hidden property="extension.colunas[${statusColuna.index}].seccoes[${statusSeccao.index}].ordem" />
		</span>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tbody>
				<c:forEach var="artigo" items="${seccao.artigos}" varStatus="statusArtigo">
					<tr><td><%@include file="newsletterint_artigo.jsp" %></td></tr>
				</c:forEach> 
				<c:forEach begin="${fn:length(seccao.artigos)}" end="4" varStatus="statusArtigo">
					<tr><td><%@include file="newsletterint_artigo.jsp" %></td></tr>
				</c:forEach> 				
			</tbody>
		</table>
	</c:when>
	<c:otherwise>
		<span class="subtitleRed">
			Secção: <input type="text" name="extension.colunas[${statusColuna.begin + statusColuna.index}].seccoes[${statusSeccao.index}].nome" maxlength="30" size="25"/>
			<input type="hidden" name="extension.colunas[${statusColuna.begin + statusColuna.index}].seccoes[${statusSeccao.index}].ordem"/>
		</span>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tbody>
				<c:forEach begin="0" end="4" varStatus="statusArtigo">
					<tr><td><%@include file="newsletterint_artigo.jsp" %></td></tr>
				</c:forEach> 
			</tbody>
		</table>	
	</c:otherwise>
</c:choose>
