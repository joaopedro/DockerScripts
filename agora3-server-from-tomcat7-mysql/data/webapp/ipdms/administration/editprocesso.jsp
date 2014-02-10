<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.processo.imagemWorkflow" var="imagemWorkflow"/>
<fmt:message key="ipdms.loading" var="loading"/>
<fmt:message key="ipdms.processo.listaopcoesassociadas" var="listaopcoesassociadas" />
<fmt:message key="ipdms.processo.listaopcoesassociadas.empty" var="emptyListaopcoesassociadas"/>
<fmt:message key="ipdms.processo.etapasassociadas" var="etapasassociadas"/>
<fmt:message key="ipdms.processo.etapasassociadas.empty" var="emptyEtapasassociadas"/>

<script>
function Checkboxes(state) {	
    $$('input[type="checkbox"][name^="cut#"]').each(function filter(item) {
                item.checked=state;
    });
}

//loads an image, showing it in a window Ext
function carregaImagem(title, action){
    var titulo = '${imagemWorkflow} ' + title;
    ExtWindowSizeParam(titulo,action,'','html',700,600);    
}

//Execute an Ajax call to verify if the workflow code inserted,
//allready exists in the workflow db
function checkProcess(action, div){

	var codigo = document.getElementById('codworkflow').value;	    
	var titulo = document.getElementById('titulo').value;
	var url = '${pageContext.request.contextPath}/' + action + '?workflowcode='+codigo + '&titulo='+titulo;
    $(div).innerHTML="<br><span class='formfield'><img src='${JS_DIR}/ext/resources/images/default/grid/loading.gif' style='width:16px; height:16px; vertical-align:top;' alt='${loading}' title='${loading}' />${loading}</span> </div>";     

   //chamada Ajax que verifica se já existe algum processo com o código inserido
	Ext.Ajax.timeout=0;	
	Ext.Ajax.request({
		url: url,		
		success: function(response, opts) {
	      $(div).innerHTML=response.responseText;
	      //alert(response.responseText);	      
	    },
	    failure: function(response, opts) {
	       console.log('Server side Error : ' + response.status);
	    }
	    }); 
   
}


//check workflow process on page load 
Ext.onReady(function(){
	checkProcess('checkprocess.do2','consulta-imagem-processo');
});

</script>

