<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<fmt:message key="ipdms.modules.entidade.nome" var="nome" />
<fmt:message key="ipdms.modules.entidade.nif" var="nif" />
<fmt:message key="ipdms.modules.entidade.criar" var="criar" />
<fmt:message key="ipdms.forms.filtrar" var="filtrar" />
<fmt:message key="ipdms.forms.filtrar.title" var="filtrarTitle" />
<fmt:message key="ipdms.forms.fechar" var="fechar" />
<fmt:message key="ipdms.modules.entidade.contacto.expandir" var="expandir" />
<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.modules.entidade.designacaosingular" var="entidade" />
<fmt:message key="ipdms.modules.entidade.singular.tab.morada" var="morada" />
<fmt:message key="webflow.requerente.contacto" var="contacto" />

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<LINK href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />
<LINK href='${THEMES_DIR}/estilos.css' type=text/css rel=stylesheet />
<LINK href='${pageContext.request.contextPath}/ipdms/modules/entidade/theme/entidade.css' type=text/css rel=stylesheet />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script src='${JS_DIR}/formFunctions.js' type="text/javascript"></script>
<script src='${JS_DIR}/utils.js' type="text/javascript"></script>
<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ipdms/modules/entidade/js/entidadeutil.js" type="text/javascript" ></script>

<body style="overflow: auto;">
<br/>

	<c:set var="popupParams" value="${sessionScope['ipdms_entidade_popupparams'].params}" />

	<form action="listEntidadePopup.do2" name="form" id="form" class="form">
		<input type="hidden" name="tipoEntidade" id="tipoEntidade" value="${popupParams.tipoEntidade}" />
		<input type="hidden" name="page" id="page" value="1" />
		<input type="hidden" name="showMorada" id="showMorada"/>
		<input type="hidden" name="showContacto" id="showContacto"/>
		
		<table width="100%" style="border:none" cellpadding="5" cellspacing="0">
			<tr style="text-align:left;">
				<td>
					<div class="alignLeft" >
						<c:if test="${modEnt}">
						<div class="left" style="padding-right:10px;">
							<a href="${pageContext.request.contextPath}/editEntidadePopup.do2?saveAction=/saveEntidadePopup.do2" id="editEntidadeButton"></a>
								<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" class="cursorMao" alt="${criar}" title="${criar}"/>
						</div>
						<div class="right" style="width:80%">
							<div class="texto"><a href="${pageContext.request.contextPath}/editEntidadePopup.do2?window=${window}&saveAction=/saveEntidadePopup.do2" title="${criar}">${criar}</a></div>
						</div>
						</c:if>
					</div>
					
					<div class="row formlabel_sf">
						<div class="leftTab label" style="width: 20%; " title="${nome}">
					  		<label for="nome">${nome}</label>
					  	</div>
					  	
					  	<div class="label" style="width: 76%;" title="${nome}">
					  		<input type="text" name="nome" id="nome" value="${param.nome}" size="50" maxlength="80"/>
					  	</div>
					</div>	
					
					<div class="row formlabel_sf">
						<div class="leftTab label" style="width: 20%; " title="${nif}">
					  		<label for="nif">${nif}</label>
					  	</div>
					  	
					  	<div class="label" style="width: 76%;" title="${nif}">
					  		<input type="text" name="nif" id="nif" size="15" maxlength="15" value="${param.nif}"/>
					  	</div>
					</div>
					
					<div class="buttonRow">
						<input type="submit" name="search" value="${filtrar}" class="btForm" title="${filtrarTitle}"/>
					</div>
					
				</td>
			</tr>
		</table>
	</form>

<hr>
<c:set var="currentPage">
	<c:choose>
		<c:when test="${param.page !=null}">${param.page}</c:when>
		<c:otherwise>1</c:otherwise>
	</c:choose>
