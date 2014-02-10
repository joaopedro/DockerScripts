<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>

<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.dynamicform.form.edit.title" />';
</script>
<div id="ajaxlayout">
	<table style="border:none" cellpadding="0" cellspacing="0" width="100%" >
		<tr>
			<td>
				<tiles:insertAttribute name="body"/>
			</td>
		</tr>
	</table>
</div>