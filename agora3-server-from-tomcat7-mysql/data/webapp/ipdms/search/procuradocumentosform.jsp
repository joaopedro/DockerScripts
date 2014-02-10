<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/ipdms/js/processoutil.js"></script>

<script type="text/javascript">
Ext.onReady(function(){
	//cololcar formato de data caso nao haja datas reais
	dateFormatCheckonLoad();
});
</script>

<html:form method="post" action="/procuradocumentos" onsubmit="dateFormatCheckonSubmit();">
	<html:hidden property="page" value="1" />

	<div class="row formlabel_sf" >
	 	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.pesquisa.documentos.numDocumento' />">
	  		<fmt:message key="ipdms.pesquisa.documentos.numDocumento" />
	  	</div>
	  	<div class="label" style="width: 20%;" title="<fmt:message key='ipdms.pesquisa.documentos.numDocumento' />">
	  		<html:text styleClass="textinput" property="params(numeroDocumento)"  maxlength="20" />
	  	</div> 	
	  	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.pesquisa.documentos.numProcesso' />">
	  		<fmt:message key='ipdms.pesquisa.documentos.numProcesso' />
	  	</div>
	  	<div class="label" style="width: 20%;" title="<fmt:message key='ipdms.pesquisa.documentos.numProcesso' />">
	  		<html:text styleClass="textinput" property="params(numeroProcesso)"  maxlength="20" />
	  	</div>
	</div>	

	<div class="row formlabel_sf" >
	 	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.pesquisa.documentos.numUnicoEntrada' />">
	  		<fmt:message key='ipdms.pesquisa.documentos.numUnicoEntrada' />
	  	</div>
	  	<div class="label" style="width: 20%;" title="<fmt:message key='ipdms.pesquisa.documentos.numUnicoEntrada' />">
	  		<html:text styleClass="textinput" property="params(numeroUnicoEntrada)"  maxlength="20"  />
	  	</div> 	
	  	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.pesquisa.documentos.numUnicoSaida' />">
	  		<fmt:message key='ipdms.pesquisa.documentos.numUnicoSaida' />
	  	</div>
	  	<div class="label" style="width: 20%;" title="<fmt:message key='ipdms.pesquisa.documentos.numUnicoSaida' />">
	  		<html:text styleClass="textinput" property="params(numeroUnicoSaida)"  maxlength="20" />
	  	</div>
	</div>

	<div class="row formlabel_sf" >	
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.pesquisa.documentos.dataRegistoDoc' />">
	  		<fmt:message key='ipdms.pesquisa.documentos.dataRegistoDoc' />
	  	</div>
	 	<div class="label" style="width: 10%;" title="<fmt:message key='ipdms.pesquisa.documentos.dataRegistoDoc' />">
	  		<html:text styleId="dataInicio" property="params(dataInicio)" size="10" maxlength="10" styleClass="date" onkeypress="return false;"
								onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/>	
	  	</div>
	  	<div class="leftTab label" style="width: 4%;" title="<fmt:message key='ipdms.pesquisa.documentos.dataAte' />"><fmt:message key='ipdms.pesquisa.documentos.dataAte' /></div>
		<div class="label" style="width: 10%;" title="<fmt:message key='ipdms.pesquisa.documentos.dataAte' />">
			<html:text styleId="dataFim" property="params(dataFim)" size="10" maxlength="10" styleClass="date" onkeypress="return false;"
								onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/>
		</div>
		<div style="clear:both"></div>
	</div>	

	<div class="row formlabel_sf" >
		<div class="leftTabButton label" style="width: 10%;" title="">
			<input type="submit" name="search" title="<fmt:message key='ipdms.forms.pesquisar' />" value="<fmt:message key='ipdms.forms.pesquisar' />" class="btForm"/>
		</div>
		<div style="clear:both"></div>
	</div>
	<br />
</html:form>
