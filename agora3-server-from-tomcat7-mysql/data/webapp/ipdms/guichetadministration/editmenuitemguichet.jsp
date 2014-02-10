<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.guichetadmin.menuitem.titulo" var="titulo" />
<fmt:message key="ipdms.forms.select" var="select" />
<fmt:message key="ipdms.guichetadmin.menuitem.instrucao.variante" var="variante" />
<fmt:message key="ipdms.guichetadmin.menu.menu" var="menu" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMAGE_DIR" value="${pageContext.request.contextPath}/images" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>
<script>

Ext.onReady(function(){
	//cololcar formato de data caso nao haja datas reais
	dateFormatCheckonLoad();
});

var count = 0;

function showMenuGuichetList(){
	var action = "${pageContext.request.contextPath}/ajaxListMenuGuichetTree.do2";	
	var paramts = "valuePlaceOlder=idMenuSup";
	paramts += "&descPlaceOlder=tituloMenuSuperior";
	paramts += "&window=winchoose";

	ExtWindow('${menu}',action,paramts,'ext');	
}

function showVarianteList(){
	var action = "${pageContext.request.contextPath}/ajaxListVariante.do2";
	action += "?valuePlaceOlder=numeroConteudoVariante";
	action += "&otherValuePlaceOlder=nomeVariante";
	action += "&window=winchoose";

	ExtWindow('${select} ${variante}',action,'','html');	
}

function enableField(textField)
{
	var index = textField.name.substring(textField.name.indexOf("[")+1, textField.name.indexOf("]") );
	var elems = textField.form.elements;
	for( i = 0; i < elems.length; i++ )
	{
		if( elems[i].type == "file" && elems[i].name.indexOf("["+index+"]") != -1 )
		{
			textField.value = trim(textField.value);
			elems[i].disabled = textField.value == "";
			if( elems[i].disabled ) elems[i].value = "";
		}
	}
}

</script>

<script type="text/javascript">	
	document.title = '${productName} - ${titulo}';	 
</script>

<div class="row" style="padding-top:0px; text-align:left;">
	<table border="0" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${titulo}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id="menuItemGuichetErrorDiv">
	<html:errors />
</div>

