<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ecm.estrutura.designacaosingular" var="estruturaDes" bundle="${ecmBundle}" />
<fmt:message key="ipdms.obrigatorio" var="obrigatorio" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.descricao" var="descricao" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.proprietario" var="proprietario" bundle="${ecmBundle}" />
<fmt:message key="ipdms.listing" var="listing" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.designacaoplural" var="conteudosDesPlural" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.criar" var="criar" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.designacaosingular" var="conteudosDesSingular" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.submit" var="submit" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" bundle="${ecmBundle}" />

<html:form styleId="estruturaForm" action="/saveEstrutura">
<fieldset>
	<legend>${criar} ${estruturaDes}</legend>

	<html:errors/>

	<div class="row" style="padding-bottom:2%;">
		<div class="leftTab label" style="width: 90%; " title="${obrigatorio}">
	  		<span class="formlabel_obrigatorio">${obrigatorio}</span>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="${descricao}">
			<label for="descricaoEstrutura">${descricao} *</label>
		</div>
		<div class="label" style="width: 80%;" title="${descricao}">
			<html:text property="descricaoEstrutura" />
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="${proprietario}">
			<label for="proprietario">${proprietario} *</label>
		</div>
		<div class="label" style="width: 80%;" title="${proprietario}">
			<html:text property="proprietario" />
		</div>
	</div>
	
	<div class="row" style="padding-top:5%; text-align:left; ">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2">${listing} ${conteudosDesPlural}</td>
			  </tr>
			</tbody>
		</table>					
	</div>
	
	<div class="alignLeft" style="margin-top:1%;">
		<div class="left">
			<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="createConteudo();" class="cursorMao" alt="${criar} ${conteudosDesSingular}" title="${criar} ${conteudosDesSingular}" />
		</div>
		<div class="right">
			<div class="texto" title="${criar} ${conteudosDesSingular}">&nbsp;<a href="#" onclick="createConteudo();">${criar} ${conteudosDesSingular}</a></div>
		</div>
	</div>
	
	<div id="divCreateConteudo"></div>
	<div id="divListConteudos" style="width:97%; margin-left:1%;"></div>
	
	<div class="buttonRow">
		<input type="button" class="btForm" value='${submit}' onclick="save('estruturaForm');" title='${submitTitle}' />
		<input type="button" class="btFormEscuro" value='${cancelar}' onclick="cancelEdit();" title='${cancelarTitle}' />
	</div>
	
</fieldset>
</html:form>

<script>
	updateDivListConteudos();
</script>