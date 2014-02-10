<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<LINK href='<kcms:path configEntry="THEMES" />/forms.css' type=text/css rel=stylesheet>
<LINK href='<kcms:path configEntry="THEMES" />/estilos.css' type=text/css rel=stylesheet>

<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms" %>
<script src='<kcms:path configEntry="JSDIR"/>/prototype.js' type="text/javascript"></script>
<script type="text/javascript">

	function listDistritosAjax(){
		var action = '${pageContext.request.contextPath}/listDistritosAjax.do2';
		action += "?valuePlaceHolder=${param.valuePlaceHolder}";
		action += "&descPlaceHolder=${param.descPlaceHolder}";
		action += "&window=${param.window}";
		
		var myajax = new Ajax.Updater( 'distritos',action,
				{method: 'get'} );
	}

	function affectParent(value, description){
		parent.document.getElementById('${param.valuePlaceHolder}').value=value;
		parent.document.getElementById('${param.descPlaceHolder}').innerHTML=description;
		parent.${param.window}.close();
	}
	
</script>

<body style="overflow:auto">
	<c:choose>
	  <c:when test="${not empty distritos}">
	  
	  	<display:table name="distritos" id="distrito" class="centro">
	  		<%--
	  		<display:column>
	  			${distrito.value}
	  		</display:column>
	  		--%>
	  		<display:column class="centro">
	  			<c:set 	var="onclickfunction"
	  					value="affectParent('${distrito.value}','${distrito.title}');" />
	  			<a href="#" onclick="${onclickfunction}"  class="label">
	  				${distrito.title}
	  			</a>
	  		</display:column>
	  	</display:table>
	  </c:when>
	  <c:otherwise>
	  	<table class="centro"><tr><td>
	  		<fmt:message key="ipdms.popups.distritos.nehumEncontrado" />
	  	</td></tr></table>
	  </c:otherwise>
	</c:choose>
	 <div class="buttonRow">
			<input type="button" class="btForm"
					title="<fmt:message key='ipdms.forms.fechar'  />"
					value="<fmt:message key="ipdms.forms.fechar"  />" 
					onclick="parent.${param.window }.close();">
			<input type="button" class="btForm"
					title="<fmt:message key='ipdms.forms.reset' />" 
					value="<fmt:message key="ipdms.forms.reset" />" 
					onclick="affectParent('','');">
	</div>
</body>


	
