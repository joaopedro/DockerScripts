<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<script>

	parseGeographicService = function(){
		new Ajax.Updater('geographicServiceDetailForm', 'parseGeographicService.do2',{
			parameters: {
					id: $('id').value,
					url: $('url').value
			}
		});
	}
</script>

<html:form action="/saveGeographicService" method="post" styleClass="form" enctype="multipart/form-data">
	
	<html:hidden styleId="id" property="id" />
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="Título">
			<bean:message key="ipdms.geographicService.url" locale="locale" />&nbsp;*
	  	</div>

	  	<div class="label" style="width: 80%;" title="Título">
	  		<html:text styleId="url" property="url" style="width: 50%;" size="40" maxlength="80"/>
	  		<input type="button" class="btForm" value="<bean:message key="ipdms.geographicService.parse" locale="locale"/>"
						onclick="parseGeographicService()">
	  	</div>
	</div>
	
	<div id="geographicServiceDetailForm"></div>
	
	<c:if test="${not empty geographicServiceFormBean.url}">
		<script>parseGeographicService();</script>
	</c:if>
	
	<div class="row" style="padding-bottom:20px;">
		<div class="leftTab label" style="width: 90%; " title="Nome">
	  		<span class="formlabel_obrigatorio"><bean:message key="ipdms.obrigatorio" locale="locale" /></span>
	  	</div>
	</div>
	
	<input type="button" class="btForm" value="<bean:message key="ipdms.forms.anterior" locale="locale"/>" title="Retroceder ao ecrã anterior"
					onclick="setActionAndSubmit(this.form, 'listGeographicService.do2');">
	<input type="submit" class="btForm" value="<bean:message key="ipdms.forms.submit" locale="locale"/>" title="Submeter a informação">
	
</html:form>

<%--
--%>