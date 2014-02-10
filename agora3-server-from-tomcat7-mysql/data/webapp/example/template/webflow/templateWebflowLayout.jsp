<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href='${pageContext.request.contextPath}/ipdms/themes/forms.css' type="text/css" rel="stylesheet">
<script src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>

<script type="text/javascript">	
	document.title = 'IPDMS - ${title}';	 
</script> 

<tiles:insert definition="ipdms.base">
	<tiles:put name="main-body" direct="true">	
		<div id="ajaxlayout" >
			<table style="border:none;" cellpadding="0" cellspacing="0" width="100%" >
				<tbody>
					<tr>
						<td>
							<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
								<tbody>
								  <tr>
								    <td class="titulo1"><tiles:getAsString name="titulo-wizard" /></td>
								  </tr>
								  <tr>
								    <td class="titulo2"><tiles:getAsString name="titulo-ecra" /></td>
								  </tr>
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
		</div>
	</tiles:put>
  	<tiles:put name="footer" value="/ipdms/base/footer.jsp"/>
</tiles:insert>
