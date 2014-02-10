<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.observacoes.lista" var="titulo" />
<fmt:message key="ipdms.observacoes.existentes.data" var="data" />
<fmt:message key="ipdms.etapa.designacaosingular" var="etapaDes" />
<fmt:message key="ipdms.servicoonline.histProcesso.utilizador" var="utilizador" />
<fmt:message key="ipdms.etapa.atributosetapa.atributo" var="atributo" />
<fmt:message key="ipdms.recolha.respostadata.valor" var="valor" />
<fmt:message key="ipdms.observacoes.editarExistentes.dataPreenchimento" var="dataPreenchimento" />
<fmt:message key="ipdms.observacoes.editarExistentes.etapa" var="etapa" />
<fmt:message key="ipdms.observacoes.editarExistentes.tipoComentario" var="tipoComentario" />
<fmt:message key="ipdms.observacoes.novaInfo.Publico" var="publico" />
<fmt:message key="ipdms.observacoes.novaInfo.Privado" var="privado" />
<fmt:message key="ipdms.dimensoes.nivel.alterar" var="alterar" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />
<fmt:message key="ipdms.observacoes.lista.empty" var="listaEmpty" />
<fmt:message key="ipdms.observacoes.clique" var="clique" />
<fmt:message key="ipdms.observacoes.aqui" var="aqui" />
<fmt:message key="ipdms.observacoes.fechar" var="fechar" />

<jsp:include page="/ipdms/layout/ipdmsScriptsThemes.jsp" />

<logic:present name="comentarios">
<logic:notEmpty name="comentarios">

<div class="row" style="text-align:left; padding-top:0px;">
    <table border="0" cellpadding="0" cellspacing="0" class="headings">
        <tbody>
          <tr>
            <td class="titulo1">${titulo}</td>
          </tr>
        </tbody>
    </table>					
</div>

<table width="100%" class="centro" cellpadding="0" cellspacing="0">
<tr class="centro">
	<th class="centro">${data}</th>
	<th class="centro">${etapaDes}</th>
	<th class="centro">${utilizador}</th>
	<th class="centro">${atributo}</th>
	<th class="centro">${valor}</th>
</tr>
<logic:iterate name="comentarios" id="comentario" indexId="indice">
<c:set var="trClass"><c:choose><c:when test="${indice % 2 == 0}">even</c:when><c:otherwise>odd</c:otherwise></c:choose></c:set>
<tr class="${trClass}">
	<td class="centro" nowrap="nowrap">
		<bean:write name="comentario" property="socomentario.dataPreenchimento.time" format="dd-MM-yyyy HH:mm"/>
	</td>
	<td class="centro" nowrap="nowrap">
		<bean:write name="comentario" property="socomentario.nomeEtapa"/>
	</td>
	<td class="centro" nowrap="nowrap">
		<bean:write name="comentario" property="username"/>
	</td>
	<td class="centro">
	 	<bean:write name="comentario" property="socomentario.comentario"/>				 	
	</td>
	<td class="centro" nowrap="nowrap">
		<bean:write name="comentario" property="descricaoTipoComentario"/>
	</td>
</tr>
 	<tr id="comentariofull${indice}" style="display:none">
	<td colspan="4">
		<table>
			<tr>
				<td class="centro">${dataPreenchimento}</td>
				<td class="centro"><bean:write name="comentario" property="socomentario.dataPreenchimento.time" format="dd-MM-yyyy HH:mm"/></td>
			</tr>
			<tr>
				<td class="centro">${etapa}</td>
				<td class="centro"><bean:write name="comentario" property="socomentario.nomeEtapa"/></td>
			</tr>
			<tr id="visualizarTipoComentario${indice}">
				<td class="centro">${tipoComentario}</td>
				<td class="centro"><bean:write name="comentario" property="descricaoTipoComentario"/></td>
			</tr>
			<tr id="editarTipoComentario${indice}" style="display:none">
				<c:set var="checkedPb"><c:if test="${comentario.socomentario.tipo == 3}">checked="checked"</c:if></c:set>
				<c:set var="checkedPr"><c:if test="${comentario.socomentario.tipo == 1}">checked="checked"</c:if></c:set>
				<td class="centro">${tipoComentario}</td>
				<td class="centro">
					<input type="radio" id="tipocomentario${indice}" name="tipocomentario${indice}" value="3" ${checkedPb} />${publico}
					<input type="radio" id="tipocomentario${indice}" name="tipocomentario${indice}" value="1" ${checkedPr} />${privado}			
				</td>
			</tr>			
			<tr>
				<td class="centro">Texto:</td>
				<td>
					<html:textarea name="comentario" property="socomentario.comentario" cols="80" styleId="comentario${indice}" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" title="${alterar}" value="${alterar}" id="alterar${indice}" style="display:none;" class="btForm"  onclick="alterarComentario(${indice});" />
					&nbsp;<input type="button" title="${cancelarTitle}" value="${cancelar}" id="cancelar${indice}" style="display:none" class="btFormEscuro"  onclick="cancelarEditarComentario(${indice});" />
				</td>
			</tr>
		</table>
	</td>
</tr>
	<html:hidden name="comentario" property="socomentario.id" styleId="comentarioid${indice}"/>
</logic:iterate>
</table>
</logic:notEmpty>
<logic:empty name="comentarios"> 

<table width="100%" class="centro">
	<tr><td class="centro" style="text-align:center;">
		${listaEmpty}<br/>
	</td></tr>
</table>

</logic:empty>
</logic:present>

<logic:notPresent name="comentarios">
	<logic:present name="errocomentarios">
		<table width="100%" class="centro">
			<tr><td class="centro" style="text-align:center;"><fmt:message key="${errocomentarios}"/></td></tr>
		</table>
	</logic:present>
</logic:notPresent>

<script type="text/javascript">
	<logic:present name="errorMessageKey">
		alert('<fmt:message key="${errorMessageKey}" />');
	</logic:present>
</script>
<p class="formlabel" style="text-align:center;">${clique} <a href="javascript:close()" style="color: #136796;">${aqui}</a> ${fechar}</p>
