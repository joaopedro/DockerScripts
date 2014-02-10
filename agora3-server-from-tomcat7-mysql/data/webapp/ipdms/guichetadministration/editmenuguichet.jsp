<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMAGE_DIR" value="${pageContext.request.contextPath}/images" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />

<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key='ipdms.guichetadmin.menu.titulo' var="titulo" />
<fmt:message key='ipdms.guichetadmin.menu.menuSuperior' var="menuSuperior" />

<script>	
	function showMenuGuichetList(){
		var action = "${pageContext.request.contextPath}/ajaxListMenuGuichetTree.do2";	
		var paramts = "valuePlaceOlder=idMenuSup";
		paramts += "&descPlaceOlder=tituloMenuSuperior";
		paramts += "&window=winchoose";
	
		ExtWindow('${menuSuperior}',action,paramts,'ext');
	}

	Ext.onReady(function(){
		//cololcar formato de data caso nao haja datas reais
		dateFormatCheckonLoad();	
	});
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

<div id="menuGuichetErrorDiv">
	<html:errors />
</div>

<html:form action="/saveMenuGuichet" onsubmit="return dateFormatCheckonSubmit();" method="post" styleClass="form" enctype="multipart/form-data">
	<html:hidden property="id"/>
	
	<!-- DIV DO FORMULÁRIO -->
	<div class="row" style="padding-bottom:2%;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.obrigatorio" />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>
			
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 15%; " title="${menuSuperior}">
	  		<label for="tituloMenuSuperior">${menuSuperior}</label>
	  	</div>
			  	
	  	<div class="label" style="width: 5%;" title="${menuSuperior}">
	  		<a href="#" onclick="showMenuGuichetList();"><img class="cursorMao" alt="${menuSuperior}" title="${menuSuperior}" src="${IMAGE_DIR}/icon/icon-pesquisa.png" /></a>
	  	</div>
	  	
	  	<div class="label" style="width: 76%;" title="${menuSuperior}">
	  			<html:hidden property="idMenuSuperior" styleId="idMenuSup"/>			  		
				<html:text property="tituloMenuSuperior" styleId="tituloMenuSuperior" style="width:81%"  readonly="true" />
	  	</div>
	</div>
			
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.guichetadmin.menu.menu' />">
			<label for="titulo"><fmt:message key='ipdms.guichetadmin.menu.menu' /> *</label>
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='ipdms.guichetadmin.menu.menu' />">
			<html:text property="titulo" styleId="titulo" style="width:80%" />
		</div>
	</div>
			
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.guichetadmin.menu.ordem' />">
			<label for="ordem"><fmt:message key='ipdms.guichetadmin.menu.ordem' /> *</label>
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='ipdms.guichetadmin.menu.ordem' />">
			<html:text property="ordem" styleId="ordem" style="width:5%" />																
		</div>
	</div>
	
		<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.guichetadmin.menu.permissoes' />">
			<fmt:message key='ipdms.guichetadmin.menu.permissoes' />
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='ipdms.guichetadmin.menu.permissoes' />">
			<label for="comLogin"><html:radio property="permLogin" value="true" styleId="comLogin" /> <fmt:message key='ipdms.guichetadmin.menu.comLogin' /></label>
			<label for="semLogin"><html:radio property="permLogin" value="false" styleId="semLogin"/> <fmt:message key='ipdms.guichetadmin.menu.semLogin' /></label>
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 20%;" title="<fmt:message key='ipdms.guichetadmin.menu.permissoes' />">
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='ipdms.guichetadmin.menu.permissoes' />">
			<label for="singular"><html:checkbox property="permSingular" value="true" styleId="singular" style="border:0;"/> <fmt:message key='ipdms.guichetadmin.menu.singular' /></label><br />
			<label for="entidade"><html:checkbox property="permEntidade" value="true" styleId="entidade" style="border:0;"/> <fmt:message key='ipdms.guichetadmin.menu.colectivo' /></label>
		</div>
	</div>
		
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.guichetadmin.menu.dataInicio' />">
	  		<label for="dataInicio"><fmt:message key='ipdms.guichetadmin.menu.dataInicio' /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 11%;" title="<fmt:message key='ipdms.guichetadmin.menu.dataInicio' />">
	  		<html:text property="dataInicio" styleId="dataInicio" maxlength="10" style="width:84%" styleClass="date"/>
		</div>

		<div class="label" style="width: 66%;" title="<fmt:message key='ipdms.guichetadmin.menu.dataInicio' />">
			<img id="dataInicioButton" src="${IMAGE_DIR}/guichet/icons/icon-calendario.png" class="cursorMao" alt="<fmt:message key='ipdms.guichetadmin.menu.dataInicio' />" title="<fmt:message key='ipdms.guichetadmin.menu.dataInicio' />"/>
				<script type='text/javascript'>
               	Calendar.setup({ inputField : 'dataInicio', ifFormat : '%d-%m-%Y', button : "dataInicioButton" });
               	</script>
		</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.guichetadmin.menu.dataFim' />">
			<label for="dataFim"><fmt:message key='ipdms.guichetadmin.menu.dataFim' /></label>
		</div>
	  	
	  	<div class="label" style="width: 11%;" title="<fmt:message key='ipdms.guichetadmin.menu.dataFim' />">
	  		<html:text property="dataFim" styleId="dataFim" maxlength="10" style="width:84%" styleClass="date"/>
		</div>

		<div class="label" style="width: 14%;" title="<fmt:message key='ipdms.guichetadmin.menu.dataInicio' />">
			<img id="dataFimButton" src="${IMAGE_DIR}/guichet/icons/icon-calendario.png" class="cursorMao" alt="<fmt:message key='ipdms.guichetadmin.menu.dataFim' />" title="<fmt:message key='ipdms.guichetadmin.menu.dataFim' />"/>
				<script type='text/javascript'>
               	Calendar.setup({ inputField : 'dataFim', ifFormat : '%d-%m-%Y', button : "dataFimButton" });
			</script>
		</div>
	</div>
	<div style="clear:both"></div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.guichetadmin.menu.descricao' />">
			<label for="descricao"><fmt:message key='ipdms.guichetadmin.menu.descricao' /></label>
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='ipdms.guichetadmin.menu.descricao' />">
				<html:textarea property="descricao" rows="2" cols="20" styleId="descricao" style="width:80%"/>					
		</div>
	</div>
	
	<div style="clear:both"></div><br />

		
	<%-- LINKS JA ADICIONADO AO MENU --%>
	<c:if test="${not empty menuGuichetFormBean.uploadedAnexos}">
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.guichetadmin.menu.anexos' />">
				<label for="anexos"><fmt:message key='ipdms.guichetadmin.menu.anexosExistentes' /></label>
			</div>
			
			<div class="label" style="width: 76%;" title="<fmt:message key='ipdms.guichetadmin.menu.anexosExistentes' />">
				<table border="0" cellpadding="0" cellspacing="0" class="centro" style="width:500px;">
					<tr>
						<th width="175" class="centro" style="text-align: left;"><fmt:message key='ipdms.guichetadmin.menu.descricao' /></th>
						<th width="210" class="centro">Ficheiro</th>
						<th width="15" class="centro"><img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" alt="<fmt:message key='ipdms.forms.eliminar' />" title="<fmt:message key='ipdms.forms.eliminar' />" /></th>
					</tr>
					<nested:iterate name="menuGuichetFormBean" property="uploadedAnexos" id="uploadedAnexos">
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
			</div>
		</div>	
	</c:if>
	<br />
	
	<%-- NOVOS LINKS --%>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 20%; " title="Links">
			<label for="links">Links</label>
		</div>	
		<div class="label" style="width: 76%;" title="Links">
			<table border="0" cellpadding="0" cellspacing="1" class="centro" style="width:500px;" id="linkTable" summary="Links">
				<tbody>
				<tr>
					<th style="width:50%" class="centro"><fmt:message key='ipdms.guichetadmin.menu.nomeDocumento' /></th>
					<th style="width:50%" class="centro"><fmt:message key='ipdms.guichetadmin.menu.ficheiro' /></th>
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
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.forms.adicionar' />">
			
		</div>
		<div class="label" style="width: 76%;" title="<fmt:message key='ipdms.forms.adicionar' />">
			<html:hidden property="method" styleId="method" value="addAnexo"/>
			<input type="button" class="btForm" value="<fmt:message key='ipdms.forms.adicionar' /> +" id="adicionarMais" 
				onclick="setActionAndSubmit(this.form, 'editMenuGuichet.do2');"/>
		</div>
	</div>

	<div style="clear:both"></div>
	<div class="buttonRow">
		<input type="submit" class="btForm" value="<fmt:message key='ipdms.forms.submit' />" title="<fmt:message key='ipdms.forms.submit.title' />" id="submeter">
		<input type="button" class="btFormEscuro" onclick="setActionAndSubmit(this.form, 'listMenuGuichet.do2');" value="<fmt:message key='ipdms.forms.cancelar' />" title="<fmt:message key='ipdms.forms.cancelar.title' />" id="cancelar">
	</div>

</html:form>
