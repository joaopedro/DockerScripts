<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:message key="ipdms.obrigatorio" var="obrigatorio" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.designacaoplural" var="dadosDesPlural" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.designacaosingular" var="estruturaDesSingular" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.estrutura.seleccione" var="seleccione" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.designacaosingular" var="conteudoDesSingular" bundle="${ecmBundle}" />
<fmt:message key="ipdms.listing" var="listing" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.condicao.designacaoplural" var="condicaoDesPlural" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.criar" var="criar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.submit" var="submit" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" bundle="${ecmBundle}" />

<html:form styleId="ecmSearchForm" action="/listDados">
<fieldset>
	<legend>${pesquisar} ${dadosDesPlural}</legend>
	
	<div id="errorDivDados"></div>
	
	<input type="hidden" id="completeGeometry" name="completeGeometry" value="false" />
	
	<div class="row" style="padding-bottom:2%;">
		<div class="leftTab label" style="width: 90%; " title="${obrigatorio}">
	  		<span class="formlabel_obrigatorio">${obrigatorio}</span>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >	
		<div class="leftTab label" style="width: 17%; " title="${estruturaDesSingular}">
			<label for="estrutura">
				${estruturaDesSingular} *
			</label>
		</div>
		<div class="label" style="width: 80%;" title="${estruturaDesSingular}">
			<select name="estrutura" id="estrutura" onchange="updateConteudos(this.value)" style="width: 200px">
				<option value="">${seleccione} ${estruturaDesSingular}</option>			
				<c:forEach items="${estuturasList}" var="estutura">
					<option value="${estutura.descricaoEstrutura}">${estutura.descricaoEstrutura}</option>					
					<c:set var="descricaoEstrutura" value="${estutura.descricaoEstrutura}"/>
					<c:set var="codigoEstrutura" value="${estutura.codigoEstrutura}"/>					
					<script>
						estruturasArray["${descricaoEstrutura}"] = "${codigoEstrutura}";
					</script>					
				</c:forEach>
			</select>			
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="${conteudoDesSingular}">
			<label for="conteudo">
				${conteudoDesSingular} *
			</label>
		</div>
		<div class="label" style="width: 80%;" title="${conteudoDesSingular}" id="conteudosSelectDiv">
			<select name="conteudo" id="conteudo" style="width: 200px">
				<c:forEach items="${conteudosList}" var="conteudo">
					<option value="${conteudo.descricaoConteudo}">${conteudo.descricaoConteudo}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
	<div class="row" style="padding-top:5%; text-align:left; ">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2">${listing} ${condicaoDesPlural}</td>
			  </tr>
			</tbody>
		</table>					
	</div>
	
	<div class="alignLeft" style="margin-top:1%;">
		<div class="left">
			<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="createCondicao();" class="cursorMao" alt="${criar}" title="${criar}" />
		</div>
		<div class="right">
			<div class="texto" title="${criar}">&nbsp;<a href="#" onclick="createCondicao();">${criar}</a></div>
		</div>
	</div>
	
	<div id="divCreateCondicao"></div>
	<div id="divListCondicao" style="width:97%; margin-left:1%;"></div>
	
	<div class="buttonRow">
		<input type="button" class="btForm" value='${submit}' onclick="listDados();" title='${submitTitle}' />
		<input type="button" class="btFormEscuro" value='${cancelar}' onclick="cancelSearch();" title='${cancelarTitle}' />
	</div>
</fieldset>
</html:form>

<script>
	updateDivListCondicao();
</script>