</c:set>
<display:table id="entidades" name="${paginatedList}" htmlId="worklist">
	<display:column title="" sortable="false">
		<c:set var="nomeEntidade">${fn:replace(entidades.nome,"'","&lsquo;")}</c:set>
		<input type="hidden" name="nomeEntidade" id="nomeEntidade${entidades.id}" value="${nomeEntidade}"/>
		<input type="hidden" name="nifEntidade" id="nifEntidade${entidades.id}" value="${entidades.nif}"/>
		<input type="hidden" name="moradaPrincipal" id="moradaPrincipal${entidades.id}" value="${entidades.moradaPrincipal.id}"/>
		<c:set var="localidadeMoradaPrincipal">${fn:replace(entidades.moradaPrincipal.localidadeMorada,"'","&lsquo;")}</c:set>
		<input type="hidden" name="localidadeMoradaPrincipal" id="localidadeMoradaPrincipal${entidades.id}" value="${localidadeMoradaPrincipal}"/>
		<c:set var="moradaDescriptionPrincipal">${fn:replace(entidades.moradaPrincipal.moradaDescription,"'","&lsquo;")}</c:set>
		<input type="hidden" name="moradaDescriptionPrincipal" id="moradaDescriptionPrincipal${entidades.id}" value="${moradaDescriptionPrincipal}"/>
		<c:choose>
			<c:when test="${entidades.moradas == null or fn:length(entidades.moradas) == 0}"></c:when>
			<c:when test="${param.showMorada == entidades.id}">
				<img id="img_hide_morada_${entidades.id}" src="images/icon/icon-menos.png" class="cursorMao"
				onclick="$('page').value='${currentPage}';setActionAndSubmit($('form'), 'listEntidadePopup.do2');" alt="${fechar}" title="${fechar}" />
			</c:when>
			<c:otherwise>
				<img id="img_show_morada_${entidades.id}" src="images/icon/icon-mais.png" class="cursorMao"
				onclick="$('page').value='${currentPage}';$('showMorada').value='${entidades.id}';setActionAndSubmit($('form'), 'listEntidadePopup.do2');" alt="${expandir}" title="${expandir}" />
			</c:otherwise>
		</c:choose>
	</display:column>
	<display:column title="${nome}" sortable="true" sortName="nome" property="nome" class="entidadeName id_${entidades.id}"></display:column>
	<display:column title="${nif}" sortable="true" sortName="nif" property="nif"></display:column>
	<c:if test="${modEnt}">
	<display:column>
			<a href="${pageContext.request.contextPath}/editEntidadePopup.do2?method=loadEntidadeForm&id=${entidades.id}&deletePopUp=Popup&window=${window}&saveAction=/saveEntidadePopup.do2" >
				<img src="${pageContext.request.contextPath}/images/icon/icon-editar.png" class="cursorMao" alt="${editar} ${entidade}" title="${editar} ${entidade}" />
			</a>
	</display:column>
	</c:if>


	<display:column><c:if test="${param.showMorada == entidades.id}">
	</td></tr><tr><td colspan="5">
	<c:set var="indice" value="0" />
		<display:table id="morada" name="${entidades.moradas}" htmlId="worklist">
			<display:column title="" sortable="false">
				<c:choose>
					<c:when test="${morada.contactos == null or fn:length(morada.contactos) == 0}"></c:when>
					<c:when test="${param.showContacto == morada.id}">
						<img id="img_hide_contacto_${morada.id}" src="images/icon/icon-menos.png" class="cursorMao" 
						onclick="$('page').value='${currentPage}';$('showMorada').value='${entidades.id}';setActionAndSubmit($('form'), 'listEntidadePopup.do2');" alt="${fechar}" title="${fechar}" />
					</c:when>
					<c:otherwise>
						<img id="img_show_contacto_${morada.id}" src="images/icon/icon-mais.png" class="cursorMao"
						onclick="$('page').value='${currentPage}';$('showMorada').value='${entidades.id}';$('showContacto').value='${morada.id}';setActionAndSubmit($('form'), 'listEntidadePopup.do2');" alt="${expandir}" title="${expandir}" />
					</c:otherwise>
				</c:choose>
			</display:column>
			<display:column title="${morada}">
				<input type="hidden" name="nomeEntidadeValue" id="nomeEntidadeValue${indice}" value="${nomeEntidade}"/>
				<input type="hidden" name="nifEntidadeValue" id="nifEntidadeValue${indice}" value="${entidades.nif}"/>
				<c:set var="localidadeMoradaValue">${fn:replace(morada.localidadeMorada,"'","&lsquo;")}</c:set>
				<input type="hidden" name="localidadeMoradaValue" id="localidadeMoradaValue${indice}" value="${localidadeMoradaValue}"/>
				<c:set var="moradaDescriptionValue">${fn:replace(morada.moradaDescription,"'","&lsquo;")}</c:set>
				<input type="hidden" name="moradaDescriptionValue" id="moradaDescriptionValue${indice}" value="${moradaDescriptionValue}"/>
		
				<span style='cursor: hand;text-decoration: underline' onclick="affectParentMoradaValues('${entidades.id}','${morada.id}',$('nomeEntidadeValue${indice}').value,$('nifEntidadeValue${indice}').value,$('localidadeMoradaValue${indice}').value,$('moradaDescriptionValue${indice}').value );">
				${morada.localidadeMorada} ${morada.moradaDescription}
				</span>
			</display:column>
			<display:column><c:if test="${param.showMorada == entidades.id and param.showContacto == morada.id}">
				</td></tr><tr><td colspan="2">
				<display:table id="contacto" name="${morada.contactos}" htmlId="worklist">
					<display:column title="${contacto}">
						<input type="hidden" name="nomeContactoValue" id="nomeContactoValue${indice}" value="${contacto.nome}"/>
						<span style='cursor: hand;text-decoration: underline' onclick="affectParentContactoValues('${entidades.id}','${morada.id}','${contacto.id}',$('nomeEntidadeValue${indice}').value,$('nifEntidadeValue${indice}').value,$('nomeContactoValue${indice}').value,$('localidadeMoradaValue${indice}').value,$('moradaDescriptionValue${indice}').value);">
							${contacto.nome}
							<c:if test="${contacto.telefoneTrabalhoDefault}">
								-${contacto.telefoneTrabalho}
							</c:if>
							<c:if test="${contacto.telefonePessoalDefault}">
								-${contacto.telefonePessoal}
							</c:if>
							<c:if test="${contacto.telemovelDefault}">
								-${contacto.telemovel}
							</c:if>
						</span>					
					</display:column>
				</display:table>
				</td></tr>
			</c:if></display:column>
			<c:set var="indice" value="${indice+1}" />
		</display:table>
	</td></tr>
	</c:if></display:column>
	
