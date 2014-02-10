<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.obrigatorio" var="obrigatorio" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.descricao" var="descricao" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.campos.textoCurto" var="textoCurto" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.campos.textoLongo" var="textoLongo" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.campos.numerico" var="numerico" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.campos.data" var="data" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.campos.geometria" var="geometria" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.campos.geometria.ponto" var="ponto" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.campos.geometria.linha" var="linha" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.campos.geometria.poligono" var="poligono" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.gravar" var="gravar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" bundle="${ecmBundle}" />

<fieldset style="margin-left:10px; margin-top:10px; width:95%;">	
	<div id="errorDivTemplateConteudo">
		<html:errors />
	</div>
	
	<input type="hidden" id="conteudo_index" name="conteudo_index" value="${conteudo_index}" />
	
	<div class="row" style="margin-bottom:20px; margin-left:-10px;">
		<div class="leftTab label" style="width: 90%; " title="${obrigatorio}">
			<span class="formlabel_obrigatorio">${obrigatorio}</span>
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${descricao}">
	  		${descricao} *
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${descricao}">
			<input type="text" id="descricaoTemplateConteudo" name="descricaoTemplateConteudo" value="${descricaoTemplateConteudo}" size="25" maxlength="150"/>
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${textoCurto} 1">
	  		${textoCurto} 1
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${textoCurto} 1">
	  		<c:set var="checked" value="" />
	  		<c:if test="${texto_curto_1.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="texto_curto_1" name="texto_curto_1" value="${texto_curto_1.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="texto_curto_1_pk" name="texto_curto_1_pk" value="true" ${checked} />
	  	</div>
	  	

		<div class="leftTab label" style="width: 12%; " title="${textoCurto} 2">
	  		${textoCurto} 2
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${textoCurto} 2">
	  		<c:set var="checked" value="" />
	  		<c:if test="${texto_curto_2.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="texto_curto_2" name="texto_curto_2" value="${texto_curto_2.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="texto_curto_2_pk" name="texto_curto_2_pk" value="true" ${checked}>
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${textoCurto} 3">
	  		${textoCurto} 3
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${textoCurto} 3">
	  		<c:set var="checked" value="" />
	  		<c:if test="${texto_curto_3.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="texto_curto_3" name="texto_curto_3" value="${texto_curto_3.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="texto_curto_3_pk" name="texto_curto_3_pk" value="true" ${checked}>
	  	</div>
	  	

		<div class="leftTab label" style="width: 12%; " title="${textoCurto} 4">
	  		${textoCurto} 4
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${textoCurto} 4">
			<c:set var="checked" value="" />
	  		<c:if test="${texto_curto_4.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="texto_curto_4" name="texto_curto_4" value="${texto_curto_4.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="texto_curto_4_pk" name="texto_curto_4_pk" value="true" ${checked}>
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${textoLongo} 1">
	  		${textoLongo} 1
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${textoLongo} 1">
	  		<c:set var="checked" value="" />
	  		<c:if test="${texto_longo_1.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="texto_longo_1" name="texto_longo_1" value="${texto_longo_1.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="texto_longo_1_pk" name="texto_longo_1_pk" value="true" ${checked}>
	  	</div>
	  	

		<div class="leftTab label" style="width: 12%; " title="${textoLongo} 2">
	  		${textoLongo} 2
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${textoLongo} 2">
	  		<c:set var="checked" value="" />
	  		<c:if test="${texto_longo_2.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>	  	
			<input type="text" id="texto_longo_2" name="texto_longo_2" value="${texto_longo_2.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="texto_longo_2_pk" name="texto_longo_2_pk" value="true" ${checked}>
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${textoLongo} 3">
	  		${textoLongo} 3
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${textoLongo} 3">
	  		<c:set var="checked" value="" />
	  		<c:if test="${texto_longo_3.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="texto_longo_3" name="texto_longo_3" value="${texto_longo_3.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="texto_longo_3_pk" name="texto_longo_3_pk" value="true" ${checked}>
	  	</div>
	  	

		<div class="leftTab label" style="width: 12%; " title="${textoLongo} 4">
	  		${textoLongo} 4
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${textoLongo} 4">
	  		<c:set var="checked" value="" />
	  		<c:if test="${texto_longo_4.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="texto_longo_4" name="texto_longo_4" value="${texto_longo_4.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="texto_longo_4_pk" name="texto_longo_4_pk" value="true" ${checked}>
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${numerico} 1">
	  		${numerico} 1
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${numerico} 1">
	  		<c:set var="checked" value="" />
	  		<c:if test="${inteiro_1.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="inteiro_1" name="inteiro_1" value="${inteiro_1.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="inteiro_1_pk" name="inteiro_1_pk" value="true" ${checked}>
	  	</div>
	  	

		<div class="leftTab label" style="width: 12%; " title="${numerico} 2">
	  		${numerico} 2
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${numerico} 2">
	  		<c:set var="checked" value="" />
	  		<c:if test="${inteiro_2.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="inteiro_2" name="inteiro_2" value="${inteiro_2.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="inteiro_2_pk" name="inteiro_2_pk" value="true" ${checked}>
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${numerico} 3">
	  		${numerico} 3
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${numerico} 3">
	  		<c:set var="checked" value="" />
	  		<c:if test="${inteiro_3.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="inteiro_3" name="inteiro_3" value="${inteiro_3.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="inteiro_3_pk" name="inteiro_3_pk" value="true" ${checked}>
	  	</div>
	  	

		<div class="leftTab label" style="width: 12%; " title="${numerico} 4">
	  		${numerico} 4
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${numerico} 4">
	  		<c:set var="checked" value="" />
	  		<c:if test="${inteiro_4.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="inteiro_4" name="inteiro_4" value="${inteiro_4.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="inteiro_4_pk" name="inteiro_4_pk" value="true" ${checked}>
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${numerico} 5">
	  		${numerico} 5
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${numerico} 5">
	  		<c:set var="checked" value="" />
	  		<c:if test="${inteiro_5.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="inteiro_5" name="inteiro_5" value="${inteiro_5.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="inteiro_5_pk" name="inteiro_5_pk" value="true" ${checked}>
	  	</div>
	  	

		<div class="leftTab label" style="width: 12%; " title="${numerico} 6">
	  		${numerico} 6
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${numerico} 6">
	  		<c:set var="checked" value="" />
	  		<c:if test="${inteiro_6.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="inteiro_6" name="inteiro_6" value="${inteiro_6.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="inteiro_6_pk" name="inteiro_6_pk" value="true" ${checked}>
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${numerico} 7">
	  		${numerico} 7
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${numerico} 7">
	  		<c:set var="checked" value="" />
	  		<c:if test="${inteiro_7.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="inteiro_7" name="inteiro_7" value="${inteiro_7.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="inteiro_7_pk" name="inteiro_7_pk" value="true" ${checked}>
	  	</div>
	  	

		<div class="leftTab label" style="width: 12%; " title="${numerico} 8">
	  		${numerico} 8
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${numerico} 8">
	  		<c:set var="checked" value="" />
	  		<c:if test="${inteiro_8.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="inteiro_8" name="inteiro_8" value="${inteiro_8.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="inteiro_8_pk" name="inteiro_8_pk" value="true" ${checked}>
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${data} 1">
	  		${data} 1
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${data} 1">
	  		<c:set var="checked" value="" />
	  		<c:if test="${data_1.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="data_1" name="data_1" value="${data_1.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="data_1_pk" name="data_1_pk" value="true" ${checked}>
	  	</div>
	  	

		<div class="leftTab label" style="width: 12%; " title="${data} 2">
	  		${data} 2
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${data} 2">
	  		<c:set var="checked" value="" />
	  		<c:if test="${data_2.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="data_2" name="data_2" value="${data_2.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="data_2_pk" name="data_2_pk" value="true" ${checked}>
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${data} 3">
	  		${data} 3
	  	</div>
	  	
	  	<div class="label" style="width: 33%;" title="${data} 3">
	  		<c:set var="checked" value="" />
	  		<c:if test="${data_3.chave}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
			<input type="text" id="data_3" name="data_3" value="${data_3.descricao}" size="25" maxlength="150"/>
			pk: <input type="checkbox" class="radion" id="data_3_pk" name="data_3_pk" value="true" ${checked}>
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 12%; " title="${geometria}">
	  		${geometria}
	  	</div>
	  	
	  	<div class="label" style="width: 30%;" title="${geometria}">
	  		<c:if test="${point_geom eq true}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
	  		<input type="radio" id="geometry" name="geometry" value="point_geom" class="radion" ${checked} />${ponto}
	  		
	  		<c:set var="checked" value="" />
	  		<c:if test="${line_geom eq true}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
	  		<input type="radio" id="geometry" name="geometry" value="line_geom" class="radion" ${checked} />${linha}
	  		
	  		<c:set var="checked" value="" />
	  		<c:if test="${polygon_geom eq true}">
	  		<c:set var="checked" value="checked=checked" /></c:if>
	  		<input type="radio" id="geometry" name="geometry" value="polygon_geom" class="radion" ${checked} />${poligono}
	  	</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="buttonRow">
		<input type="button" class="btForm" title="${gravar}" value="${gravar}" onclick="saveTemplateConteudo();" />
		<input type="button" class="btFormEscuro" title="${cancelar}" value="${cancelar}" onclick="cancelTemplateConteudo();" />
	</div>	
</fieldset>