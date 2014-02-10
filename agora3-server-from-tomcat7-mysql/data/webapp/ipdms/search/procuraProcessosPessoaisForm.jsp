<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/ipdms/js/processoutil.js"></script>

<script type="text/javascript">
Ext.onReady(function(){
	//cololcar formato de data caso nao haja datas reais
	dateFormatCheckonLoad();
});

//load colaboradores
loadColaboradoresDependentes = function (selected) {
	var show_div = $('show_users_div');
	var cols_div = $('users_div');
	
	if(show_div.checked && cols_div.innerHTML == ''){
		var url = "${pageContext.request.contextPath}/loadColaboradoresDependentes.do2?selected=" + selected;
		new Ajax.Updater( 
				{success: cols_div}, 
				url,
				{method: 'get', parameters: '', evalScripts: true});	
	}
			
};

</script>

<html:form method="post" action="/procuraprocessospessoais" onsubmit="dateFormatCheckonSubmit();">
	<html:hidden property="page" value="1" />
	<html:hidden property="hist"/>
	<input type="hidden" name="selected" value="${selected}"/>
	
	
	<div class="row formlabel_sf" >
	 	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.pesquisa.pessoal.tipoProcesso' />">
	  		<fmt:message key='ipdms.pesquisa.pessoal.tipoProcesso' />
	  	</div>
	  	<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.pesquisa.pessoal.tipoProcesso' />">
			<div id="listaprocessos">
		  		<html:select  property="params(tipoProcesso)" style="width: 94%;">
					<option value="" />
					<html:options collection="listTiposProcesso" property="numeroConteudo" labelProperty="titulo" />
				</html:select>
			</div>	
	  	</div> 	
		<div style="clear:both"></div>
	</div>	
	
	<div class="row formlabel_sf" >	
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.pesquisa.pessoal.entradaPedido' />">
	  		<fmt:message key='ipdms.pesquisa.pessoal.entradaPedido' />
	  	</div>
	 	<div class="label" style="width: 10%;" title="<fmt:message key='ipdms.pesquisa.pessoal.entradaPedido' />">
	  		<html:text styleId="dataInicio" property="params(dataInicio)" size="10" maxlength="10" styleClass="date" onkeypress="return false;"
								onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/>	
	  	</div>
	  	<div class="leftTab label" style="width: 4%;" title="<fmt:message key='ipdms.pesquisa.pessoal.ate' />"><fmt:message key='ipdms.pesquisa.pessoal.ate' /></div>
		<div class="label" style="width: 10%;" title="<fmt:message key='ipdms.pesquisa.pessoal.ate' />">
			<html:text styleId="dataFim" property="params(dataFim)" size="10" maxlength="10" styleClass="date" onkeypress="return false;"
								onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/>
		</div>
		<div style="clear:both"></div>
	</div>	

	<div class="row formlabel_sf" >	
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.pesquisa.pessoal.interacaoPedido' />">
	  		<fmt:message key='ipdms.pesquisa.pessoal.interacaoPedido' />
	  	</div>
	 	<div class="label" style="width: 10%;" title="<fmt:message key='ipdms.pesquisa.pessoal.interacaoPedido' />">
	  		<html:text styleId="dataInicioAccao" property="params(dataInicioAccao)" size="10" maxlength="10" styleClass="date" onkeypress="return false;"
								onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/>	
	  	</div>
	  	<div class="leftTab label" style="width: 4%;" title="<fmt:message key='ipdms.pesquisa.pessoal.ate' />"><fmt:message key='ipdms.pesquisa.pessoal.ate' /></div>
		<div class="label" style="width: 10%;" title="<fmt:message key='ipdms.pesquisa.pessoal.ate' />">
			<html:text styleId="dataFimAccao" property="params(dataFimAccao)" size="10" maxlength="10" styleClass="date" onkeypress="return false;"
								onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/>
		</div>
		<div style="clear:both"></div>
	</div>	

	<div class="row formlabel_sf" >
	 	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.pesquisa.pessoal.incluirColaboradoresDependentes' />">
	  		<fmt:message key='ipdms.pesquisa.pessoal.incluirColaboradoresDependentes' />
	  		<html:checkbox styleId="show_users_div" styleClass="checkinput" property="params(porOrganica)" style="border:0;" onclick="loadColaboradoresDependentes(${selected}); $('users_div').toggle();"/>
	  	</div>
	  	<div class="label" id="users_div" style="width: 40%; display: none;"></div>
	</div>
	<br/><br/>

	<script>
		if($('show_users_div').checked) {
			$('users_div').show();
			loadColaboradoresDependentes(${selected});
		}
	</script>
	
	
	<div class="row formlabel_sf" >
		<div class="leftTabButton label" style="width: 10%;" title="">
			<input type="submit" name="search" title="<fmt:message key='ipdms.forms.pesquisar' />" value="<fmt:message key='ipdms.forms.pesquisar' />" class="btForm"/>
		</div>
		<div style="clear:both"></div>
	</div>
	<br />
</html:form>
