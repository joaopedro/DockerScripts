<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<div class="barraTitulo">
	<div class="textoTitulo"><fmt:message key="guichetelectronico.registo.titulo" bundle="${guichetBundle}"/></div>
</div>

<script>
 function showHideEntidade(entidade) {
	if(entidade == 'true') {
		document.getElementById("dadosEntidade").style.visibility = 'visible';
		document.getElementById("dadosEntidade").style.display = 'block';
	}
	else { 
		document.getElementById("dadosEntidade").style.visibility = 'hidden';
		document.getElementById("dadosEntidade").style.display = 'none';
	}	
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
			
<div id="areaCentral">

<html:form action="/publico/register" styleClass="form" enctype="multipart/form-data">
	<html:hidden property="method" styleId="method" value="save"/>
	<html:hidden property="urlAnterior" value="/guichetelectronico/publico/register.do2"/>

	<div id="registoErrorDiv">
		<html:errors bundle="guichetbundle"/>
	</div>

	<div class="barraSubTitulo">
		<div class="textoSubTitulo"><fmt:message key="guichetelectronico.registo.editardados" bundle="${guichetBundle}"/></div>				
	</div>
	<div class="row" style="padding-bottom:20px;">
		<div class="label" style="width: 90%; " title="<fmt:message key='guichetelectronico.obrigatorio' bundle='${guichetBundle}'/>">
	  		<span class="formlabel_obrigatorio"><fmt:message key="guichetelectronico.obrigatorio" bundle="${guichetBundle}"/></span>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="label" style="width: 10%; " title="<fmt:message key='guichetelectronico.registo.singular' bundle='${guichetBundle}'/>">
			  <label for="singular">
				  <html:radio property="tipoEntidade" styleId="singular" value="S" styleClass="radioCheck" onclick="showHideEntidade('false');"/>
				  <fmt:message key="guichetelectronico.registo.singular" bundle="${guichetBundle}"/>
			  </label>
		</div>

		<div class="label" style="width: 87%;" title="<fmt:message key='guichetelectronico.registo.colectivo' bundle='${guichetBundle}'/>">
			  <label for="colectivo">
				  <html:radio property="tipoEntidade" styleId="colectivo" value="C" styleClass="radioCheck" onclick="showHideEntidade('true');"/>
				  <fmt:message key="guichetelectronico.registo.colectivo" bundle="${guichetBundle}"/>
			  </label>
		</div>
	</div>
	<div style="clear:both"></div>
			
	<div id="dadosEntidade" style="visibility:hidden; display: none;">
		<div class="barraSubTitulo">
			<div class="textoSubTitulo"><fmt:message key="guichetelectronico.registo.entidade.titulo" bundle="${guichetBundle}"/></div>
		</div>
		<div class="row formlabel_sf" >
			<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.entidade.designacaosocial' bundle='${guichetBundle}'/>">
				<label for="designacaoEntidade"><fmt:message key="guichetelectronico.registo.entidade.designacaosocial" bundle="${guichetBundle}"/> *</label>
			</div>

			<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.registo.entidade.designacaosocial' bundle='${guichetBundle}'/>">					
				<html:text property="designacaoEntidade" styleId="designacaoEntidade" style="width:80%"/>					
			</div>
		</div>
		
		<div class="row formlabel_sf" >
			<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.entidade.numfiscal' bundle='${guichetBundle}'/>">
				<label for="nifEntidade"><fmt:message key="guichetelectronico.registo.entidade.numfiscal" bundle="${guichetBundle}"/> *</label>
			</div>

			<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.registo.entidade.numfiscal' bundle='${guichetBundle}'/>">					
				<html:text property="nifEntidade" styleId="nifEntidade" maxlength="9" style="width:80%"/>					
			</div>
		</div>
	</div>
	
	<div style="clear:both"></div>
			
	<div class="barraSubTitulo">
		<div class="textoSubTitulo"><fmt:message key="guichetelectronico.registo.dadospessoais" bundle="${guichetBundle}"/></div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.nome' bundle='${guichetBundle}'/> | <fmt:message key='guichetelectronico.registo.designacao' bundle='${guichetBundle}'/>">
			<label for="nome"><fmt:message key="guichetelectronico.registo.nome" bundle="${guichetBundle}"/><span class="barraSeparador">&nbsp;</span><fmt:message key="guichetelectronico.registo.designacao" bundle="${guichetBundle}"/> *</label>
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.registo.nome' bundle='${guichetBundle}'/> | <fmt:message key='guichetelectronico.registo.designacao' bundle='${guichetBundle}'/>">					
				<html:text property="nome" styleId="nome" style="width:80%"/>					
		</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.nif' bundle='${guichetBundle}'/>">
			<label for="nif"><fmt:message key="guichetelectronico.registo.nif" bundle="${guichetBundle}"/> *</label>
		</div>

		<div class="label" style="width: 24%;" title="<fmt:message key='guichetelectronico.registo.nif' bundle='${guichetBundle}'/>">
				<html:text property="nif" styleId="nif" maxlength="9" size="20" />																
		</div>
		<div class="label" style="width: 10%; " title="<fmt:message key='guichetelectronico.registo.bi' bundle='${guichetBundle}'/>">
			<label for="bi"><fmt:message key="guichetelectronico.registo.bi" bundle="${guichetBundle}"/> *</label>
		</div>

		<div class="label" style="width: 20%;" title="<fmt:message key='guichetelectronico.registo.bi' bundle='${guichetBundle}'/>">					
				<html:text property="bi" styleId="bi" maxlength="9" size="20" />					
		</div>
	</div>
			
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.morada' bundle='${guichetBundle}'/>">
			<label for="morada"><fmt:message key="guichetelectronico.registo.morada" bundle="${guichetBundle}"/> *</label>
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.registo.morada' bundle='${guichetBundle}'/>">					
				<html:text property="morada" styleId="morada" style="width:80%"/>					
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.localidade' bundle='${guichetBundle}'/>">
			<label for="localidade"><fmt:message key="guichetelectronico.registo.localidade" bundle="${guichetBundle}"/> *</label>
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.registo.localidade' bundle='${guichetBundle}'/>">					
				<html:text property="localidade" styleId="localidade" style="width:80%"/>					
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.codpostal' bundle='${guichetBundle}'/>">
			<label for="codPostal1"><fmt:message key="guichetelectronico.registo.codpostal" bundle="${guichetBundle}"/> *</label>
		</div>

		<div class="label" style="width: 13%;" title="<fmt:message key='guichetelectronico.registo.codpostal' bundle='${guichetBundle}'/>">					
				<label for="codPostal1"><html:text property="codPostal1" styleId="codPostal1" maxlength="4" style="width:40%"/></label>
				-
				<label for="codPostal2"><html:text property="codPostal2" styleId="codPostal2" maxlength="3" style="width:30%"/></label>
		</div>

		<div class="label" style="width: 54%;" title="<fmt:message key='guichetelectronico.registo.codpostal' bundle='${guichetBundle}'/>">
				<label for="codPostal3"><html:text property="codPostal3" styleId="codPostal3" style="width:90%"/></label>
		</div>
	</div>
			
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.telefone' bundle='${guichetBundle}'/>">
			<label for="telefone"><fmt:message key="guichetelectronico.registo.telefone" bundle="${guichetBundle}"/></label>
		</div>

		<div class="label" style="width: 24%;" title="<fmt:message key='guichetelectronico.registo.telefone' bundle='${guichetBundle}'/>">					
				<html:text property="telefone" styleId="telefone" maxlength="9" size="20"/>					
		</div>
		<div class="label" style="width: 10%; " title="<fmt:message key='guichetelectronico.registo.telemovel' bundle='${guichetBundle}'/>">
			<label for="telemovel"><fmt:message key="guichetelectronico.registo.telemovel" bundle="${guichetBundle}"/></label>
		</div>

		<div class="label" style="width: 20%;" title="<fmt:message key='guichetelectronico.registo.telemovel' bundle='${guichetBundle}'/>">					
				<html:text property="telemovel" styleId="telemovel" maxlength="9" size="20"/>					
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.email' bundle='${guichetBundle}'/>">
			<label for="email"><fmt:message key="guichetelectronico.registo.email" bundle="${guichetBundle}"/> *</label>
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.registo.email' bundle='${guichetBundle}'/>">					
				<html:text property="email" styleId="email" maxlength="50" size="40" style="width:80%"/>					
		</div>
	</div>
			
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.dataNasc' bundle='${guichetBundle}'/>">
			<label for="dataNasc"><fmt:message key="guichetelectronico.registo.dataNasc" bundle="${guichetBundle}"/></label>
		</div>

		<div class="label" style="width: 13%;" title="<fmt:message key='guichetelectronico.registo.dataNasc' bundle='${guichetBundle}'/>">					
				<html:text property="dataNasc" style="width:84%" styleId="dataNasc" styleClass="date"/>					
		</div>

			<div class="label" style="width: 54%;" title="<fmt:message key='guichetelectronico.registo.dataNasc' bundle='${guichetBundle}'/>">
				<img id="dataNascimentoButton" src="${pageContext.request.contextPath}/images/guichet/icons/icon-calendario.png" class="cursorMao" alt="<fmt:message key='guichetelectronico.registo.dataNasc' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.registo.dataNasc' bundle='${guichetBundle}'/>"/>
				<script type='text/javascript'>
               	Calendar.setup({ inputField : 'dataNasc', ifFormat : '%d-%m-%Y', showsTime : false });
               	Calendar.setup({ inputField : 'dataNasc', ifFormat : '%d-%m-%Y', button : "dataNascimentoButton" });
			</script>
			</div>
	</div>
	<div style="clear:both"></div>

	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.contacto' bundle='${guichetBundle}'/>">
			<fmt:message key="guichetelectronico.registo.contacto" bundle="${guichetBundle}"/>
		</div>

		<div class="label" style="width: 13%;" title="<fmt:message key='guichetelectronico.registo.email' bundle='${guichetBundle}'/>">
			 <label for="emailRadio">
				  <html:radio property="contacto" styleId="emailRadio" value="E" styleClass="radioCheck" />
				  <fmt:message key="guichetelectronico.registo.email" bundle="${guichetBundle}"/>
			  </label>
		</div>

			<div class="label" style="width: 54%;" title="<fmt:message key='guichetelectronico.registo.telefone' bundle='${guichetBundle}'/>">
				<label for="telefone">
				  <html:radio property="contacto" styleId="emailRadio" value="T" styleClass="radioCheck" />
				  <fmt:message key="guichetelectronico.registo.telefone" bundle="${guichetBundle}"/>
			  </label>
			</div>
	</div>
	<div style="clear:both"></div>
	
	<br />
	<div class="barraSubTitulo">
		<div class="textoSubTitulo"><fmt:message key="guichetelectronico.registo.autenticacao" bundle="${guichetBundle}"/></div>
	</div>
			
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.pergunta' bundle='${guichetBundle}'/>">
			<label for="pergunta"><fmt:message key="guichetelectronico.registo.pergunta" bundle="${guichetBundle}"/> *</label>
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.registo.pergunta' bundle='${guichetBundle}'/>">					
			<html:select property="pergunta" styleId="pergunta" style="width:80%;">
			<nested:iterate name="registoFormBean" property="listaPerguntas" id="perguntas" indexId="index">
				<nested:root name="perguntas">
					<html:option value="${index}">${perguntas.pergunta}</html:option>
				</nested:root>
			 </nested:iterate>
			</html:select>					
		</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.resposta' bundle='${guichetBundle}'/>">
			<label for="resposta"><fmt:message key="guichetelectronico.registo.resposta" bundle="${guichetBundle}"/> *</label>
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.registo.resposta' bundle='${guichetBundle}'/>">					
				<html:text property="resposta" styleId="resposta" style="width:79%"/>					
		</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.password' bundle='${guichetBundle}'/>">
			<label for="password"><fmt:message key="guichetelectronico.registo.password" bundle="${guichetBundle}"/> * </label>
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.registo.password' bundle='${guichetBundle}'/>">					
				<html:password property="password" styleId="password"/>						
		</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.registo.confirmacao' bundle='${guichetBundle}'/>">
			<label for="confirmação"><fmt:message key="guichetelectronico.registo.confirmacao" bundle="${guichetBundle}"/> * </label>	
		</div>

		<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.registo.confirmacao' bundle='${guichetBundle}'/>">					
				<html:password property="confirmacao" styleId="confirmacao"/>					
		</div>
	</div>
	
	<div style="clear:both"></div>
	<br />
			
	<div class="barraSubTitulo">
		<div class="textoSubTitulo"><fmt:message key="guichetelectronico.registo.anexos.separador" bundle="${guichetBundle}"/></div>
	</div>
		
	<%-- 	
	<c:if test="${fn:length(registoFormBean.anexos) > 0 }">			
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%;" title="Anexos">
			<label for="anexos"><fmt:message key="guichetelectronico.registo.anexos.existentes" bundle="${guichetBundle}"/></label>
		</div>
		
		<div class="label" style="width: 80%;" title="Anexos Existentes">
				<table border="0" cellpadding="0" cellspacing="0" class="centro" style="width:500px;">
					<tr>
						<th width="175" class="centro" style="text-align: left;"><fmt:message key="guichetelectronico.registo.anexos.descricao" bundle="${guichetBundle}"/></th>
						<th width="210" class="centro"><fmt:message key="guichetelectronico.registo.anexos.ficheiro" bundle="${guichetBundle}"/></th>
						<th width="15" class="centro"><img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" alt="Eliminar" title="Eliminar" /></th>
					</tr>
					<nested:iterate name="registoFormBean" property="anexos" id="anexos">
					<nested:root name="anexos">
						<c:choose>
						<c:when test="${anexos.anexoExistente != null}">
							<tr>
								<td class="centro"><nested:write property="descricaoAnexo" /></td>
								<td class="centro" style="text-align:center;">
									<nested:write property="anexoExistente.nomeDoc"/><nested:write property="anexoExistente.extensao" />
								</td>
								<td class="centro"><nested:checkbox property="apagar" indexed="true" /></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td class="centro"><nested:write property="descricaoAnexo" /></td>
								<td class="alignCenter">
									<nested:write property="fileName"/>
								</td>
								<td class="centro">&nbsp;</td>
							</tr>
						</c:otherwise>
						</c:choose>
					</nested:root>
					</nested:iterate>
				</table>
		<br />
		</div>
	</div>	
	</c:if>
	--%>
			
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='guichetelectronico.registo.anexos.titulo' bundle='${guichetBundle}'/>">
			<label for="anexos"><fmt:message key="guichetelectronico.registo.anexos.titulo" bundle="${guichetBundle}"/></label>
		</div>	
		<div class="label" style="width: 80%;" title="<fmt:message key='guichetelectronico.registo.anexos.titulo' bundle='${guichetBundle}'/>">
			<table border="0" cellpadding="0" cellspacing="1" class="centro" style="width:500px;" id="anexoTable" summary="Anexos">
				<tbody>
				<tr>
					<th style="width:50%" class="centro"><fmt:message key="guichetelectronico.registo.anexos.nome" bundle="${guichetBundle}"/></th>
					<th style="width:50%" class="centro"><fmt:message key="guichetelectronico.registo.anexos.ficheiro" bundle="${guichetBundle}"/></th>
				</tr>
				
				<nested:iterate property="anexos" id="anexos" indexId="i">
					<nested:root name="anexos">
					<tr class="hoverTransparente">
						<td><nested:text property="description" size="30" maxlength="30" indexed="true" /></td>
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
		<div class="leftTab label" style="width: 17%; " title="Registo">
		</div>
		<div class="label" style="width: 80%;" title="<fmt:message key='guichetelectronico.forms.adicionar' bundle='${guichetBundle}'/>">
			<input type="button" class="btForm" value="<fmt:message key='guichetelectronico.forms.adicionar' bundle='${guichetBundle}'/> +" id="adicionarMais" onclick="$('method').value = 'addAnexo'; this.form.submit();"/>
		</div>
	</div>
	<div style="clear:both"></div>
	
	<div class="buttonRow">
		<input type="submit" class="btForm" value="<fmt:message key='guichetelectronico.forms.submit' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.submit.title' bundle='${guichetBundle}'/>" id="submeter">
		<input class="btFormEscuro" type="button" value="<fmt:message key='guichetelectronico.forms.cancelar' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.cancelar.title' bundle='${guichetBundle}'/>" onclick="setActionAndSubmit(this.form,'${pageContext.request.contextPath}/guichetelectronico/publico/homepage.do2');"/>
	</div>

</html:form>
</div>