<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insert definition="ipdms.base">
  <tiles:put name="main-body" direct="true">

	<LINK href='${pageContext.request.contextPath}/ipdms/themes/forms.css' type="text/css" rel="stylesheet">
	<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax.js' type="text/javascript"></script>
	<SCRIPT src="${pageContext.request.contextPath}/ipdms/js/morada.js" type="text/javascript"></script>

	<script type="text/javascript">
	function listarTextoSample()
	{
		var wnd;
	
		if( !wnd || wnd.closed )
		{
			wnd = window.open( "${pageContext.request.contextPath}/listartextosample.do2", "natpopup", "toolbar=0, status=0, menubar=0, scrollbars=1, resizable=1, width=730, height=500, top=100, left=100" );
		}
		else
		{
			wnd.location.href = "${pageContext.request.contextPath}/listartextosample.do2";
			wnd.focus();
		}
	}
	</script>
<script type="text/javascript">	
	document.title = 'IPDMS - <tiles:getAsString name="titulo-wizard" /> : ${tituloVariante}';	 
</script>
	<div id="ajaxlayout" >
		<table style="border:none" cellpadding="0" cellspacing="0" width="100%" >
			<tbody>
			<!-- TÍTULOS -->
			<tr>
				<td>
					<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
						<tbody>
						  <tr>
						    <td class="titulo1"><tiles:getAsString name="titulo-wizard" /> : ${tituloVariante}</td>
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

