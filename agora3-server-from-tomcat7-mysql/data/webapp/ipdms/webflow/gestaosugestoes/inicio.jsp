<%@ taglib prefix="html" uri="/tags/html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested" %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:message key="ipdms.forms.seguinte" var="seguinte" />
<fmt:message key="ipdms.forms.seguinte.title" var="seguinteTitle" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />

<bean:define id="sugestao" name="gestaoSugestoesFlowBean" property="sugestao" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script src='${JS_DIR}/swf-ajax.js' type="text/javascript"></script>

<logic:notPresent name="_resumo" scope="request">
	<html:form	action="/applicationFlow"
				method="post"
				enctype="multipart/form-data">
		<br />
		
		<input	type="hidden"
				name="_flowExecutionKey"
				value="${flowExecutionKey}" />
				
		<html:errors />
		
	<div class="webflow_formdiv">
	
			<div class="row formlabel_sf" >
				<div class="label" style="width: 97%; " title="<fmt:message key='ipdms.so.gestaoSugestoes.singular'/> / <fmt:message key='ipdms.so.gestaoSugestoes.colectivo'/>">
					  <label for="singular">
						  <html:radio property="sugestao.tipoEntidade" value="S" styleId="tipoEntidade"/> <fmt:message key="ipdms.so.gestaoSugestoes.singular"/>
					  </label>
					  <label for="colectivo">
						  <html:radio property="sugestao.tipoEntidade" value="E" styleId="tipoEntidade"/> <fmt:message key="ipdms.so.gestaoSugestoes.colectivo"/>
					  </label>
				</div>
			</div>
			<br />
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='ipdms.so.gestaoSugestoes.nome'/> / <fmt:message key='ipdms.so.gestaoSugestoes.designacao'/>">
					<label for="utilizador"><fmt:message key="ipdms.so.gestaoSugestoes.nome"/> / </span><fmt:message key="ipdms.so.gestaoSugestoes.designacao"/> *</label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.nome'/> / <fmt:message key='ipdms.so.gestaoSugestoes.designacao'/>">					
						<html:text property="sugestao.nome" styleId="nome" size="90%"/>					
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='ipdms.so.gestaoSugestoes.morada'/>">
					<label for="morada"><fmt:message key="ipdms.so.gestaoSugestoes.morada"/></label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.morada'/>">					
						<html:text property="sugestao.morada" styleId="morada" size="90%"/>					
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='ipdms.so.gestaoSugestoes.localidade'/>">
					<label for="localidade"><fmt:message key="ipdms.so.gestaoSugestoes.localidade"/></label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.localidade'/>">					
						<html:text property="sugestao.localidade" styleId="localidade" size="90%"/>					
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='ipdms.so.gestaoSugestoes.codpostal'/>">
					<label for="codPostal1"><fmt:message key="ipdms.so.gestaoSugestoes.codpostal"/></label>
				</div>

				<div class="label" style="width: 18%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.codpostal'/>">					
						<html:text property="sugestao.codPostal1" styleId="codPostal1" size="5"/>
					-
					<label for="codPostal2">
						<html:text property="sugestao.codPostal2" styleId="codPostal2" size="4"/>
					</label>
				</div>

				<div class="label" style="width: 62%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.codpostal'/>">
					<label for="codPostal3">
						<html:text property="sugestao.codPostal3" styleId="codPostal3" size="68%"/>
					</label>
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='ipdms.so.gestaoSugestoes.telefone'/>">
					<label for="telefone"><fmt:message key="ipdms.so.gestaoSugestoes.telefone"/></label>
				</div>

				<div class="label" style="width: 25%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.telefone'/>">					
						<html:text property="sugestao.telefone" styleId="telefone" size="25"/>					
				</div>
				<div class="label" style="width: 8%; " title="<fmt:message key='ipdms.so.gestaoSugestoes.telemovel'/>">
						<label for="telemovel"><fmt:message key="ipdms.so.gestaoSugestoes.telemovel"/></label>
				</div>

				<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.telemovel'/>">				
						<html:text property="sugestao.telemovel" styleId="telemovel" size="25"/>					
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='ipdms.so.gestaoSugestoes.email'/>">
					<label for="email"><fmt:message key="ipdms.so.gestaoSugestoes.email"/> *</label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.email'/>">					
						<html:text property="sugestao.email" styleId="email" size="90%"/>					
				</div>
			</div>

			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='ipdms.so.gestaoSugestoes.contacto'/>">
					<fmt:message key="ipdms.so.gestaoSugestoes.contacto"/>
				</div>

				<div class="label" style="width: 67%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.contacto'/>">
					 <label for="email">
					 <html:radio property="sugestao.contactoPref" value="E" styleId="contactoPref"/>
						  <fmt:message key="ipdms.so.gestaoSugestoes.email"/>
					  </label>
						<label for="telefone">
						  <html:radio property="sugestao.contactoPref" value="T" styleId="contactoPref"/>
						  <fmt:message key="ipdms.so.gestaoSugestoes.telefone"/>
					  </label>
					</div>
			</div>
			<div style="clear:both"></div>
			<br />
			<div class="titulo2">
				<fmt:message key='ipdms.comunicacaoparecer.criar.assunto'/>
			</div>
		
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='ipdms.so.gestaoSugestoes.descricao'/>">
					<fmt:message key="ipdms.so.gestaoSugestoes.descricao"/> *
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.descricao'/>">
					<html:textarea property="sugestao.descricao" rows="2" cols="20" styleId="descricao" style="width:93%"/>
				</div>
			</div>
	
		<br /><br />
		
		<div class="buttonRow">
							
			<html:submit	property="_eventId_next" title="${seguinteTitle}"
							value="${seguinte}" 
							styleClass="btForm" />
														
			<html:submit	property="_eventId_cancel" title="${cancelarTitle}"
							value="${cancelar}"
							styleClass="btFormEscuro"
							onclick="if( confirmaCancelar() ) ajaxSubmitReferer(event,'${referer}'); else return false;" />
		</div>
	</div>
	</html:form>
