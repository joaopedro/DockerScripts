<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<fmt:message key="ipdms.colaborador.multiplos" var="multiplos"/>

<script>
function showOrganicaColaboradoresMultiple(){
	var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
	paramts = "valuePlaceOlder=colaboradoresDelegadosId";
	paramts += "&descPlaceOlder=colaboradoresDelegadosDesc";
	paramts += "&selectedids=" + $F('colaboradoresDelegadosId');
	paramts += "&window=winchoose&multiple=true";
	
	winColMulti=ExtWindow('${multiplos}',action,paramts,'ext');
	//winColMulti.on('close',function(){postOrganicaColaboradoresMultipleFunction();});
}
</script>	
	
<html:form action="/saveColaborador" onsubmit="dateFormatCheckonSubmit();" method="post" styleClass="form" enctype="multipart/form-data">
    <html:hidden property="numero"/>
    <html:hidden property="ldap"/>    
    <html:hidden property="externalUUID" />
    
    <!-- DIV DO FORMULÁRIO -->
	<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>
	
	<c:if test="${colaboradorFormBean.lockedUser}">
	<br/>
	<span class="mensagenErro1" style="padding: 10px 10px 10px 10px; background-color: #FFFFE0; " >
		<fmt:message key="ipdms.colaborador.bloqueado.msg"/>
		<html:link action="/admin/unlockUser" paramId="numero" paramName="colaboradorFormBean" paramProperty="numero">
			<fmt:message key="ipdms.colaborador.bloqueado.msgHref"/>
		</html:link>
	</span>
	<br/><br/>	
	</c:if>
	
	<div class="row formlabel_sf">
   		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.colaborador.nome' />">
   	  		<label for="nome"><fmt:message key="ipdms.colaborador.nome" /></label> * 
   	  	</div>
   	  	
   	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.nome' />">
   	  		<html:text property="nome" style="width:97.6%" styleId="nome" />
   	  	</div>
   	</div>
   	<div class="row formlabel_sf">
  	  	<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.morada'/>">
  	  		<label for="morada"><fmt:message key="ipdms.colaborador.morada"/> *</label> 
  	  	</div>
  	  		
  	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.morada'/>">
  	  		<html:textarea property="morada" style="width: 97%;" styleId="morada"/>
		</div>
	</div>
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.telefone'/>">
   	  		<label for="telefone"><fmt:message key="ipdms.colaborador.telefone"/></label>
   	  	</div>
   	  		
   	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.telefone'/>">
   	  		<html:text property="telefone" maxlength="9" size="20" styleId="telefone" />
   	  	</div>
   	</div>
   	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.telemovel'/>">
   	  		<label for="telemovel"><fmt:message key="ipdms.colaborador.telemovel"/></label>
   	  	</div>
   		  		
   	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.telemovel'/>">
   	  		<html:text property="telemovel" maxlength="9" size="20" styleId="telemovel" />
   	  	</div>
   	</div>
   	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.fax'/>">
   	  		<label for="fax"><fmt:message key="ipdms.colaborador.fax"/></label>
   	  	</div>
   		  		
   	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.fax'/>">
   	  		<html:text property="fax" maxlength="20" size="20" styleId="fax" />
   	  	</div>
   	</div>
   	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.email'/>">
   	  		<label for="email"><fmt:message key="ipdms.colaborador.email"/> *</label> 
   	  	</div>
   	  		
   	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.email'/>">
   	  		<html:text property="email" maxlength="50" size="40" styleId="email" />
   	  	</div>
   	</div>
   		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.login'/>">
   	  		<label for="login"><fmt:message key="ipdms.colaborador.login"/> *</label> 
   	  	</div>
   	  		
   	  	<div class="label" style="width: 20%;" title="<fmt:message key='ipdms.colaborador.login'/>">
	   	  	<c:set var="numeroConteudo" value="${colaboradorFormBean.numero}"/>
            <c:if test="${numeroConteudo == null || (numeroConteudo != null && numeroConteudo == 0)}" >
                <html:text property="login" maxlength="50" size="40" />
            </c:if>
            <c:if test="${numeroConteudo != null && numeroConteudo != 0}" >
                <div>
                    <span><bean:write name="colaboradorFormBean" property="login"/></span>
                    <html:hidden property="login" />
                </div>
            </c:if>	   	  		   	  		   	  		   	  		
   		</div>   	  	
   		<div style="width: 80%;">
   			<span class="formlabel_obrigatorio"><fmt:message key="ipdms.login.message" /></span>
   		</div>      		  	
   	</div>
