<%@ taglib uri="/tags/html" prefix="html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.dynamicform.field.posicao.coluna" var="x_pos" />
<fmt:message key="ipdms.dynamicform.field.posicao.alignment"
	var="cell_alignment" />
<fmt:message key="ipdms.dynamicform.field.posicao.linha" var="y_pos" />
<fmt:message key="ipdms.dynamicform.field.ordenar" var="ordenar" />
<fmt:message key="ipdms.dynamicform.field.mudarLinha" var="mudarLinha" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.dynamicform.field.editarCampoDinamico"
	var="editarCampoDinamico" />
<fmt:message key="ipdms.dynamicform.field.ordenar.subir" var="subir" />
<fmt:message key="ipdms.dynamicform.field.ordenar.descer" var="descer" />
<fmt:message key="ipdms.dynamicform.field.naoMudarLinha"
	var="naoMudarLinha" />
<fmt:message key="ipdms.dynamicform.field.camposDinamicos"
	var="camposDinamicos" />
<fmt:message key="ipdms.dynamicform.field.eliminarMsg" var="eliminarMsg" />
<fmt:message key="ipdms.dynamicform.field.criarNovoCampo"
	var="criarNovoCampo" />
<fmt:message key="ipdms.dynamicform.field.editarValidadores"
	var="editarValidadores" />
<fmt:message key="ipdms.dynamicform.field.editarGrupos"
	var="editarGrupos" />
<fmt:message key="ipdms.dynamicform.field.resumo" var="resumo" />
<fmt:message key="ipdms.dynamicform.field.preView" var="preView" />
<fmt:message key="ipdms.dynamicform.field.criacaoFormularioDinamico"
	var="criacaoFormularioDinamico" />
<fmt:message key="ipdms.dynamicform.field.cancelMsg" var="cancelMsg" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />


<div>
	<table style="border: none;" cellpadding="0" cellspacing="0"
		class="headings">
		<tr>
			<td class="titulo1"><fmt:message
					key="ipdms.dynamicform.form.edit.title" /></td>
		</tr>
	</table>
</div>



