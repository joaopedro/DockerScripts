<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<nested:root name="entidadeFormBean">
<nested:nest property="singular">

<%-- IDENTIFICACAO DO INDIVIDUO --%>
	<div class="row" style="padding-top:0%; text-align:left; ">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.singular.identificao" /></td>
			  </tr>
			</tbody>
		</table>					
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key="ipdms.modules.entidade.titulo" />">
	  		<label for="tituloLabel"><fmt:message key="ipdms.modules.entidade.titulo" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 25%;" title="<fmt:message key="ipdms.modules.entidade.titulo" />">
	  		<nested:select property="siglaTitulo" styleId="tituloLabel">
				<html:option value=""><fmt:message key="ipdms.forms.select.default" /></html:option>
				<html:optionsCollection name="tituloOptions" label="title" value="value"/>
			</nested:select>
	  	</div>
	  	
	  	<div class="leftTab label" style="width:10%; " title="<fmt:message key='ipdms.modules.entidade.bi' />">
	  		<label for="biLabel"><fmt:message key="ipdms.modules.entidade.bi" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 50%;" title="<fmt:message key='ipdms.modules.entidade.bi' />">
	  		<nested:text property="bi" maxlength="20" size="20" styleId="biLabel"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.emitidoEm' />">
	  		<label for="emitidoEm"><fmt:message key="ipdms.modules.entidade.emitidoEm" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 12%;" title="<fmt:message key='ipdms.modules.entidade.emitidoEm' />">
	  		<nested:text styleId="emitidoEm" property="emitidoEm" size="10" maxlength="10"  styleClass="date" onkeypress="return false;" errorStyleClass="webflow_erro" />
		</div>

		<div class="label" style="width: 14%;" title="<fmt:message key='ipdms.modules.entidade.emitidoEm' />">
			<img id="buttondateEmitido" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="editMorada('${entidade_locale}');" class="cursorMao" alt="<fmt:message key='ipdms.modules.entidade.emitidoEm' />" title="<fmt:message key='ipdms.modules.entidade.emitidoEm' />"/>
		</div>
	  	
	  	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.arquivo' />">
	  		<label for="arquivoLabel"><fmt:message key="ipdms.modules.entidade.arquivo" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 25%;" title="<fmt:message key='ipdms.modules.entidade.arquivo' />">
	  		<nested:text property="arquivo" maxlength="20" size="20" styleId="arquivoLabel" />
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.validoAte' />">
	  		<label for="validoAte"><fmt:message key="ipdms.modules.entidade.validoAte" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 12%;" title="<fmt:message key='ipdms.modules.entidade.validoAte' />">
	  		<nested:text styleId="validoAte" property="validoAte" size="10" maxlength="10"  styleClass="date" onkeypress="return false;" errorStyleClass="webflow_erro" />	  		
		</div>
		<div class="label" style="width: 60%;" title="<fmt:message key='ipdms.modules.entidade.validoAte' />">
			<img id="buttondateValidade" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="editMorada('${entidade_locale}');" class="cursorMao" alt="<fmt:message key='ipdms.modules.entidade.validoAte' />" title="<fmt:message key='ipdms.modules.entidade.validoAte' />"/>
		</div>
	</div>

	<div style="clear:both"><br /></div>
<%-- FILIACAO--%>
	<div class="row" style=" text-align:left;">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.filiacao"/></td>
			  </tr>
			</tbody>
		</table>					
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.pai' />">
	  		<label for="paiLabel"><fmt:message key="ipdms.modules.entidade.pai" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.pai' />">
	  		<nested:text property="pai" maxlength="100" size="100" styleId="paiLabel" />
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.mae' />">
	  		<label for="maeLabel"><fmt:message key="ipdms.modules.entidade.mae" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.mae' />">
	  		<nested:text property="mae" maxlength="100" size="100" styleId="maeLabel" />
	  	</div>
	</div>

	<div style="clear:both"><br /></div>
