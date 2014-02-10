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

<script type="text/javascript">

	function listComunasAjax(){
		var action = '${pageContext.request.contextPath}/listComunasAjax.do2';
		action += "?valuePlaceHolder=${param.valuePlaceHolder}";
		action += "&descPlaceHolder=${param.descPlaceHolder}";
		action += "&window=${param.window}";
		action += "&idMunicipio=${param.idMunicipio}";
		
		var myajax = new Ajax.Updater( 'comunas',action,
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
	  <c:when test="${not empty comunas}">
	  
	  	<display:table name="comunas" id="comuna" class="centro">
	  		<display:column class="centro">
	  			<c:set 	var="onclickfunction"
	  					value="affectParent('${comuna.value}','${comuna.title}');" />
	  			<a href="#" onclick="${onclickfunction}" class="label">${comuna.title}
	  			</a>
	  		</display:column>
	  	</display:table>
	  </c:when>
	  <c:otherwise>
	  	<table class="centro"><tr><td>
	  		<fmt:message key="ipdms.popups.comunas.nehumEncontrado" />
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

