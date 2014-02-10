<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.entidade.morada.obrigatorio" var="obrigatorio" />
<fmt:message key="webflow.requerente.contacto" var="contacto" />
<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.forms.fechar" var="fechar" />
<fmt:message key="ipdms.modules.entidade.contacto.expandir" var="expandir" />
<fmt:message key="ipdms.modules.entidade.contacto.novo" var="contactoNovo" />
<fmt:message key="ipdms.modules.entidade.singular.tab.morada" var="morada" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.organica.eliminar.aviso" var="avisoMsg" />
<fmt:message key="ipdms.modules.entidade.morada.eliminar.empty" var="emptyMsg" />

<c:set var="entidade_locale" value="${sessionScope['ipdms.entidade.locale']}" scope="request" />

<div id="errorMorada">
</div>

<c:choose>
	<c:when test="${not empty entidadeFormBean.moradas}">
	<div class="row" style="margin-bottom:20px; margin-left:-10px;">
	  <div class="leftTab label" style="width: 90%; " title="${obrigatorio}">
	        <span class="formlabel_obrigatorio">${obrigatorio}</span>
	  </div>
	</div>
	<table cellspacing="0" cellpadding="0" class="centro" style="width:100%">
	<tr>
		<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
			<th class="centro" >&nbsp;</th>
		</c:if>
		<th class="centro" style="width:20%"><fmt:message key="ipdms.modules.entidade.provincia" /></th>
		<th class="centro" style="width:20%" ><fmt:message key="ipdms.modules.entidade.municipio" /></th>
		<th class="centro" style="width:20%" ><fmt:message key="ipdms.modules.entidade.comuna" /></th>
		<th class="centro" style="width:20%" ><fmt:message key="ipdms.modules.entidade.localidade" /></th>	
		<th class="centro" style="width:5%" ><fmt:message key="ipdms.modules.entidade.domicilio" /></th>
		<th class="centro" style="width:8%" ><fmt:message key="ipdms.modules.entidade.predefinido" /></th>
		<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
			<th class="centro">${contacto}</th>
		</c:if>
		<th class="centro" style="width:5%">${editar}</th>
		<th class="centro" style="width:6%">${eliminar}</th>
	</tr>
	<c:forEach items="${entidadeFormBean.moradas}" var="moradaAO" varStatus="i">
	<tr>
	<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
		<td class="centro">
			<img id="imgshowcontacto${i.index}" src="images/icon/icon-mais.png" onclick="showContacto('${i.index}');" alt="${expandir}" title="${expandir}" />
			<img id="imghidecontacto${i.index}" src="images/icon/icon-menos.png" onclick="hideContactos('${i.index}');" style="display: none;" alt="${fechar}" title="${fechar}" />
		</td>
	</c:if>
	<td class="centro">${moradaAO.descricaoProvincia}</td>
	<td class="centro">${moradaAO.descricaoMunicipio}</td>
	<td class="centro">${moradaAO.descricaoComuna}</td>	
	<td class="centro">${moradaAO.descricaoLocalidade}</td>
	<td class="centro">${moradaAO.domicilio}</td>
	
	<c:set var="checked" value="" />
	<c:if test="${moradaAO.principal}"><c:set var="checked" value="checked=checked" /></c:if>
		<td class="alignCenter"><input type="radio" class="radion" name="morada_principal" onclick="resetMoradaPrincipal(getElementsByName('moradaes_principal'));" id="morada_principal" value="${i.index}" ${checked} style="border:none" /></td>		
	<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
		<td style="width:5%" class="alignCenter">
			<img class="cursorMao" src="images/icon/icon-novoContacto.png" onclick="editContacto('${i.index}');" title="${contactoNovo}" alt="${contactoNovo}" />
		</td>
	</c:if>
	<td style="width:5%" class="alignCenter"><img class="cursorMao" src="images/icon/icon-editar.png" onclick="editMorada('${entidade_locale}','${i.index}');" title="${editar}" alt="${editar}" /></td>	
	<td class="alignCenter"><INPUT type="checkbox" style="border:none;" name="checkMorada" id="index" value="${i.index}"></INPUT></td>		
	</tr>
	<tr id="tr_contactos${i.index}" style="display: none;">
		<td class="centro" colspan="10"><div id="contactos${i.index}"></div></td>
	</tr>
	<tr id="tr_editContacto${i.index}" class="hoverTransparente">
		<td class="centro" colspan="10"><div id="editContacto${i.index}"></div></td>
	</tr>
	</c:forEach>
	</table>
	<div id="alignRight">
		<IMG src="images/icon/icon-lixo.png" onclick="removeMorada(getElementsByName('checkMorada'), '${entidade_locale}', '${avisoMsg}', '${emptyMsg}');" class="cursorMao" alt="${eliminar} ${morada}" title="${eliminar} ${morada}"/>
	</div>			
	</c:when>
	
	<c:otherwise>
		<div class="row formlabel_sf" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info"><fmt:message key="ipdms.modules.entidade.semmoradas"/></div></div><div style="clear:both"></div></div></div>
	</c:otherwise>
</c:choose>