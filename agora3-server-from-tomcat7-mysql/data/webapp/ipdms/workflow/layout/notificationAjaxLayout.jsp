<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>

<script type="text/javascript">	
		document.title = '${productName} - ${notification.config.conteudo.tituloConteudo} (${notification.process.servicoOnline.idProcessoEntidade})';	 
	</script>
<div class="row" style="text-align:left; padding-top:0; padding-bottom:0px;">
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${notification.config.conteudo.tituloConteudo} (${notification.process.servicoOnline.idProcessoEntidade})</td>
		  </tr>
		</tbody>
	</table>					
</div>

<table style="border:none;" cellpadding="0" cellspacing="4" width="100%" >
	<tbody>
	<tr>
		<td>
			<tiles:get name="body" flush="false" />
		</td>
	</tr>
</tbody>
</table>