<%-- INFORMACAO NASCIMENTO --%>
	<div class="row" style=" text-align:left;">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.nascimento" /></td>
			  </tr>
			</tbody>
		</table>					
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.datanascimento' />" >
	  		<label for="dataNascimento"><fmt:message key="ipdms.modules.entidade.datanascimento" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 12%;" title="<fmt:message key='ipdms.modules.entidade.datanascimento' />">
	  		<nested:text styleId="dataNascimento" property="dataNascimento" size="10" maxlength="10"  styleClass="date" onkeypress="return false;" errorStyleClass="webflow_erro" />
	  	</div>
	  	
	  	<div class="label" style="width: 76%;" title="<fmt:message key='ipdms.modules.entidade.datanascimento' />">
	  		<img id="buttondate" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="editMorada('${entidade_locale}');" class="cursorMao" alt="<fmt:message key='ipdms.modules.entidade.datanascimento' />" title="<fmt:message key='ipdms.modules.entidade.datanascimento' />"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.sexo' />">
	  		<label for="sexoLabel1"><fmt:message key="ipdms.modules.entidade.sexo" /> *</label>
	  	</div>

	  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.sexo' />">
	  		<c:forEach items="${sexoOptions}" var="sexo" >
				<nested:radio styleId="sexoLabel" property="sexo" value="${sexo.value}" styleClass="radion" style="border:none"></nested:radio> ${sexo.title}
			</c:forEach>
	  	</div>
	</div>
	
	<div style="clear:both"><br /></div>
	
<%-- NATURALIDADE --%>	
	<div class="row" style=" text-align:left;">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.naturalidade" /></td>
			  </tr>
			</tbody>
		</table>					
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.naturalidade' />">
	  		<label for="naturalidadeLabel"><fmt:message key="ipdms.modules.entidade.naturalidade" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.naturalidade' />">
	  		<nested:text property="naturalidade1" maxlength="50" size="30" styleId="naturalidadeLabel"/>&nbsp;-&nbsp;
			<label for="naturalidade2Label"><nested:text property="naturalidade2" maxlength="50" size="30" styleId="naturalidade2Label"/></label>
	  	</div>
	</div>
	<div style="clear:both"><br /></div>
	
<%-- ESTADO CIVIL --%>	
	<div class="row" style=" text-align:left;">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.estadocivil"/></td>
			  </tr>
			</tbody>
		</table>					
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.estadocivil' />">
	  		<label for="estadoCivilLabel"><fmt:message key="ipdms.modules.entidade.estadocivil" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.estadocivil' />">
	  		<nested:select property="siglaEstadoCivil" styleId="estadoCivilLabel">
				<html:option value=""><fmt:message key="ipdms.forms.select.default" /></html:option>
				<html:optionsCollection name="estadoCivilOptions" label="title" value="value"/>
			</nested:select>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.datacasamento' />">
	  		<label for="dataCasamento"><fmt:message key="ipdms.modules.entidade.datacasamento" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 12%;" title="<fmt:message key='ipdms.modules.entidade.datacasamento' />">
	  		<nested:text styleId="dataCasamento" property="dataCasamento" size="10" maxlength="10" styleClass="date" onkeypress="return false;" errorStyleClass="webflow_erro" />
		</div>

		<div class="label" style="width: 60%;" title="<fmt:message key='ipdms.modules.entidade.datacasamento' />">
		<img id="buttondateCasamento" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="editMorada('${entidade_locale}');" class="cursorMao" alt="<fmt:message key='ipdms.modules.entidade.datacasamento' />" title="<fmt:message key='ipdms.modules.entidade.datacasamento' />"/>
		</div>

	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.nomeconjuge'/>">
	  		<label for="nomeConjugeLabel"><fmt:message key="ipdms.modules.entidade.nomeconjuge"/></label>
	  	</div>
	  	
	  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.nomeconjuge'/>">
	  		<nested:text property="nomeConjuge" maxlength="80" size="80" styleId="nomeConjugeLabel"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.regimeconjugal' />">
	  		<label for="regimeConjugalLabel"><fmt:message key="ipdms.modules.entidade.regimeconjugal" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.regimeconjugal' />">
	  		<nested:select property="siglaRegimeConjugal" styleId="regimeConjugalLabel">
				<html:option value=""><fmt:message key="ipdms.forms.select.default" /></html:option>
				<html:optionsCollection name="regimeCasamentoOptions" label="title" value="value"/> 
			</nested:select>
	  	</div>
	</div>	
	<div style="clear:both"><br /></div>
	
	