<form:form  modelAttribute="define-dynamicform">
	<input type="hidden" name="_flowExecutionKey"
		value="${flowExecutionKey}">
	<input type="hidden" id="indexOfField" name="indexOfField" />

	<html:errors />

	<div class="row" style="padding-bottom: 2%;">
		<div class="leftTab label" style="width: 90%;"
			title="<fmt:message key="ipdms.obrigatorio" />">
			<span class="formlabel_obrigatorio"><fmt:message
					key="ipdms.obrigatorio" /></span>
		</div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;"
			title="<fmt:message key="ipdms.dynamicform.form.externalid" />">
			<label for="externalId"> <fmt:message
					key="ipdms.dynamicform.form.externalid" />
			</label>
		</div>
		<div class="label" style="width: 80%;"
			title="<fmt:message key="ipdms.dynamicform.form.externalid" />">
			<html:text name="dynamicForm" property="form.externalId"
				styleId="externalId" />
		</div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;"
			title="<fmt:message key="ipdms.dynamicform.form.description" />">
			<label for="description"> <fmt:message
					key="ipdms.dynamicform.form.description" /> *
			</label>
		</div>
		<div class="label" style="width: 80%;"
			title="<fmt:message key="ipdms.dynamicform.form.description" />">
			<html:text name="dynamicForm" property="form.description"
				styleId="description" maxlength="255" size="80" />
		</div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;"
			title="<fmt:message key="ipdms.dynamicform.form.title" />">
			<label for="title"> <fmt:message
					key="ipdms.dynamicform.form.title" /> *
			</label>
		</div>
		<div class="label" style="width: 80%;"
			title="<fmt:message key="ipdms.dynamicform.form.title" />">
			<html:text name="dynamicForm" property="form.title" styleId="title"
				maxlength="255" size="80" />
		</div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;"
			title="<fmt:message key="ipdms.dynamicform.form.subtitle" />">
			<label for="subtitle"> <fmt:message
					key="ipdms.dynamicform.form.subtitle" /> *
			</label>
		</div>
		<div class="label" style="width: 80%;"
			title="<fmt:message key="ipdms.dynamicform.form.subtitle" />">
			<html:text name="dynamicForm" property="form.subtitle"
				styleId="subtitle" maxlength="255" size="80" />
		</div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;"
			title="<fmt:message key="ipdms.dynamicform.form.layout" />">
			<label for="layout"> <fmt:message
					key="ipdms.dynamicform.form.layout" /> *
			</label>
		</div>

		<div class="label" style="width: 80%;"
			title="<fmt:message key="ipdms.dynamicform.form.layout" />">
			<select name="_formlayout" style=""
				onchange="webflowAjaxRequestEv(event, '_eventId_layoutChanged');">
				<c:forEach items="${dynamicForm.layouts}" var="layout">
					<option value="${layout.nameResourceKey}"
						<c:if test="${dynamicForm.form.layout.nameResourceKey == layout.nameResourceKey}">selected</c:if>>
						<fmt:message key="${layout.nameResourceKey}" />
					</option>
				</c:forEach>
			</select>
		</div>
	</div>

	<!-- Verificar se é necessario renderizar caixas para o numero de colunas e linhas -->
	<c:if
		test="${dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 17%;"
				title="<fmt:message key="ipdms.dynamicform.form.gridlayout.rows" />">
				<label for="rows"> <fmt:message
						key="ipdms.dynamicform.form.gridlayout.rows" /> *
				</label>
			</div>
			<div class="label" style="width: 80%;"
				title="<fmt:message key="ipdms.dynamicform.form.gridlayout.rows" />">
				<html:text maxlength="2" onkeypress="return isDigit();"
					name="dynamicForm" property="form.layout.numbOfRows" size="5" />
			</div>
		</div>
	</c:if>

	<c:if
		test="${dynamicForm.form.layout.nameResourceKey == 'ipdms.dynamicform.form.gridlayout'}">
		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 17%;"
				title="<fmt:message key="ipdms.dynamicform.form.gridlayout.cols" />">
				<label for="rows"> <fmt:message
						key="ipdms.dynamicform.form.gridlayout.cols" /> *
				</label>
			</div>
			<div class="label" style="width: 80%;"
				title="<fmt:message key="ipdms.dynamicform.form.gridlayout.cols" />">
				<html:text name="dynamicForm" property="form.layout.numbOfCols"
					size="5" maxlength="2" onkeypress="return isDigit();" />
			</div>
		</div>

	</c:if>

	<br />
	<br />
	<br />

	<c:choose>
		<c:when test="${not empty dynamicForm.fields}">
			<table class="centro" width="80%" cellspacing="1">
				<tr class="listHeader">
					<th class="centro" style="width: 3%;">#</th>
					<th class="centro"><fmt:message
							key="ipdms.dynamicform.field.fieldid" /></th>
					<th class="centro"><fmt:message
							key="ipdms.dynamicform.field.externalid" /></th>
					<th class="centro"><fmt:message
							key="ipdms.dynamicform.field.fieldtype" /></th>
					<th class="centro"><fmt:message
							key="ipdms.dynamicform.field.label" /></th>
					<th class="centro" style="width: 4%;">${editar}</th>
					<!-- Header da coluna da ordenação -->
					<c:if
						test="${dynamicForm.form.layout==null || dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.linearlayout'}">
						<th class="centro" style="width: 4%;">${ordenar}</th>
					</c:if>
					<!-- Header da coluna de mudança de linha -->
					<c:if
						test="${dynamicForm.form.layout==null || dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.linearlayout'}">
						<th class="centro" style="width: 6%;">${mudarLinha}</th>
					</c:if>
					<!-- Header da coluna - posicao no eixo dos xx -->
					<c:if
						test="${dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
						<th class="centro" style="width: 4%;">${x_pos}</th>
					</c:if>
					<!-- Header da coluna - posicao no eixo dos yy -->
					<c:if
						test="${dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
						<th class="centro" style="width: 4%;">${y_pos}</th>
					</c:if>
					<!-- Header da coluna - posicao no eixo dos alignment -->
					<c:if
						test="${dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
						<th class="centro" style="width: 4%;">${cell_alignment}</th>
					</c:if>

					<th class="centro" style="width: 3%;">${eliminar}</th>
				</tr>
				
				<logic:iterate name="dynamicForm" property="fields" id="fields"
					indexId="i">
					<nested:root name="fields">
						<tr>
							<td class="centro">${i+1}</td>
							<td class="centro">${fields.siglaId}</td>
							<td class="centro">${fields.externalId}</td>
							<td class="centro">${fields.type}</td>
							<td class="centro">${fields.label}</td>
							<td class="alignCenter" width="4%"><input
								onclick="$('indexOfField').value = '${i}'; webflowAjaxRequest(event);"
								name="_eventId_editField" value="Editar" type="image"
								title="${editarCampoDinamico}" alt="${editarCampoDinamico}"
								src="${pageContext.request.contextPath}/images/icon/icon-editar.png"
								style="border: none;" /></td>
							<c:if
								test="${dynamicForm.layout==null 
								        || dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.linearlayout'}">
								<td class="alignCenter" width="4%"><input
									onclick="$('indexOfField').value = '${i}'; webflowAjaxRequest(event);"
									name="_eventId_upField" value="Subir Campo" type="image"
									title="${subir}" alt="${subir}"
									src="${pageContext.request.contextPath}/images/icon/seta_cima.png"
									style="border: none;" /> <input
									onclick="$('indexOfField').value = '${i}'; webflowAjaxRequest(event);"
									name="_eventId_downField" value="Descer Campo" type="image"
									title="${descer}" alt="${descer}"
									src="${pageContext.request.contextPath}/images/icon/seta_baixo.png"
									style="border: none;" /></td>
							</c:if>
							<%-- 	
						<a href="applicationFlow.do2?_flowExecutionKey=${flowExecutionKey}&_eventId=upField&indexOfField=${i}">Up</a>
						<a href="applicationFlow.do2?_flowExecutionKey=${flowExecutionKey}&_eventId=downField&indexOfField=${i}">Down</a>
						--%>
							<c:if
								test="${dynamicForm.layout==null || dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.linearlayout'}">
								<td class="alignCenter" width="6%"><c:choose>
										<c:when test="${fields.layoutData.changeLine}">
											<c:set var="title" value="${mudarLinha}" />
											<c:set var="iconName" value="icon-enter.png" />
										</c:when>
										<c:otherwise>
											<c:set var="title" value="${naoMudarLinha}" />
											<c:set var="iconName" value="icon-no-enter.png" />
										</c:otherwise>
									</c:choose> <input
									onclick="$('indexOfField').value = '${i}'; webflowAjaxRequest(event);"
									name="_eventId_toggleChangeLine" type="image" title="${title}"
									alt="${title}" style="border: none;"
									src="${pageContext.request.contextPath}/images/icon/${iconName}" />
								</td>
							</c:if>

							<!-- 3 Colunas para quando o layout do form 'e uma grelha -->
							<c:if
								test="${dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
								<td class="alignCenter" width="4%">
									<input
									name="icol_${i}" type="text" value=" ${fields.layoutData.col}"
									onkeypress="return isDigit();"
									onblur="$('indexOfField').value = '${i}'; webflowAjaxRequestEv(event,'_eventId_changeColumn');" />
								</td>
								<td class="alignCenter" width="4%"><input name="irow_${i}"
									type="text" value="${fields.layoutData.row}"
									onkeypress="return isDigit();"
									onblur="  $('indexOfField').value = '${i}'; webflowAjaxRequestEv(event,'_eventId_changeRow');" />
								</td>
								<td class="alignCenter" width="4%"><select
									name="ialignment_${i}" type="text"
									value="${fields.layoutData.alignment}"
									onchange="$('indexOfField').value = '${i}'; webflowAjaxRequestEv(event,'_eventId_changeAlignment');">
										<c:forEach items="${dynamicForm.alignments}" var="al">
											<option value="${al}"
												<c:if test="${fields.layoutData.alignment==al}">selected</c:if>>
												<fmt:message key="${al.resourceKey}" />
											</option>
										</c:forEach>
								</select></td>
							</c:if>

							<td class="alignCenter" width="3%"><c:if
									test="${fields.id == 0 || !dynamicForm.existInstances}">
									<label for="removeRow_${i}"> <input type="checkbox"
										id="removeRow_${i}" name="removeRow_${i}" value="checked"
										class="radion" style="text-align: center; border: none;" />
									</label>
								</c:if></td>
						</tr>
					</nested:root>
				</logic:iterate>
			</table>
			<div id="alignRight">
				<img
					src="${pageContext.request.contextPath}/images/icon/icon-lixo.png"
					onclick="cancelar(event,'${camposDinamicos}','${eliminarMsg}',decisaoEliminar,'${sim}','${nao}');"
					class="cursorMao" alt="${eliminar}" title="${eliminar}" />
			</div>
		</c:when>
		<c:otherwise>
			<div class="row formlabel_sf">
				<div class="mensagenCaixa">
					<div style="float: left; width: 3%;">
						<img
							src="${pageContext.request.contextPath}/images/icon/icon-informacao.png"
							style="vertical-align: middle; padding-left: 10px; padding-right: 4px;"
							alt="${atencao}" title="${atencao}" />
					</div>
					<div
						style="float: right; width: 93%; vertical-align: middle; margin-top: 4px;">
						<div class="info">
							<fmt:message key="ipdms.dynamicform.form.edit.nofieldsmessage" />
						</div>
					</div>
					<div style="clear: both"></div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<br />
	<div class="buttonRow">
		<input type="button" name="_eventId_newfield"
			value="${criarNovoCampo}" class="btForm"
			onclick="webflowAjaxRequest(event);" title="${criarNovoCampo}" /> <input
			type="button" name="_eventId_editvalidators"
			value="${editarValidadores}" class="btForm"
			onclick="webflowAjaxRequest(event);" title="${editarValidadores}" />
		<input type="button" name="_eventId_groupfields"
			value="${editarGrupos}" class="btForm"
			onclick="webflowAjaxRequest(event);" title="${editarGrupos}" /> <input
			type="button" name="_eventId_toresumo" value="${resumo}"
			class="btForm" onclick="webflowAjaxRequest(event);" title="${resumo}" />
		<input type="button" name="_eventId_preview" value="${preView}"
			class="btForm" onclick="webflowAjaxRequest(event);"
			title="${preView}" /> <input type="button" name="_eventId_cancel"
			value="${cancelar}" class="btFormEscuro"
			onclick="cancelar(event,'${criacaoFormularioDinamico}', '${cancelMsg}',decisao,'${sim}','${nao}');"
			title="${cancelarTitle}" />
	</div>
</form:form>

<script>
	decisao = function(btn) {
		if (btn == 'yes') {
			//Full request
			document.location = '${pageContext.request.contextPath}/applicationFlow.do2?_flowExecutionKey=${flowExecutionKey}&_eventId=cancel';
			//extAjaxRequest('applicationFlow.do2', '_flowExecutionKey=${flowExecutionKey}&_eventId=cancel');
		} else {
			return false;
		}
	};

	decisaoEliminar = function(btn) {
		if (btn == 'yes') {
			extAjaxRequest('applicationFlow.do2',
					'_flowExecutionKey=${flowExecutionKey}&_eventId=removeFields&'
							+ Form.serialize(document.forms[0]));
		} else {
			return false;
		}
	};
</script>


