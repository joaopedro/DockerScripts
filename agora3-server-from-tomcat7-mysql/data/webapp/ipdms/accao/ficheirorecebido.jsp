<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.accao.ficheirorecebido.envioFicheiro" var="envioFicheiro" />
<fmt:message key="ipdms.accao.ficheirorecebido.correctamenteEnviado" var="correctamenteEnviado" />

<script type="text/javascript">	
	document.title = '${productName} - ${envioFicheiro}';	 
</script>

<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${envioFicheiro}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<P class="formlabel">${correctamenteEnviado}</P>