<%-- CONTACTOS --%>
	<div class="row" style=" text-align:left;">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.telefonesfax" /></td>
			  </tr>
			</tbody>
		</table>					
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.telefone1' />">
	  		<label for="telefone1Label"><fmt:message key="ipdms.modules.entidade.telefone1" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 25%;" title="<fmt:message key='ipdms.modules.entidade.telefone1' />">
	  		<nested:text property="telefone1" maxlength="20" size="20" onkeypress="return IsNumericKey(event);" styleId="telefone1Label"/>
	  	</div>
	  	
	  	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.telefone2' />">
	  		<label for="telefone2Label"><fmt:message key="ipdms.modules.entidade.telefone2" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 50%;" title="<fmt:message key='ipdms.modules.entidade.telefone2' />">
	  		<nested:text property="telefone2" maxlength="20" size="20" onkeypress="return IsNumericKey(event);" styleId="telefone2Label"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.telemovel' />">
	  		<label for="telemovelLabel"><fmt:message key="ipdms.modules.entidade.telemovel" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 25%;" title="<fmt:message key='ipdms.modules.entidade.telemovel' />">
	  		<nested:text property="telemovel" maxlength="20" size="20" onkeypress="return IsNumericKey(event);" styleId="telemovelLabel"/>
	  	</div>
	  	
	  	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.fax' />">
	  		<label for="faxLabel"><fmt:message key="ipdms.modules.entidade.fax" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 50%;" title="<fmt:message key='ipdms.modules.entidade.fax' />">
	  		<nested:text property="fax" maxlength="20" size="20" onkeypress="return IsNumericKey(event);" styleId="faxLabel"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.email' />">
	  		<label for="emailLabel"><fmt:message key="ipdms.modules.entidade.email" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.email' />">
	  		<nested:text property="email" maxlength="80" size="80" styleId="emailLabel" />
	  	</div>
	</div>
	
	<div style="clear:both"><br /></div>	
</nested:nest>
</nested:root>

<script>
dateFormatCheckonLoad();//colocar o date format dd-mm-aaaa dentro do campo caso este esteja vazio
Calendar.setup({ inputField : 'emitidoEm', ifFormat : '%d-%m-%Y', showsTime : false });
Calendar.setup({ inputField : 'emitidoEm', ifFormat : '%d-%m-%Y', button : "buttondateEmitido" });
Calendar.setup({ inputField : 'validoAte', ifFormat : '%d-%m-%Y', showsTime : false });
Calendar.setup({ inputField : 'validoAte', ifFormat : '%d-%m-%Y', button : "buttondateValidade" });
Calendar.setup({ inputField : 'dataNascimento', ifFormat : '%d-%m-%Y', showsTime : false });
Calendar.setup({ inputField : 'dataNascimento', ifFormat : '%d-%m-%Y', button : "buttondate" });
Calendar.setup({ inputField : 'dataCasamento', ifFormat : '%d-%m-%Y', showsTime : false });
Calendar.setup({ inputField : 'dataCasamento', ifFormat : '%d-%m-%Y', button : "buttondateCasamento" });

if('${param.createNewEntidade}' == 'true'){
	if('${param.newSexo}'=='M'){
		if(document.getElementsByName('singular.sexo')[0].value=='1'){
			document.getElementsByName('singular.sexo')[0].checked=true;
		}
		if(document.getElementsByName('singular.sexo')[1].value=='1'){
			document.getElementsByName('singular.sexo')[1].checked=true;
		}
	}
	if('${param.newSexo}'=='F'){
		if(document.getElementsByName('singular.sexo')[0].value=='2'){
			document.getElementsByName('singular.sexo')[0].checked=true;
		}
		if(document.getElementsByName('singular.sexo')[1].value=='2'){
			document.getElementsByName('singular.sexo')[1].checked=true;
		}
	}
	$('dataNascimento').value='${param.newDataNascimento}';
	$('biLabel').value='${param.newBi}';
}

</script>