</logic:notPresent>

<%------------------------ RESUMO ------------------------%>
<logic:present name="_resumo" scope="request">

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;" title="<fmt:message key='ipdms.so.gestaoSugestoes.nome'/>/<fmt:message key='ipdms.so.gestaoSugestoes.designacao'/>">
  		<fmt:message key="ipdms.so.gestaoSugestoes.nome"/>/<fmt:message key="ipdms.so.gestaoSugestoes.designacao"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.nome'/>/<fmt:message key='ipdms.so.gestaoSugestoes.designacao'/>">
		${sugestao.nome}
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;" title="<fmt:message key='ipdms.so.gestaoSugestoes.morada'/>">
  		<fmt:message key="ipdms.so.gestaoSugestoes.morada"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.morada'/>">
		${sugestao.morada}
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;" title="<fmt:message key='ipdms.so.gestaoSugestoes.localidade'/>">
  		<fmt:message key="ipdms.so.gestaoSugestoes.localidade"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.localidade'/>">
		${sugestao.localidade}
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;" title="<fmt:message key='ipdms.so.gestaoSugestoes.codpostal'/>">
  		<fmt:message key="ipdms.so.gestaoSugestoes.codpostal"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.codpostal'/>">
		${sugestao.codPostal1} - ${sugestao.codPostal2} ${sugestao.codPostal3}
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;" title="<fmt:message key='ipdms.so.gestaoSugestoes.telefone'/>">
  		<fmt:message key="ipdms.so.gestaoSugestoes.telefone"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.telefone'/>">
		${sugestao.telefone}
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;" title="<fmt:message key='ipdms.so.gestaoSugestoes.telemovel'/>">
  		<fmt:message key="ipdms.so.gestaoSugestoes.telemovel"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.telemovel'/>">
		${sugestao.telemovel}
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;" title="<fmt:message key='ipdms.so.gestaoSugestoes.email'/>">
  		<fmt:message key="ipdms.so.gestaoSugestoes.email"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.email'/>">
		${sugestao.email}
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;" title="<fmt:message key='ipdms.so.gestaoSugestoes.descricao'/>">
  		<fmt:message key="ipdms.so.gestaoSugestoes.descricao"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="<fmt:message key='ipdms.so.gestaoSugestoes.descricao'/>">
		${sugestao.descricao}
	</div>
</div>
</logic:present>

