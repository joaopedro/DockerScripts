<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<fmt:message key="ipdms.modules.entidade.morada.obrigatorio" var="obrigatorio" />
<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.forms.fechar" var="fechar" />
<fmt:message key="ipdms.modules.entidade.contacto.expandir" var="expandir" />
<fmt:message key="ipdms.modules.entidade.contacto.novo" var="contactoNovo" />

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
	<table cellpadding="0" cellspacing="0" class="centro">
	<tr>
		<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
			<th class="centro" >&nbsp;</th>
		</c:if>
		<th class="centro" style="width:10%"><fmt:message key="ipdms.modules.entidade.codigopostal" /></th>
		<th class="centro"><fmt:message key="ipdms.modules.entidade.localidade" /></th>
		<th class="centro"><fmt:message key="ipdms.modules.entidade.morada" /></th>
		<th class="centro"><fmt:message key="ipdms.modules.entidade.lote" /></th>
		<th class="centro" style="width:8%"><fmt:message key="ipdms.modules.entidade.predefinido" /></th>
		<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
			<th class="centro" style="width:10%">${contactoNovo}</th>
		</c:if>
		<th class="centro" style="width:5%">${editar}</th>
		<th class="centro" style="width:6%">${eliminar}</th>
	</tr>
	<c:forEach items="${entidadeFormBean.moradas}" var="moradaPT" varStatus="i">
	<tr style="height:30px;">
		<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
			<td class="centro">
				<img id="imgshowcontacto${i.index}" src="images/icon/icon-mais.png" onclick="showContacto('${i.index}');" alt="${expandir}" title="${expandir}" />
				<img id="imghidecontacto${i.index}" src="images/icon/icon-menos.png" onclick="hideContactos('${i.index}');" style="display: none;" alt="${fechar}" title="${fechar}" />
			</td class="centro">
		</c:if>
		<c:choose>
			<c:when test="${moradaPT.outro}">
				<td class="centro">${moradaPT.cp4Outro}-${moradaPT.cp3Outro}</td>
			</c:when>
			<c:otherwise>
				<td class="centro">${moradaPT.cp4}-${moradaPT.cp3}</td>
			</c:otherwise>
		</c:choose>
	<td class="centro">${moradaPT.localidadeDescription}</td>
	<td class="centro">${moradaPT.moradaDescription}</td>
	<td class="centro">${moradaPT.lote}</td>
		<c:set var="checked" value="" />
		<c:if test="${moradaPT.principal}"><c:set var="checked" value="checked=checked" /></c:if>
	<td class="alignCenter"><input type="radio" class="radion" name="morada_principal" onclick="resetMoradaPrincipal(getElementsByName('moradaes_principal'));" id="morada_principal" value="${i.index}" ${checked} style="border:none" /></td>		
	<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
		<td class="alignCenter">
			<img class="cursorMao" src="images/icon/icon-novoContacto.png" onclick="editContacto('${i.index}');" title="${contactoNovo}" alt="${contactoNovo}" />
		</td>
	</c:if>	
	<td class="alignCenter"><img class="cursorMao" src="images/icon/icon-editar.png" onclick="editMorada('${entidade_locale}','${i.index}');" title="${editar}" alt="${editar}" /></td>
	<td class="alignCenter"><INPUT type="checkbox" name="checkMorada" id="index" value="${i.index}" style="border:none;"></INPUT></td>		
	</tr>
	<tr  class="hoverTransparente" id="tr_contactos${i.index}" style="display: none;">
		<td colspan="7"><div id="contactos${i.index}"></div></td>
	</tr>
	<tr  class="hoverTransparente" id="tr_editContacto${i.index}">
		<td colspan="7"><div id="editContacto${i.index}"></div></td>
	</tr>
	</c:forEach>
	
	</table>
	<div id="alignRight">
		<IMG src="images/icon/icon-lixo.png" onclick="mensagem(event,getElementsByName('checkMorada'));" class="cursorMao" alt="${eliminar} ${moradaDes}" title="${eliminar} ${moradaDes}"/>
	</div>
	</c:when>
	
	<c:otherwise>
		<p class="formlabel"><fmt:message key="ipdms.modules.entidade.semmoradas"/></p>
	</c:otherwise>
</c:choose>