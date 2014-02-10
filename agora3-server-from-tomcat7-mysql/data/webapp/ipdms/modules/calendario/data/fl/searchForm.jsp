<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:message key="data.fl.organica" var="organicaDes" bundle="${calendarioBundle}" />

<html:form styleId="flSearchForm" action="fl/list">
<fieldset>
	
	<html:hidden property="calendarioid" value="${param.id}" />
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='data.designacao' bundle='${calendarioBundle}' />">
			<label for="params(designacao)"><fmt:message key="data.designacao" bundle="${calendarioBundle}" /></label>
		</div>
		<div class="label" style="width: 80%;" title="<fmt:message key='data.designacao' bundle='${calendarioBundle}' />">
			<html:text property="params(designacao)" />
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='data.data' bundle='${calendarioBundle}' />">
			<label for="params(data)"><fmt:message key="data.data" bundle="${calendarioBundle}" /></label>
		</div>
		<div class="label" style="width: 80%;" title="<fmt:message key='data.data' bundle='${calendarioBundle}' />">
			<html:text styleId="data" property="params(data)" size="10" maxlength="10" />
			<img style="vertical-align: bottom" id="searchDataImg" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" 
				class="cursorMao" alt="<fmt:message key='data.data' bundle='${calendarioBundle}' />" title="<fmt:message key='data.data' bundle='${calendarioBundle}' />" />
		</div>
        <script type='text/javascript'>
         	Calendar.setup({ inputField : 'data', ifFormat : '%d-%m-%Y', showsTime : false });
         	Calendar.setup({ inputField : 'data', ifFormat : '%d-%m-%Y', button : "searchDataImg" });
        </script>		
	</div>

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="${organicaDes}">
			<label for="params(organica)">${organicaDes}</label>
		</div>
		<div class="label" style="width: 80%;">
			<html:hidden styleId="searchorganicaid" property="params(organica)" />
			<span id="searchorganicadesc"></span>
			<img style="vertical-align: bottom" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
				class="cursorMao" alt="${organicaDes}" title="${organicaDes}" 
				onclick="showOrganicaForSearch();" />
		</div>
	</div>

	<div class="buttonRow">
		<input type="button" class="btForm" value='<fmt:message key="ipdms.forms.search" bundle="${calendarioBundle}"/>' onclick="list${viewPrefix}();" title='<fmt:message key="ipdms.forms.search.title" bundle="${calendarioBundle}"/>' />
		<input type="button" class="btFormEscuro" value='<fmt:message key="ipdms.forms.cancelar" bundle="${calendarioBundle}"/>' onclick="cancelSearch${viewPrefix}();" title='<fmt:message key="ipdms.forms.cancelar.title" bundle="${calendarioBundle}"/>' />
	</div>
</fieldset>
</html:form>

<script>
function showOrganicaForSearch(){
	var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
	paramts = "valuePlaceOlder=searchorganicaid";
	paramts += "&descPlaceOlder=searchorganicadesc";
	paramts += "&window=winchoose";
	
	ExtWindow('${organicaDes}',action,paramts,'ext');
}
</script>