<fmt:setBundle var="ipdmsResources" basename="resources.IPDMSResources" />
<html:form action="/saveProcesso" method="post" styleClass="form" styleId="form">
	<html:hidden property="numero"/>

	<div class="row" style="padding-bottom:20px;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.obrigatorio" />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>
	
	<%-- Informação relativa ao processo --%>
	<nested:nest property="processo">
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.nome" />">
	  		<fmt:message key="ipdms.processo.nome" /> *
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.nome" />">
	  		<nested:text property="titulo" maxlength="80" style="width:40%" styleId="titulo"/>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.descricao" />">
	  		<fmt:message key="ipdms.processo.descricao" />
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.descricao" />">
	  		<nested:text property="descricao" maxlength="1000"  style="width:40%" />
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.sigla" />">
	  		<fmt:message key="ipdms.processo.sigla" /> *
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.sigla" />">
	  		<nested:text property="sigla" maxlength="40"  style="width:15%" />
	  	</div>  	
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.workflow" />">
	  		<fmt:message key="ipdms.processo.workflow" /> *
	  	</div>
	  	
	  	<div class="label" style="width: 15%;" title="<fmt:message key="ipdms.processo.workflow" />">
	  		<nested:text property="codWorkflow" maxlength="40" style="width:90%" styleId="codworkflow" onchange="checkProcess('checkprocess.do2','consulta-imagem-processo')" />
	  	</div>
	  	<!-- div link consulta imagem do workflow do processo -->
	  	<div class="label" style="width: 60%;" title="<fmt:message key="ipdms.processo.consultarimagemprocesso" />" id="consulta-imagem-processo">
	  	</div>
	  	
	  	
	</div>
	<div class="row formlabel_sf">
		<div class="leftTab label" style="height:30px; width: 18%;" title="<fmt:message key="ipdms.processo.departamento" />">
	  		<fmt:message key="ipdms.processo.departamento" /> *
	  	</div>
	  	
	  	<div class="label" style="height:30px;width: 79%;" title="<fmt:message key="ipdms.processo.departamento" />">
	  		<nested:select property="departamento" style="width: 40%;">
					<html:optionsCollection property="organicas" value="id" label="designacao" />				
	    		</nested:select>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.entidade" />">
	  		<fmt:message key="ipdms.processo.entidade" /> *
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.entidade" />">
	  		<nested:select property="entidaderole" style="width: 40%;">
					<html:optionsCollection property="entidadeRoles" value="id" label="descricao" />				
	    	</nested:select>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.servicoMapa" />">
			<fmt:message key="ipdms.processo.servicoMapa" />
	  	</div>
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.servicoMapa" />">
	  		<nested:select property="mapServiceId" style="width: 40%;">
	  				<html:option value=""></html:option>
					<html:optionsCollection property="wmsGeographicServices" value="id" label="description" />				
	    	</nested:select>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.servicoLeitura" />">
			<fmt:message key="ipdms.processo.servicoLeitura" />
	  	</div>
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.servicoLeitura" />">
	  		<nested:select property="srcServiceId" style="width: 40%;">
	  				<html:option value=""></html:option>
					<html:optionsCollection property="wfsGeographicServices" value="id" label="description" />				
	    	</nested:select>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.servicoEditavel" />">
			<fmt:message key="ipdms.processo.servicoEditavel" />
	  	</div>
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.servicoEditavel" />">
	  		<nested:select property="editableServiceId" style="width: 40%;">
	  				<html:option value=""></html:option>
					<html:optionsCollection property="wfsGeographicServices" value="id" label="description" />				
	    	</nested:select>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.maxFeatures" />">
			<fmt:message key="ipdms.processo.maxFeatures" />
	  	</div>
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.maxFeatures" />">
	  		<nested:text property="maxFeatures"  />
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.sistema" />">
	  		<fmt:message key="ipdms.processo.sistema" />
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.sistema" />">
	  		<html:checkbox property="processo.sistema" styleClass="radion" style="border:0;"/>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.suporte" />">
	  		<fmt:message key="ipdms.processo.suporte" />
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.suporte" />">
	  		<html:checkbox property="processo.suporte" styleClass="radion" style="border:0;"/>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.geral" />">
	  		<fmt:message key="ipdms.processo.geral" />
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.geral" />">
	  		<html:checkbox property="processo.geral" styleClass="radion" style="border:0;"/>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
	    <div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.permissao" />">
	        <fmt:message key="ipdms.processo.permissao" />
	    </div>
	    
	    <div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.permissao" />">	    
	    	<nested:select property="permissao" style="width: 40%;">
  				<logic:iterate id="p" property="permissoes" name="processoFormBean">
  					<html:option value="${p}"><fmt:message key="${p.resourceKey}" /></html:option>
  				</logic:iterate>
	    	</nested:select>	    
	    </div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key="ipdms.processo.numerounicoentrada" />">
	  		<fmt:message key="ipdms.processo.numerounicoentrada" />
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.numerounicoentrada" />">
	  		<html:checkbox property="processo.numeroUnicoEntrada" styleClass="radion" style="border:0;"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key="ipdms.processo.numerounicosaida" />">
	  		<fmt:message key="ipdms.processo.numerounicosaida" />
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.numerounicosaida" />">
	  		<html:checkbox property="processo.numeroUnicoSaida" styleClass="radion" style="border:0;"/>
	  	</div>
	</div>
	
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key="ipdms.processo.mailnotification" />">
	  		<fmt:message key="ipdms.processo.mailnotification" />
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.mailnotification" />">
	  		<html:checkbox property="processo.mailNotification" styleClass="radion" style="border:0;"/>
	  	</div>
	</div>
	
	
	
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key="ipdms.processo.informacaoprocesso" />">
	  		<fmt:message key="ipdms.processo.informacaoprocesso" />
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.processo.informacaoprocesso" />">
	  		<html:textarea property="processo.informacaoProcesso" rows="4"></html:textarea>
	  	</div>
	</div>
	
		<logic:greaterThan name="${formBeanName}" property="processo.numero" value="0">
	
			<%-- Associar Lista de Opções--%>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.listaopcoes" />">
			  		<fmt:message key="ipdms.processo.listaopcoes" />
			  	</div>
			  	
			  	<div class="label" style="width: 5%;" title="<fmt:message key="ipdms.processo.listaopcoes" />">
			  		<img class="cursorMao" alt="<fmt:message key="ipdms.processo.listaopcoes" />" title="<fmt:message key="ipdms.processo.listaopcoes" />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
						onclick="setActionAndSubmit($('form'), 'listProcessoListaOpcoesRelation.do2?numero=${processoFormBean.processo.numero}');" />
			  	</div>
			  	
			  	<div class="label" style="width: 74%;" title="<fmt:message key="ipdms.processo.listaopcoes" />">
			  		<span class="textoAzul">
			  			» ${listaopcoesassociadas}:
			  		</span> 
			  		<div class="listaCinzenta">
			  			<c:set var="collectionName" value="${processoFormBean.listaOpcoesAssociadas}" scope="request"></c:set>
						<c:set var="firstline" value="${listaopcoesassociadas}" scope="request"></c:set>
						<c:set var="noinfo" value="${emptyListaopcoesassociadas}" scope="request"></c:set>
						<jsp:include page="moreInfoInTittle.jsp" /> 
						<br/>			
			  		</div>
			  	</div>
			</div>
	
			<%-- Associar Etapas--%>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.processo.etapas" />">
			  		<fmt:message key="ipdms.processo.etapas" />
			  	</div>
			
				<div class="label" style="width: 5%;" title="<fmt:message key="ipdms.processo.etapas" />">
			  		<img class="cursorMao" alt="<fmt:message key="ipdms.processo.etapas" />" title="<fmt:message key="ipdms.processo.etapas" />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"
			 			onclick="setActionAndSubmit($('form'), 'listProcessoEtapaRelation.do2?numero=${processoFormBean.processo.numero}');"/>
			  	</div>
			
				<div class="label" style="width: 74%;" title="<fmt:message key="ipdms.processo.etapas" />">
			  		<span class="textoAzul">
			  			» ${etapasassociadas}:
			  		</span> 
			  		<div class="listaCinzenta">
			  			<c:set var="collectionName" value="${processoFormBean.etapasAssociadas}" scope="request"></c:set>
						<c:set var="firstline" value="${etapasassociadas}" scope="request"></c:set>
						<c:set var="noinfo" value="${emptyEtapasassociadas}" scope="request"></c:set>
						<jsp:include page="moreInfoInTittle.jsp" /><br/>
			  		</div>
			  	</div>
			</div>
	
		</logic:greaterThan>
	</nested:nest>

	<br />
	<br />

	<div class="row" style="text-align:left;">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2"><fmt:message key="ipdms.variante.variantesProcesso"/></td>
			  </tr>
			</tbody>
		</table>					
	</div>

	<span class="formlabel_select" >
		<fmt:message key="ipdms.seleccionar"/> <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="<fmt:message key="ipdms.todos"/>"><fmt:message key="ipdms.todos"/></a>,
					   <a href="#"  onclick="Checkboxes(false);" class="formlabel_select" title="<fmt:message key="ipdms.nenhum"/>"><fmt:message key="ipdms.nenhum"/></a>
	</span><br/><br/>

	<%-- Variantes do processo --%>
	<table cellpadding="0" cellspacing="0" class="centro">    
		<tr>
			<th class="centro"><fmt:message key="ipdms.variante.nome"/> ** </th>
			<th class="centro"><fmt:message key="ipdms.variante.descricao"/></th>
			<th class="centro"><fmt:message key="ipdms.variante.sigla"/> **</th>
			<th class="centro"><fmt:message key="ipdms.variante.idexterno"/> ** </th>
			<th class="centro"><fmt:message key="ipdms.variante.classesuporte"/> ** </th>
			<th class="centro"><fmt:message key="ipdms.variante.linkcriacao"/> **  </th>
			<th class="centro"><fmt:message key="ipdms.variante.externa"/></th>			
			<th class="centro"><fmt:message key="ipdms.variante.lancaWorkflow"/></th>
			<th class="centro"><fmt:message key="ipdms.variante.template"/></th>
			<th class="centro"><fmt:message key="ipdms.variante.listaopcoes"/></th>
			<th class="centro"><fmt:message key="ipdms.variante.tiposdocumento"/></th>
			<th class="centro"><fmt:message key="ipdms.variante.tiposdocumento"/></th>
			<th class="centro"><img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" alt="<fmt:message key="ipdms.forms.eliminar"/>" title="<fmt:message key="ipdms.forms.eliminar"/>" /> </th>
		</tr>
		<tr class="hoverTransparente"><td colspan="8" height="10"></td></tr>
		<html:hidden property="variantesSize" value="${fn:length(processoFormBean.variantes)}" />
		
			<logic:iterate name="${formBeanName}" property="variantes" id="variantes" indexId="counter">
				<nested:root name="variantes">
					<tr class="hoverTransparente">				
						<td class="centro"><nested:text property="titulo" size="15" maxlength="80" indexed="true"/></td>
						<td class="centro"><nested:text property="descricaoCurta" size="15" maxlength="2000" indexed="true" style="width=100%"/></td>
						<td class="centro"><nested:text property="sigla" size="8" maxlength="40" indexed="true" style="width=100%"/></td>
						<td class="centro"><nested:text property="idExterno" size="10" maxlength="40" indexed="true"/></td>
						<td class="centro"><nested:text property="classeSuporte" size="30" indexed="true" /></td>					
						<td class="centro"><nested:text property="linkCriacao" size="15" indexed="true" style="width=100%"/></td>										
						<td class="alignCenter"><nested:checkbox styleClass="radion" indexed="true" property="visivelExterior" style="border:0;"/></td>
						<td class="alignCenter"><nested:checkbox styleClass="radion" indexed="true" property="lancaWorkflow" style="border:0;"/></td>						
						<nested:greaterThan property="numeroConteudo" value="0">
							<td class="centro">
								<a href="${pageContext.request.contextPath}/associarTemplateInstrucao.do2?numero=${variantes.numeroConteudo}">
									<fmt:message key="ipdms.variante.associartemplate" />
								</a>
							</td>
							<td class="centro">
								<a href="${pageContext.request.contextPath}/listVarianteListaOpcoesRelation.do2?numero=${variantes.numeroConteudo}">
									<fmt:message key="ipdms.variante.associarlistaopcoes" />
								</a>
							</td>
							<td class="centro">
								<a href="${pageContext.request.contextPath}/listTipoDocumentoVarianteAssociation.do2?numero=${variantes.numeroConteudo}&tipoAccao=I">
									<fmt:message key="ipdms.variante.associartiposdocumentoinstrucao" />
								</a>
							</td>
							<td class="centro">
								<a href="${pageContext.request.contextPath}/listTipoDocumentoVarianteAssociation.do2?numero=${variantes.numeroConteudo}&tipoAccao=T">
									<fmt:message key="ipdms.variante.associartiposdocumentotramitacao" />
								</a>
							</td>
						</nested:greaterThan>										
						<td class="alignCenter" >
							<nested:hidden property="numeroConteudo" indexed="true" />
							<nested:greaterThan property="numeroConteudo" value="0">
								<input type="checkbox" class="radion" style="border: none;" name="cut#${variantes.numeroConteudo}" />
							</nested:greaterThan>
						</td>
					</tr>
				</nested:root>
			</logic:iterate>
		</table>
		
	<div class="buttonRow">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key="ipdms.forms.anterior.title"/>"
				onclick="setActionAndSubmit(this.form, 'listProcesso.do2');">
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key="ipdms.forms.submit.title"/>">
	</div>
	
</html:form>