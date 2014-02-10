<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<LINK href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />
<LINK href='${THEMES_DIR}/estilos.css' type=text/css rel=stylesheet />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>
<script src='${JS_DIR}/utils.js' type="text/javascript"></script>

<fmt:message key="ipdms.product.name" var="productName"/>
	
<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.dimensoes.imprimir.titulo" />';	 
</script>

<div class="row" style="padding-top:0px; text-align:left;">
	<table border="0" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.dimensoes.imprimir.titulo" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<c:forEach items="${ficheiros}" var="ficheiro" varStatus="id">
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 87%; " title="Ficha">
			<label for="ficha"><a href="imprimirFichaDimensao.do2?path=${ficheiro.ficheiro}">${ficheiro.nome}</a> (${ficheiro.extensao})</label>
		</div>
	</div>
	
</c:forEach>