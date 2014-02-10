<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<c:set var="body"><tiles:insertAttribute name="body"/></c:set>
<tiles:insertDefinition name="ipdms.base">

  	<tiles:putAttribute name="main-body" type="string">

		<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
		<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
		<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
		<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
		<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
		<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

		<%-- <link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" /> --%>
		<%-- <script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script> --%>
		<%-- <script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script> --%>
		<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
		<SCRIPT type="text/javascript" src="${JS_DIR}/swf-ajax-ext.js"></script>
		<script type="text/javascript" src='${JS_DIR}/jquery/jquery-1.7.2.js' ></script>
		<script type="text/javascript" src='${JS_DIR}/dynamicFormFunctions.js' ></script>




		<script type="text/javascript">
			document.title = '${productName} - <fmt:message key="ipdms.dynamicform.form.edit.title" />';
		</script>


	<div id="ajaxlayout">
		<table style="border:none" cellpadding="0" cellspacing="0" width="100%" >
			<tr>
				<td>
                    ${body}
				</td>
			</tr>
		</table>
	</div>

	</tiles:putAttribute>
  	<tiles:putAttribute name="footer" value="/ipdms/base/footer.jsp"/>
</tiles:insertDefinition>

