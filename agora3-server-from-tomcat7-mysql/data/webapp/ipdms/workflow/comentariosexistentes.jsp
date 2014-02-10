<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<logic:present name="comentarios">

<logic:notEmpty name="comentarios">

<fieldset style="margin-left:0px; width:97%;">
<legend><fmt:message key='ipdms.observacoes.informacaoAdicional'/>:&nbsp;</legend>

<div id="alignRight" style="margin-bottom:10px; width:99%">
	<a class="formlabel" target="_blank" href="<%= request.getContextPath() %>/comentarioCRUD.do2?method=readAll&nid=${param.nid}"><fmt:message key='ipdms.observacoes.existentes.verTodas'/> (${fn:length(comentarios)})</a>
</div>

<fmt:message key='ipdms.observacoes.remover.confirma' var='removerConfirma'/>
<fmt:message key='ipdms.observacoes.editar.confirma' var='editarConfirma'/>

<table cellpadding="0" cellspacing="0" class="centro" style="width:100%">
	<tr>
		<th class="centro" width="5%">&nbsp;</th>
		<th class="centro"><fmt:message key='ipdms.observacoes.existentes.data'/></td>
		<th class="centro"><fmt:message key='ipdms.observacoes.existentes.nomeEtapa'/></th>
		<th class="centro"><fmt:message key='ipdms.observacoes.existentes.utilizador'/></th>
		<th class="centro"><fmt:message key='ipdms.observacoes.existentes.comentario'/></th>		
		<th class="centro" style="width:6%"><fmt:message key='ipdms.observacoes.existentes.editar'/></th>
		<th class="centro" style="width:6%"><fmt:message key='ipdms.observacoes.existentes.eliminar'/></th>
	</tr>