<c:if test="${not colaboradorFormBean.ldap}">
   	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.password'/>">
   	  		<label for="password"><fmt:message key="ipdms.colaborador.password"/></label> 
   	  	</div>
   	  		
   	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.password'/>">
   	  		<html:password property="passwordNova" maxlength="50" size="40" styleId="password" />
   	  	</div>
   	</div> 	
   	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.confirmacao'/>">
   	  		<label for="confirmacao"><fmt:message key="ipdms.colaborador.confirmacao"/></label> 
   	  	</div>
   	  		
   	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.confirmacao'/>">
   	  		<html:password property="confirmacao" maxlength="50" size="40" styleId="confirmacao" />
   	  	</div>
   	</div> 	   		
</c:if>   	
   	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.colaborador.signaturefile'/>">
	  		<fmt:message key="ipdms.colaborador.signaturefile"/>
	  	</div>
	  	<c:set var="fileForUpload" value="${colaboradorFormBean.signatureFile}" scope="request" />
	  	<c:import url="/ipdms/commons/fileupload/replaceablefile.jsp">  		
	  		<c:param name="formUploadProperty" value="signatureFile" />
	  		<c:param name="visualizeFileAction" value="file/getColaboradorSignature" />
	  	</c:import>  	
	</div>
   	
   	<div class="row formlabel_sf">
	   <div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.analistadados'/>">
   	 		<label for="analistadados"><fmt:message key="ipdms.colaborador.analistadados"/></label>
   	 	</div>
   	  		
   	 	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.analistadados'/>">
   	  		<html:checkbox property="analistaDados" styleClass="radion" value="S" style="border:0;" styleId="analistadados"/>
   	  	</div>
   	</div> 	
   	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.colaborador.tohash' />">
	  		<label for="tohash"><fmt:message key="ipdms.colaborador.tohash" /></label>
	  	</div>  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.tohash' />">
	  		<html:checkbox property="tohash" styleClass="radion" style="border:0;" styleId="tohash" />
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.colaborador.secureconnection' />">
	  		<label for="secureconnection"><fmt:message key="ipdms.colaborador.secureconnection" /></label>
	  	</div>  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.secureconnection' />">
	  		<html:checkbox property="secureConnection" styleClass="radion" style="border:0;" styleId="secureconnection" />
	  	</div>
	</div>   

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.colaborador.delegar' />">
	  		<label><fmt:message key="ipdms.colaborador.delegar" /></label>
	  	</div>  	
	  	<div class="label" style="width: 5%;" title="<fmt:message key='ipdms.colaborador.delegar' />">
	  		<html:hidden property="colaboradoresDelegadosId" styleId="colaboradoresDelegadosId" />
	  		<a class="formlabel" href="#" onclick="showOrganicaColaboradoresMultiple();" id="windColMulti">
				<img style="vertical-align: bottom"
					src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"
					class="cursorMao" alt="<fmt:message key='ipdms.forms.pesquisar' />" title="<fmt:message key='ipdms.forms.pesquisar' />" />
			</a>
	  	</div>
	  	<html:hidden property="colaboradoresDelegadosDesc" styleId="colaboradoresDelegadosDesc"/>
	  	<div id="colaboradoresDelegadosDescDiv" class="label" style="width: 70%;" title="<fmt:message key='ipdms.colaborador.delegar' />"></div>
	</div>   
	
			
   	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.departamentomestre'/>">
   	  		<label for="departamentomestre"><fmt:message key="ipdms.colaborador.departamentomestre"/> *</label> 
   	  	</div>
   	  		
   	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.departamentomestre'/>">
   	  		<html:select property="departamento" styleId="departamentomestre">
				<html:optionsCollection name="departamentos" value="id" label="designacao" style="width: 75%;"/>
	        </html:select> 
   	  	</div>
   	</div>
   	
   	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.funcaoprincipal'/>">
   	  		<label for="funcaoprincipal"><fmt:message key="ipdms.colaborador.funcaoprincipal"/></label>
   	  	</div>
   	  		
   	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.funcaoprincipal'/>">
   	  		<html:text property="funcaoPrincipal" maxlength="50" size="50" styleId="funcaoprincipal" />
   	  	</div>
   	</div>
   	
   	
	<c:set var="date" value="true" scope="request"/>
	
	<jsp:include page="privilegestemplate.jsp"/>
		
	<div class="buttonRow">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
			onclick="setActionAndSubmit(this.form, 'listColaborador.do2');" />
		<c:if test="${!IPDMSInteropReceiver}">
			<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key='ipdms.forms.submit.title'/>"/>
		</c:if>
	</div>
</html:form>

<script>
	parseElement('colaboradoresDelegadosDesc','');
</script>