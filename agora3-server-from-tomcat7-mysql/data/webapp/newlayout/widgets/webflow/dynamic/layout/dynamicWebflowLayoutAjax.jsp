<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<c:set var="THEMES_DIR" value="${CONTEXT_PATH}/newlayout/themes" />
<c:set var="JS_DIR" value="${CONTEXT_PATH}/newlayout/js" />

<link href="${THEMES_DIR}/estilos.css" rel="stylesheet" type="text/css" />
<script src='${JS_DIR}/jquery/dynamicFormFunctions.js' type="text/javascript"></script>
<script src='${CONTEXT_PATH}/newlayout/js/jquery/swf-ajax-jquery.js' type="text/javascript"></script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>--%>


<c:set var="tilesTituloEcra">
	<tiles:getAsString name='titulo-ecra' />
</c:set>

<c:if test="${not empty tilesTituloEcra}">
 <fmt:message key="${tilesTituloEcra}" var="tituloEcra" />
</c:if>

<fmt:message key="ipdms.product.name" var="productName"/>
<script type="text/javascript">
	document.title = '${productName} - ${dynamic.formTemplate.title}';
</script>

<%--<div id="ajaxlayout" style="width: 50%; margin-left: auto; margin-right: auto; border-right: none;">--%>
<div id="ajaxlayout">

	<table style="border:none;" cellpadding="0" cellspacing="0" width="100%" >
		<tbody>
            <tr>
                <td>
                    <div><h1>${dynamic.formTemplate.title}</h1></div>
                    <c:if test="${not empty tituloEcra}">
                        <div><h1>${tituloEcra}</h1></div>
                    </c:if>
                </td>
            </tr>
		    <tr>
			    <td><tiles:insertAttribute name="body"/></td>
		    </tr>
	    </tbody>
	</table>

</div>