<logic:iterate name="comentarios" id="comentario" indexId="indice">
<c:set var="color"><c:choose><c:when test="${indice % 2 == 0}">#B1CCE1</c:when><c:otherwise>#D1E8F4</c:otherwise></c:choose></c:set>
	<tr>
		<td class="alignCenter">
			<a name="vermais${indice}" id="vermais${indice}" onclick="verMais(${indice});">
				<img src="images/icon/icon-mais.png" alt="<fmt:message key='ipdms.observacoes.existentes.verMais'/>" title="<fmt:message key='ipdms.observacoes.existentes.verMais'/>" class="cursorMao" />
			</a>
			<a name="vermenos${indice}" id="vermenos${indice}" onclick="verMenos(${indice});" style="display:none">
				<img src="images/icon/icon-menos.png" alt="<fmt:message key='ipdms.observacoes.existentes.fechar'/>" title="<fmt:message key='ipdms.observacoes.existentes.fechar'/>" class="cursorMao" />
			</a>	
		</td>
		<td class="centro" style="text-align:left;">
			<fmt:formatDate value="${comentario.socomentario.dataPreenchimento.time}" pattern="dd-MM-yyyy"/>
		</td>
		<td class="centro" style="text-align:left;">
			<bean:write name="comentario" property="socomentario.nomeEtapa"/>
		</td>
		<td class="centro" style="text-align:left;">
			<bean:write name="comentario" property="username"/>
		</td>
		<td class="centro" style="text-align:left;">
		 	<bean:write name="comentario" property="comentarioShort"/>				 	
		</td>
		<td nowrap="nowrap" class="alignCenter">
		<c:if test="${canPerform}">
			<logic:equal name="comentario" property="editable" value="true">
				<a name="editar${indice}" id="editar${indice}" onclick="editarComentario(${indice});">
					<img src="images/icon/icon-editar.png" alt="<fmt:message key='ipdms.observacoes.existentes.editar'/>" title="<fmt:message key='ipdms.observacoes.existentes.editar'/>" class="cursorMao" />
				</a>
			</logic:equal>
		</c:if>			
		</td>
		<td nowrap="nowrap" class="alignCenter">
			<c:if test="${canPerform}">
				<logic:equal name="comentario" property="removable" value="true">
					<a name="remover${indice}" id="remover${indice}" onclick="removerComentario(${indice},'${removerConfirma}');">
						<img src="images/icon/icon-lixo.png" alt="<fmt:message key='ipdms.observacoes.existentes.eliminar'/>" title="<fmt:message key='ipdms.observacoes.existentes.eliminar'/>" class="cursorMao"  />
					</a>
				</logic:equal>
			</c:if>			
			</td>
		</tr>
 	<tr id="comentariofull${indice}" style="display:none" class="hoverTransparente">
 		<td>&nbsp;</td>
	<td colspan="5">

		<table class="centroInner">
			<tr class="hoverTransparente">
				<td class="centro"><fmt:message key='ipdms.observacoes.editarExistentes.dataPreenchimento'/></td>
				<td class="centro"><bean:write name="comentario" property="socomentario.dataPreenchimento.time" format="dd-MM-yyyy HH:mm"/></td>
			</tr>
			<tr class="hoverTransparente">
				<td class="centro"><fmt:message key='ipdms.observacoes.editarExistentes.etapa'/></td>
				<td class="centro"><bean:write name="comentario" property="socomentario.nomeEtapa"/></td>
			</tr>
			<tr id="visualizarTipoComentario${indice}" class="hoverTransparente">
				<td class="centro"><fmt:message key='ipdms.observacoes.editarExistentes.tipo'/></td>
				<td class="centro"><bean:write name="comentario" property="descricaoTipoComentario"/></td>
			</tr>
			<tr id="editarTipoComentario${indice}" style="display:none" class="hoverTransparente"> 
				<c:set var="checkedPb"><c:if test="${comentario.socomentario.tipo == 3}">checked="checked"</c:if></c:set>
				<c:set var="checkedPr"><c:if test="${comentario.socomentario.tipo == 1}">checked="checked"</c:if></c:set>
				<td class="centro" ><fmt:message key='ipdms.observacoes.editarExistentes.tipoComentario'/></td>
				<td class="centro">
					<input type="radio" id="tipocomentario${indice}" name="tipocomentario${indice}" value="3" ${checkedPb}><fmt:message key='ipdms.observacoes.novaInfo.Publico'/></input>
					<input type="radio" id="tipocomentario${indice}" name="tipocomentario${indice}" value="1" ${checkedPr}><fmt:message key='ipdms.observacoes.novaInfo.Privado'/></input>
				</td>
			</tr>			
			<tr class="hoverTransparente" style="vertical-align: top">
				<td class="centro"><label for="comentario"><fmt:message key='ipdms.observacoes.editarExistentes.texto'/></label></td>
				<td class="centro">
					<html:textarea name="comentario" property="socomentario.comentario" cols="80" rows="3" styleId="comentario${indice}" readonly="true"/>
				</td>
			</tr>
			<tr class="hoverTransparente">
				<td style="width:100%" colspan="2">
					<input type="button" title="<fmt:message key='ipdms.forms.submit'/>" value="<fmt:message key='ipdms.forms.submit'/>" id="alterar${indice}" style="display:none" class="btForm"  onclick="alterarComentario(${indice},'${editarConfirma}');" />
					&nbsp;
					<input type="button" title="<fmt:message key='ipdms.forms.cancelar'/>" value="<fmt:message key='ipdms.forms.cancelar'/>" id="cancelar${indice}" style="display:none" class="btFormEscuro"  onclick="cancelarEditarComentario(${indice});" />
				</td>
			</tr>
		</table>
	</td>
</tr>
	<html:hidden name="comentario" property="socomentario.id" styleId="comentarioid${indice}"/>
</logic:iterate>
</table>

</fieldset>

</logic:notEmpty>
</logic:present>

<logic:notPresent name="comentarios">
	<logic:present name="errocomentarios">
	<table width="100%">
		<tr><td class="formfield" style="text-align:center;"><bean:message key="${errocomentarios}"/></td></tr>
	</table>
	</logic:present>
</logic:notPresent>

<script type="text/javascript">
	<logic:present name="commentCreation">
		limpaNovoComentario();
	</logic:present>
	<logic:present name="errorMessageKey">
		alert('<bean:message key="${errorMessageKey}" />');
	</logic:present>
</script>