<html:form action="/saveMenuItemGuichet" styleClass="form" enctype="multipart/form-data" onsubmit="return dateFormatCheckonSubmit();" >
	<html:hidden property="id"/>
	<html:hidden property="tipo"/>	

	<!-- DIV DO FORMULÁRIO -->
	<div class="row" style="padding-bottom:2%;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.obrigatorio" />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 12%; " title="<fmt:message key="ipdms.guichetadmin.menuitem.menuSuperior" />">
	  		<label for="tituloMenuSuperior"><fmt:message key="ipdms.guichetadmin.menuitem.menuSuperior" /> *</label>
	  	</div>
	  	
	  	<div class="label" style="width: 5%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.menuSuperior" />">
	  		<a href="#" onclick="showMenuGuichetList();"><img class="cursorMao" alt="<fmt:message key="ipdms.guichetadmin.menuitem.menuSuperior" />" title="<fmt:message key="ipdms.guichetadmin.menuitem.menuSuperior" />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" /></a>
	  	</div>
	  	
	  	<div class="label" style="width: 76%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.menuSuperior" />">
	  			<html:hidden property="idMenuSuperior" styleId="idMenuSup"/>			  		
				<html:text property="tituloMenuSuperior" styleId="tituloMenuSuperior" style="width:83%" readonly="true" />
	  	</div>
	</div>
			
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.menuitem.descricaoCurta" />">
			<label for="descricaocurta"><fmt:message key="ipdms.guichetadmin.menuitem.descricaoCurta" /> *</label>
		</div>

		<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.descricaoCurta" />">
			<html:text property="descricaoCurta" styleId="descricaocurta" style="width:80%" />
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.menuitem.descricao" />">
			<label for="descricao"><fmt:message key="ipdms.guichetadmin.menuitem.descricao" /> *</label>
		</div>

		<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.descricao" />">
			<html:textarea property="descricao" rows="2" cols="20" styleId="descricao" style="width:80%"/>
		</div>
	</div>
			
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.menuitem.ordem" />">
			<label for="ordem"><fmt:message key="ipdms.guichetadmin.menuitem.ordem" /> *</label>
		</div>

		<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.ordem" />">
			<html:text property="ordem" styleId="ordem" style="width:5%" />																
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.menuitem.permissoes" />">
			<fmt:message key="ipdms.guichetadmin.menuitem.permissoes" /> *
		</div>

		<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.permissoes" />">
			<label for="comLogin"><html:radio property="permLogin" value="true" styleId="comLogin"/> Com Login</label>
			<label for="semLogin"><html:radio property="permLogin" value="false" styleId="semLogin"/> Sem Login</label>
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.permissoes" />">
		</div>

		<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.permissoes" />">
			<label for="singular"><html:checkbox property="permSingular" value="true" styleId="singular" style="border:0;"/> <fmt:message key="ipdms.guichetadmin.menuitem.singular" /></label><br />
			<label for="entidade"><html:checkbox property="permEntidade" value="true" styleId="entidade" style="border:0;"/> <fmt:message key="ipdms.guichetadmin.menuitem.colectivo" /></label>
		</div>
	</div>	
		
	<div style="clear:both"></div>

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.menuitem.dataInicio" />">
			<label for="dataInicio"><fmt:message key="ipdms.guichetadmin.menuitem.dataInicio" /></label>
		</div>

		<div class="label" style="width: 13%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.dataInicio" />">					
				<html:text property="dataInicio" styleClass="date" styleId="dataInicio" maxlength="10" style="width:85%" />					
		</div>

		<div class="label" style="width: 67%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.dataInicio" />">
				<img id="dataInicioButton" src="${pageContext.request.contextPath}/images/guichet/icons/icon-calendario.png" class="cursorMao" alt="<fmt:message key="ipdms.guichetadmin.menuitem.dataInicio" />" title="<fmt:message key="ipdms.guichetadmin.menuitem.dataInicio" />"/>
				<script type='text/javascript'>
               	Calendar.setup({ inputField : 'dataInicio', ifFormat : '%d-%m-%Y', button : "dataInicioButton" });
			</script>
		</div>
	</div>
	<div style="clear:both"></div>
			
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.menuitem.dataFim" />">
			<label for="dataFim"><fmt:message key="ipdms.guichetadmin.menuitem.dataFim" /></label>
		</div>

		<div class="label" style="width: 13%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.dataFim" />">					
				<html:text property="dataFim" styleClass="date" styleId="dataFim" maxlength="10" style="width:85%" />					
		</div>

		<div class="label" style="width: 67%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.dataFim" />">
				<img id="dataFimButton" src="${pageContext.request.contextPath}/images/guichet/icons/icon-calendario.png" class="cursorMao" alt="<fmt:message key="ipdms.guichetadmin.menuitem.dataFim" />" title="<fmt:message key="ipdms.guichetadmin.menuitem.dataFim" />"/>
				<script type='text/javascript'>
               	Calendar.setup({ inputField : 'dataFim', ifFormat : '%d-%m-%Y', button : "dataFimButton" });
			</script>
		</div>
	</div>
	<div style="clear:both"></div><br/>
	
	
	<c:choose>
		<c:when test="${menuItemGuichetFormBean.tipo == 'link'}">
			<div class="row" style="padding-top:0px; text-align:left;">
				<table border="0" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
						<tr>
						    <td class="titulo2"><fmt:message key="ipdms.guichetadmin.menuitem.link.titulo" /></td>
						</tr>
					</tbody>
				</table>					
			</div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.link.conteudo" />">
					<label for="conteudo"><fmt:message key="ipdms.guichetadmin.menuitem.link.conteudo" /> *</label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.link.conteudo" />">
					<html:textarea property="conteudo" rows="2" cols="20" styleId="conteudo" style="width:80%"/>
				</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.link.linkUrl" />">
					<label for="linkUrl"><fmt:message key="ipdms.guichetadmin.menuitem.link.linkUrl" /> *</label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.link.linkUrl" />">
					<html:text property="linkUrl" styleId="linkUrl" style="width:80%"/>																
				</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.link.visualizacao" />">
					<label for="linkVisualizacao"><fmt:message key="ipdms.guichetadmin.menuitem.link.visualizacao" /></label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.link.visualizacao" />">					
					<html:select property="linkVisualizacao" styleId="linkVisualizacao" style="width:40%;">
						<html:option value="0"><fmt:message key="ipdms.guichetadmin.menuitem.link.janelanova" /></html:option>
						<html:option value="1"><fmt:message key="ipdms.guichetadmin.menuitem.link.popup" /></html:option>
						<html:option value="2"><fmt:message key="ipdms.guichetadmin.menuitem.link.mesmajanela" /></html:option>
					</html:select>					
				</div>
			</div>		
		</c:when>
		<c:when test="${menuItemGuichetFormBean.tipo == 'instrucao'}">
			<div class="row" style="padding-top:0px; text-align:left;">
				<table border="0" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
						<tr>
						    <td class="titulo2"><fmt:message key="ipdms.guichetadmin.menuitem.list.instrucao" /></td>
						</tr>
					</tbody>
				</table>					
			</div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.link.conteudo" />">
					<label for="conteudo"><fmt:message key="ipdms.guichetadmin.menuitem.link.conteudo" /> *</label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.link.conteudo" />">
					<html:textarea property="conteudo" rows="2" cols="20" styleId="conteudo" style="width:80%"/>
				</div>
			</div>
			<div class="row formlabel_sf">
				<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.menuitem.instrucao.variante" />">
			  		<label for="variante"><fmt:message key="ipdms.guichetadmin.menuitem.instrucao.variante" /> *</label>
			  	</div>
			  	
			  	<div class="label" style="width: 5%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.instrucao.variante" />">
			  		<a href="#" onclick="showVarianteList();"><img class="cursorMao" alt="<fmt:message key="ipdms.guichetadmin.menuitem.instrucao.variante" />" title="<fmt:message key="ipdms.guichetadmin.menuitem.instrucao.variante" />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" /></a>
			  	</div>
			  	
			  	<div class="label" style="width: 74%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.instrucao.variante" />">
			  			<html:hidden property="numeroConteudoVariante" styleId="numeroConteudoVariante"/>			  		
						<html:text property="nomeVariante" styleId="nomeVariante" style="width:80%"  readonly="true"/>
			  	</div>
			</div>		
		</c:when>
		<c:otherwise> <%-- tipo == 'informacao' --%>
			<div class="row" style="padding-top:0px; text-align:left;">
				<table border="0" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
						<tr>
						    <td class="titulo2"><fmt:message key="ipdms.guichetadmin.menuitem.informacao.titulo" /></td>
						</tr>
					</tbody>
				</table>					
			</div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.link.conteudo" />">
					<label for="conteudo"><fmt:message key="ipdms.guichetadmin.menuitem.link.conteudo" /> *</label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.link.conteudo" />">
					<html:textarea property="conteudo" rows="2" cols="20" styleId="conteudo" style="width:80%"/>
				</div>
			</div>		
		</c:otherwise>		
	</c:choose>		
	<div style="clear:both"></div><br />
	
	<%-- ANEXOS JA ADICIONADO AO MENU ITEM--%>
	<c:if test="${not empty menuItemGuichetFormBean.uploadedAnexos}">
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.guichetadmin.menuitem.anexosExistentes" />">
				<label for="anexos"><fmt:message key="ipdms.guichetadmin.menuitem.anexosExistentes" /></label>
			</div>
			
			<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.anexosExistentes" />">
				<table border="0" cellpadding="0" cellspacing="0" class="centro" style="width:500px;">
					<tr>
						<th width="175" class="centro" style="text-align: left;"><fmt:message key="ipdms.guichetadmin.menuitem.descricaoAnexo" /></th>
						<th width="210" class="centro"><fmt:message key="ipdms.guichetadmin.menuitem.ficheiro" /></th>
						<th width="15" class="centro"><img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" alt="<fmt:message key='ipdms.guichetadmin.menuitem.list.eliminar' />" title="<fmt:message key='ipdms.guichetadmin.menuitem.list.eliminar' />" /></th>
					</tr>
					<nested:iterate name="menuItemGuichetFormBean" property="uploadedAnexos" id="uploadedAnexos">
					<nested:root name="uploadedAnexos">
						<tr>
							<td class="centro">${uploadedAnexos.description}</td>
							<td class="centro" style="text-align:center;">
								<a href="${pageContext.request.contextPath}/file/getAnexoGuichet.do2?id=${uploadedAnexos.id}" class="formfield">
									${uploadedAnexos.formFile.fileName}
								</a>
							</td>
							<td class="centro"><nested:checkbox property="selected" indexed="true" style="border:0;" /></td>
						</tr>
					</nested:root>
					</nested:iterate>
				</table>
			<br />
			</div>
		</div>	
	</c:if>
	
	<%-- NOVOS ANEXOS --%>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.menuitem.anexos" />">
			<label for="anexos"><fmt:message key="ipdms.guichetadmin.menuitem.anexos" /></label>
		</div>	
		<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.anexos" />">
			<table border="0" cellpadding="0" cellspacing="1" class="centro" style="width:500px;" id="anexoTable" summary="<fmt:message key="ipdms.guichetadmin.menuitem.anexos" />">
				<tbody>
				<tr>
					<th style="width:50%" class="centro"><fmt:message key="ipdms.guichetadmin.menuitem.nomeDocumento" /></th>
					<th style="width:50%" class="centro"><fmt:message key="ipdms.guichetadmin.menuitem.ficheiro" /></th>
				</tr>
				
				<nested:iterate property="newAnexos" id="newAnexos" indexId="i">
					<nested:root name="newAnexos">
					<tr class="hoverTransparente">
						<td><nested:text property="description" size="30" maxlength="100" indexed="true" /></td>
						<td class="centro"><nested:file property="formFile" size="30" indexed="true"/></td>
					</tr>
					</nested:root>
				</nested:iterate>
				</tbody>
			</table>
		</div>
	</div>
			
	<div style="clear:both"></div><br />
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.forms.adicionar' />">
			
		</div>
		<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.forms.adicionar' />">
			<html:hidden property="method" styleId="method" value="addAnexo"/>
			<input type="button" class="btForm" value="<fmt:message key='ipdms.forms.adicionar' /> +" id="adicionarMais" 
				onclick="setActionAndSubmit(this.form, 'editMenuItemGuichet.do2');"/>
		</div>
	</div>
	<div style="clear:both"></div>
	<div class="buttonRow">
		<input type="submit" class="btForm" value="<fmt:message key='ipdms.forms.submit' />" title="<fmt:message key='ipdms.forms.submit.title' />" id="submeter">
		<input type="button" class="btFormEscuro" onclick="setActionAndSubmit(this.form, 'listMenuItemGuichet.do2');" value="<fmt:message key='ipdms.forms.cancelar' />" title="<fmt:message key='ipdms.forms.cancelar.title' />" id="cancelar">
	</div>
</html:form>