</display:table>
<div id="divMorada" style="">
</div>

<c:set var="windowName" value="${sessionScope['ipdms_entidade_popupparams'].windowName}" />

<div class="buttonRow">
		<input type="button" class="btForm" title="<fmt:message key="ipdms.forms.fechar.title" />" value="<fmt:message key="ipdms.forms.fechar" />" onclick="parent.${windowName}.close();" />
		<input type="button" class="btForm" title="<fmt:message key="ipdms.forms.reset.title"/>" value="<fmt:message key="ipdms.forms.reset"/>"
								onclick="affectParentContactoValues('','','','','','','','');" />
</div>
</body>
<script>

	affectParentContactoValues = function (idEntidade, idMorada, idContacto, nome, nif, nomeContacto, localidadeMorada, morada) {
		setInputValue(parent.document.getElementById('${popupParams.idContacto}'), idContacto);
		setInputValue(parent.document.getElementById('${popupParams.nomeContacto}'), nomeContacto);
		affectParentMoradaValues(idEntidade, idMorada, nome, nif, localidadeMorada, morada);
	}
	
	affectParentMoradaValues = function (idEntidade, idMorada, nome, nif, localidadeMorada, morada) {
		setInputValue(parent.document.getElementById('${popupParams.localidadeMorada}'), localidadeMorada);
		setInputValue(parent.document.getElementById('${popupParams.morada}'), morada);
		setInputValue(parent.document.getElementById('${popupParams.nomeEntidade}'), nome);
		setInputValue(parent.document.getElementById('${popupParams.nifEntidade}'), nif);
		setInputValue(parent.document.getElementById('${popupParams.idEntidade}'), idEntidade);
		setInputValue(parent.document.getElementById('${popupParams.idMorada}'), idMorada);	
		parent.${windowName}.close();
	}
		
	setInputValue = function (inputElement, value) {
		if(inputElement) {
			inputElement.value = value;
		}
	}
	
	var nomesEntidade = $('worklist').getElementsByClassName('entidadeName');

	for(var i=0; i<nomesEntidade.length; i++)
	{
      	if(nomesEntidade[i].className.split(' ')[1].split('_')[0] == 'id'){
      		var idEntidade = nomesEntidade[i].className.split(' ')[1].split('_')[1];
      		var onclickFunction = 'affectParentContactoValues(\''+idEntidade+'\',\''+$('moradaPrincipal'+idEntidade).value+'\',\'\',\''+$('nomeEntidade'+idEntidade).value+'\',\''+$('nifEntidade'+idEntidade).value+'\',\'\',\''+$('localidadeMoradaPrincipal'+idEntidade).value+'\',\''+$('moradaDescriptionPrincipal'+idEntidade).value+'\');'
      		nomesEntidade[i].innerHTML = '<span style=\"cursor: hand;text-decoration: underline\" href="#" onclick=\"'+onclickFunction+'\"">'+nomesEntidade[i].innerHTML+'</span>'
      	}

	}
	
	if('${popupParams.createNew}' == 'true'){
		$('editEntidadeButton').href+='&createNewEntidade=true';
		$('editEntidadeButton').href+='&newNome=${popupParams.newNome}';
		var regex = new RegExp(' ', 'g');
		$('editEntidadeButton').href+='&newDataNascimento='+'${popupParams.newDataNascimento}'.replace(regex,'-');
		$('editEntidadeButton').href+='&newSexo=${popupParams.newSexo}';
		$('editEntidadeButton').href+='&newNif=${popupParams.newNif}';
		$('editEntidadeButton').href+='&newBi=${popupParams.newBi}';
		$('editEntidadeButton').click();

	}
	
</script>