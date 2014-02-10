<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.obrigatorio" var="obrigatorio" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.condicao.campo" var="campoDes" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.condicao.campo.seleccione" var="seleccione" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.condicao.operadorComparacao" var="operadorComparacaoDes" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.condicao.valor" var="valorDes" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.condicao.operadorLogico" var="operadorLogicoDes" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.gravar" var="gravar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" bundle="${ecmBundle}" />

<fieldset style="margin-left:10px; margin-top:10px; width:92%;">
	<div id="errorDivCondicao">
		<html:errors />
	</div>
	
	<input type="hidden" id="condicao_index" name="condicao_index" value="${condicao_index}" />

	<div class="row" style="padding-bottom: 5%;">
		<div class="leftTab label" style="width: 90%; " title="${obrigatorio}">
	  		<span class="formlabel_obrigatorio">${obrigatorio}</span>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >	
		<div class="leftTab label" style="width: 35%; " title="${campoDes}">
			<label for="campo">
				${campoDes} *
			</label>
		</div>
		<div class="label" style="width: 55%;" title="${campoDes}">
			<select name="campo" id="campo" style="width: 100%">
				<option value="">${seleccione} ${campoDes}</option>
			</select>			
		</div>
	</div>
	
	<div class="row formlabel_sf" >	
		<div class="leftTab label" style="width: 35%; " title="${operadorComparacaoDes}">
			<label for="operadorComparacao">
				${operadorComparacaoDes} *
			</label>
		</div>
		<div class="label" style="width: 55%;" title="${operadorComparacaoDes}">
			<select name="operadorComparacao" id="operadorComparacao" style="width: 100%">
				<option value="="> = </option>
				<option value="!="> != </option>
				<option value="<"> < </option>
				<option value=">"> > </option>
				<option value="<="> <= </option>
				<option value=">="> >= </option>
				<option value="IS"> IS </option>
				<option value="IS NOT"> IS NOT </option>
				<option value="IN"> IN </option>
				<option value="NOT IN"> NOT IN </option>
			</select>			
		</div>
	</div>
	
	<div class="row formlabel_sf" >	
		<div class="leftTab label" style="width: 35%; " title="${valorDes}">
			<label for="valor">
				${valorDes} *
			</label>
		</div>
		<div class="label" style="width: 55%;" title="${valorDes}">
			<input type="text" id="valor" name="valor" value="${valor}" style="width: 100%;" />
		</div>
	</div>
	
	<div class="row formlabel_sf" >	
		<div class="leftTab label" style="width: 35%; " title="${operadorLogicoDes}">
			<label for="operadorLogico">
				${operadorLogicoDes}
			</label>
		</div>
		<div class="label" style="width: 55%;" title="${operadorLogicoDes}">
			<select name="operadorLogico" id="operadorLogico" style="width: 100%">
				<option value="">${seleccione} ${operadorLogicoDes}</option>
				<option value="AND">AND</option>
				<option value="OR">OR</option>
			</select>			
		</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="buttonRow">
		<input type="button" class="btForm" title="${gravar}" value="${gravar}" onclick="saveCondicao();" />
		<input type="button" class="btFormEscuro" title="${cancelar}" value="${cancelar}" onclick="cancelCondicao();" />
	</div>
  </fieldset>
  
  <script type="text/javascript">
  	var conteudoSelect = document.getElementById("conteudo");
	
  	if(conteudoSelect.selectedIndex != -1){
		var conteudoValue = conteudoSelect.options[conteudoSelect.selectedIndex].value;		
		var conteudo = conteudosArray[conteudoValue];		
		var colNames = getGridModel(conteudo).colNames;
	  
	  	var campoSelect = document.getElementById("campo");
	  	campoSelect.length = 0;
	  	
	  	for (var i=0;i<colNames.length;i++){
	  		var option = document.createElement("option");
	  		option.text = colNames[i];
	  		campoSelect.add(option,null);
	  	};
  	}
  </script>