<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="barraTitulo">
	<div class="textoTitulo"><fmt:message key="guichetelectronico.editdados.titulo" bundle="${guichetBundle}"/></div>
</div>
			
<div id="areaCentral">

<html:form action="/secure/savedadospessoais" method="post">
<!-- form action="/registar" method="post"-->
<nested:root name="${formBeanName}">
<html:hidden property="urlAnterior" value="/guichetelectronico/publico/editdadospessoais.do2"/>
<html:hidden property="isEdicao" value="true"/>
<html:hidden property="tipoEntidade"/>

<div id="registoErrorDiv">
	<html:errors bundle="guichetbundle" /><br />
</div>

<div class="barraSubTitulo">
				<h2><fmt:message key="guichetelectronico.editdados.subtitulo" bundle="${guichetBundle}"/></h2>				
			</div>
			<div class="row" style="padding-bottom:20px;">
				<div class="label" style="width: 90%; " title="<fmt:message key='guichetelectronico.obrigatorio' bundle='${guichetBundle}'/>">
			  		<span class="formlabel_obrigatorio"><fmt:message key="guichetelectronico.obrigatorio" bundle="${guichetBundle}"/></span>
			  	</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="label" style="width: 10%; " title="<fmt:message key='guichetelectronico.editdados.singular' bundle='${guichetBundle}'/>">
					  <label for="singular">
						  <html:radio property="tipoEntidade" styleId="singular" value="S" styleClass="radioCheck" disabled="true"/>
						  <fmt:message key="guichetelectronico.editdados.singular" bundle="${guichetBundle}"/>
					  </label>
				</div>
	
				<div class="label" style="width: 87%;" title="<fmt:message key='guichetelectronico.editdados.colectivo' bundle='${guichetBundle}'/>">
					  <label for="colectivo">
						  <html:radio property="tipoEntidade" styleId="colectivo" value="C" styleClass="radioCheck" disabled="true"/>
						  <fmt:message key="guichetelectronico.editdados.colectivo" bundle="${guichetBundle}"/>
					  </label>
				</div>
			</div>
			
			<c:if test="${dadosPessoaisGuichetFormBean.tipoEntidade == 'C'}">
			<div style="clear:both"></div>
			
			<div id="dadosEntidade">	
				<div class="barraSubTitulo">
					<div class="textoSubTitulo"><fmt:message key="guichetelectronico.editdados.entidade" bundle="${guichetBundle}"/></div>
				</div>
				<div class="row formlabel_sf" >
					<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.designacaoEntidade' bundle='${guichetBundle}'/>">
						<label for="designacaoEntidade"><fmt:message key="guichetelectronico.editdados.designacaoEntidade" bundle="${guichetBundle}"/> *</label>
					</div>

					<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.editdados.designacaoEntidade' bundle='${guichetBundle}'/>">
						<nested:write property="designacaoEntidade"/>			
					</div>
				</div>
				
				<div class="row formlabel_sf" >
					<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.nifEntidade' bundle='${guichetBundle}'/>">
						<label for="nifEntidade"><fmt:message key="guichetelectronico.editdados.nifEntidade" bundle="${guichetBundle}"/> *</label>
					</div>

					<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.editdados.nifEntidade' bundle='${guichetBundle}'/>">
						<nested:write property="nifEntidade"/>										
					</div>
				</div>
			</div>
			</c:if>
			
			<div style="clear:both"></div>
			
			<div class="barraSubTitulo">
				<div class="textoSubTitulo"><fmt:message key="guichetelectronico.editdados.dadosPessoais" bundle="${guichetBundle}"/></div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.nome' bundle='${guichetBundle}'/> | <fmt:message key='guichetelectronico.editdados.designacao' bundle='${guichetBundle}'/>">
					<fmt:message key="guichetelectronico.editdados.nome" bundle="${guichetBundle}"/><span class="barraSeparador">&nbsp;</span><fmt:message key="guichetelectronico.editdados.designacao" bundle="${guichetBundle}"/>:
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.editdados.nome' bundle='${guichetBundle}'/> | <fmt:message key='guichetelectronico.editdados.designacao' bundle='${guichetBundle}'/>">					
						<nested:write property="nome"/>
				</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.nif' bundle='${guichetBundle}'/>">
					<fmt:message key="guichetelectronico.editdados.nif" bundle="${guichetBundle}"/>:
				</div>

				<div class="label" style="width: 24%;" title="<fmt:message key='guichetelectronico.editdados.nif' bundle='${guichetBundle}'/>">
					<nested:write property="nif"/>																	
				</div>
				<div class="label" style="width: 10%; " title="<fmt:message key='guichetelectronico.editdados.bi' bundle='${guichetBundle}'/>">
					<label for="bi"><fmt:message key="guichetelectronico.editdados.bi" bundle="${guichetBundle}"/> </label>
				</div>

				<div class="label" style="width: 20%;" title="<fmt:message key='guichetelectronico.editdados.bi' bundle='${guichetBundle}'/>">
					<nested:write property="bi"/>										
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.morada' bundle='${guichetBundle}'/>">
					<label for="morada"><fmt:message key="guichetelectronico.editdados.morada" bundle="${guichetBundle}"/> *</label>
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.editdados.morada' bundle='${guichetBundle}'/>">					
						<html:text property="morada" styleId="morada" maxlength="50" style="width:80%"/>					
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.localidade' bundle='${guichetBundle}'/>">
					<label for="localidade"><fmt:message key="guichetelectronico.editdados.localidade" bundle="${guichetBundle}"/> *</label>
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.editdados.localidade' bundle='${guichetBundle}'/>">					
						<html:text property="localidade" styleId="localidade" maxlength="50" style="width:80%"/>					
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.codpostal' bundle='${guichetBundle}'/>">
					<label for="codPostal1"><fmt:message key="guichetelectronico.editdados.codpostal" bundle="${guichetBundle}"/> *</label>
				</div>

				<div class="label" style="width: 13%;" title="<fmt:message key='guichetelectronico.editdados.codpostal' bundle='${guichetBundle}'/>">					
						<label for="codPostal1"><html:text property="codPostal1" maxlength="4" styleId="codPostal1" style="width:40%"/></label>
						-
						<label for="codPostal2"><html:text property="codPostal2" maxlength="3" styleId="codPostal2" style="width:30%"/></label>
				</div>

				<div class="label" style="width: 54%;" title="<fmt:message key='guichetelectronico.editdados.codpostal' bundle='${guichetBundle}'/>">
						<label for="codPostal3"><html:text property="codPostal3" maxlength="50" styleId="codPostal3" style="width:90%"/></label>
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.telefone' bundle='${guichetBundle}'/>">
					<label for="telefone"><fmt:message key="guichetelectronico.editdados.telefone" bundle="${guichetBundle}"/></label>
				</div>

				<div class="label" style="width: 24%;" title="<fmt:message key='guichetelectronico.editdados.telefone' bundle='${guichetBundle}'/>">					
						<html:text property="telefone" styleId="telefone" maxlength="9" size="20"/>					
				</div>
				<div class="label" style="width: 10%; " title="<fmt:message key='guichetelectronico.editdados.telemovel' bundle='${guichetBundle}'/>">
					<label for="telemovel"><fmt:message key="guichetelectronico.editdados.telemovel" bundle="${guichetBundle}"/></label>
				</div>

				<div class="label" style="width: 20%;" title="<fmt:message key='guichetelectronico.editdados.telemovel' bundle='${guichetBundle}'/>">					
						<html:text property="telemovel" styleId="telemovel" maxlength="9" size="20"/>					
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.email' bundle='${guichetBundle}'/>">
					<label for="email"><fmt:message key="guichetelectronico.editdados.email" bundle="${guichetBundle}"/> *</label>
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.editdados.email' bundle='${guichetBundle}'/>">					
						<html:text property="email" styleId="email" maxlength="50" size="40" style="width:80%"/>					
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.dataNasc' bundle='${guichetBundle}'/>">
					<label for="dataNasc"><fmt:message key="guichetelectronico.editdados.dataNasc" bundle="${guichetBundle}"/></label>
				</div>

				<div class="label" style="width: 13%;" title="<fmt:message key='guichetelectronico.editdados.dataNasc' bundle='${guichetBundle}'/>">					
						<html:text property="dataNasc" styleId="dataNasc" maxlength="10" style="width:84%" styleClass="date"/>					
				</div>

					<div class="label" style="width: 54%;" title="<fmt:message key='guichetelectronico.editdados.dataNasc' bundle='${guichetBundle}'/>">
						<img id="dataNascimentoButton" src="${pageContext.request.contextPath}/images/guichet/icons/icon-calendario.png" class="cursorMao" alt="<fmt:message key='guichetelectronico.editdados.dataNasc' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.editdados.dataNasc' bundle='${guichetBundle}'/>"/>
						<script type='text/javascript'>
	                	Calendar.setup({ inputField : 'dataNasc', ifFormat : '%d-%m-%Y', button : "dataNascimentoButton" });
					</script>
					</div>
			</div>
			<div style="clear:both"></div>

			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.contacto' bundle='${guichetBundle}'/>">
					<fmt:message key="guichetelectronico.editdados.contacto" bundle="${guichetBundle}"/>
				</div>

				<div class="label" style="width: 13%;" title="<fmt:message key='guichetelectronico.editdados.email' bundle='${guichetBundle}'/>">
					 <label for="emailRadio">
						  <html:radio property="contacto" styleId="emailRadio" value="E" styleClass="radioCheck" />
						  <fmt:message key="guichetelectronico.editdados.email" bundle="${guichetBundle}"/>
					  </label>
				</div>

					<div class="label" style="width: 54%;" title="<fmt:message key='guichetelectronico.editdados.telefone' bundle='${guichetBundle}'/>">
						<label for="telefoneRadio">
						  <html:radio property="contacto" styleId="telefoneRadio" value="T" styleClass="radioCheck" />
						  <fmt:message key="guichetelectronico.editdados.telefone" bundle="${guichetBundle}"/>
					  </label>
					</div>
			</div>
			<div style="clear:both"></div>
			
			<br />
			<div class="barraSubTitulo">
				<h2><fmt:message key="guichetelectronico.editdados.autenticacao" bundle="${guichetBundle}"/></h2>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.pergunta' bundle='${guichetBundle}'/>">
					<label for="pergunta"><fmt:message key="guichetelectronico.editdados.pergunta" bundle="${guichetBundle}"/> *</label>
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.editdados.pergunta' bundle='${guichetBundle}'/>">					
					<html:select property="pergunta" styleId="pergunta" style="width:80%;">
						 <c:forEach items="${dadosPessoaisGuichetFormBean.listaPerguntas}" var="pergunta" varStatus="status">
							<html:option value="${pergunta.id}">${pergunta.pergunta}</html:option>
						</c:forEach>
					</html:select>					
				</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.resposta' bundle='${guichetBundle}'/>">
					<label for="resposta"><fmt:message key="guichetelectronico.editdados.resposta" bundle="${guichetBundle}"/> *</label>
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.editdados.resposta' bundle='${guichetBundle}'/>">					
						<html:text property="resposta" styleId="resposta" maxlength="50" style="width:70%"/>					
				</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.password' bundle='${guichetBundle}'/>">
					<label for="password"><fmt:message key="guichetelectronico.editdados.password" bundle="${guichetBundle}"/> * </label>
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.editdados.password' bundle='${guichetBundle}'/>">					
						<html:password property="password" styleId="password"/>						
				</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='guichetelectronico.editdados.confirmacao' bundle='${guichetBundle}'/>">
					<label for="confirmacao"><fmt:message key="guichetelectronico.editdados.confirmacao" bundle="${guichetBundle}"/> * </label>	
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.editdados.confirmacao' bundle='${guichetBundle}'/>">					
						<html:password property="confirmacao" styleId="confirmacao"/>					
				</div>
			</div>
			<div style="clear:both"></div>
			
			<div class="buttonRow">
				<input type="submit" class="btForm" value="<fmt:message key='guichetelectronico.forms.submit' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.submit.title' bundle='${guichetBundle}'/>" id="submeter">
				<input class="btFormEscuro" type="button" value="<fmt:message key='guichetelectronico.forms.concluido' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.concluido' bundle='${guichetBundle}'/>" onclick="setActionAndSubmit(this.form,'${pageContext.request.contextPath}/guichetelectronico/publico/homepage.do2');"/>
			</div>
</nested:root>
		</html:form>

</div>