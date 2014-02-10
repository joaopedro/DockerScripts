<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.entidade.morada.obrigatorio" var="obrigatorio" />
<fmt:message key="ipdms.modules.entidade.pais" var="pais" />
<fmt:message key="ipdms.modules.entidade.predefinido" var="predefinido" />
<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.forms.fechar" var="fechar" />
<fmt:message key="ipdms.modules.entidade.contacto.expandir" var="expandir" />
<fmt:message key="ipdms.modules.entidade.singular.tab.morada" var="moradaDes" />
<fmt:message key="ipdms.modules.entidade.contacto.novo" var="contactoNovo" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.organica.eliminar.aviso" var="avisoMsg" />
<fmt:message key="ipdms.modules.entidade.morada.eliminar.empty" var="emptyMsg" />

<div id="errorMoradaEs">
</div>

<c:choose>
	<c:when test="${not empty entidadeFormBean.moradasEstrangeiras}">
	<div class="row" style="margin-bottom:20px; margin-left:-10px;">
	  <div class="leftTab label" style="width: 90%; " title="${obrigatorio}">
	        <span class="formlabel_obrigatorio">${obrigatorio}</span>
	    </div>
	</div>
	<table cellpadding="0" cellspacing="0" class="centro">
	<tr class="hoverTransparente">
		<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
			<th style="width:3%" class="centro">&nbsp;</th>
		</c:if>
		<th class="centro">${pais}</th>
		<th class="centro" style="width:70%">${moradaDes}</th>
		<th class="centro" style="width:5%">${predefinido}</th>	
		<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
			<th class="centro" style="width:5%">&nbsp;</th>			
		</c:if>
		<th class="centro" style="width:4%">${editar}</th>
		<th class="centro" style="width:5%">${eliminar}</th>
	</tr>
	<c:forEach items="${entidadeFormBean.moradasEstrangeiras}" var="morada" varStatus="i">
	<tr style="height:30px;">
		<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
			<td class="centro">
				<img id="imgshowcontactoEs${i.index}" src="images/icon/icon-mais.png" onclick="showContactoEs('${i.index}');" alt="${expandir}" title="${expandir}" />
				<img id="imghidecontactoEs${i.index}" src="images/icon/icon-menos.png" onclick="hideContactosEs('${i.index}');" style="display: none;" alt="${fechar}" title="${fechar}" />
			</td>
		</c:if>
		<td class="centro">${morada.pais}</td>
		<td class="centro">${morada.morada}</td>
		<c:set var="checked" value="" />
		<c:if test="${morada.principal}"><c:set var="checked" value="checked=checked" /></c:if>
		<td class="alignCenter"><input type="radio" class="radion" onclick="resetMoradaPrincipal(getElementsByName('morada_principal'));" name="moradaes_principal" id="moradaes_principal" value="${i.index}" ${checked} style="border:none"/></td>
		<c:if test="${entidadeFormBean.tipoEntidade eq '2'}">
			<td class="alignCenter">
				<img class="cursorMao" src="images/icon/icon-novoContacto.png" onclick="editContactoEs('${i.index}');" title="${contactoNovo}" alt="${contactoNovo}" />
			</td>	
		</c:if>
		<td class="alignCenter"><img class="cursorMao" src="images/icon/icon-editar.png" onclick="editMoradaEs('${i.index}');" title="${editar}" alt="${editar}" /></td>
		<td class="alignCenter"><INPUT type="checkbox" name="checkMorada" id="index" value="${i.index}" style="border:none;"></INPUT></td>
	</tr>
	<tr id="tr_contactosEs${i.index}" style="display: none;">
		<td class="centro"></td>
		<td colspan="6" class="centro"><div id="contactosEs${i.index}"></div></td>
	</tr>
	<tr id="tr_editContactoEs${i.index}" style="display: none;">
		<td class="centro"></td>
		<td colspan="6" class="centro"><div id="editContactoEs${i.index}"></div></td>
	</tr>
	</c:forEach>
	</table>
	<div id="alignRight">
		<IMG src="images/icon/icon-lixo.png" onclick="removeMoradaEs(getElementsByName('checkMorada'), '${avisoMsg}', '${emptyMsg}');" class="cursorMao" alt="${eliminar} ${moradaDes}" title="${eliminar} ${moradaDes}"/>
	</div>		
	</c:when>
	<c:otherwise>
		<div class="row formlabel_sf" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info"><fmt:message key="ipdms.modules.entidade.semmoradas"/></div></div><div style="clear:both"></div></div></div>
	</c:otherwise>
</c:choose>