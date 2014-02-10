<%@ page contentType="text/html; charset=iso-8859-1" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />


<!-- CODIGO EXT QUE TRATA DOS DRAG AND DROPS DE FUNÇÕES -->
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomStatusbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/examples/ux/css/ColumnNodeUI.css" />

<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/dragndropGridpanels.js" ></script>
<script type="text/javascript" src="${JS_DIR}/ipdmsdragdrop.js" ></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>
<script src="${JS_DIR}/ext/ExtContentIPDMS/CustomStatusBar.js"></script> 


<fmt:message key="ipdms.organica.designacaosingular" var="designacaosingular"/>
<fmt:message key="ipdms.organica.colaborador" var="colaborador"/>
<fmt:message key="ipdms.organica.editar.statusBar.msg" var="statusBarMsg"/>
<fmt:message key="ipdms.organica.editar.funcoesDisponiveis" var="funcoesDisponiveis"/>
<fmt:message key="ipdms.organica.editar.funcoesEscolhidas" var="funcoesEscolhidas"/>
<fmt:message key="ipdms.organica.editar.funcao" var="funcaoDesc"/>
<fmt:message key="ipdms.organica.editar.descricao" var="descricao"/>
<fmt:message key="ipdms.organica.editar.funcoesEscolhidasDD" var="funcoesEscolhidasDD"/>
<fmt:message key="ipdms.organica.editar.funcoesAlreadyUsed.title" var="alreadyUsedTitle"/>
<fmt:message key="ipdms.organica.editar.funcoesAlreadyUsed.msg" var="alreadyUsedMsg"/>

<script type="text/javascript">
	var index=0;
	var exist=false;
	var win;

	function dropPostActions(draggable, type){
		var action = null;
		var size=0;

		
		if(type=='add')
			action = 'addFuncaoOrganica.do2';
		else
			action = 'removeFuncaoOrganica.do2';

		var params = "funcaoId="+draggable;

		var myajax = new Ajax.Updater('ajaxresult', '${pageContext.request.contextPath}/'+action,
				{method: 'get', parameters: params,
				 enconding:'charset=ISO-8859-1',
				 onComplete: updatedBindedFuncoes} );
	}

	
	function updatedBindedFuncoes(response){
		var errorContent = Ext.DomQuery.selectNode("div[id='ajaxerror']", "ajaxresult");
		if(errorContent) {
			Ext.Msg.alert('${alreadyUsedTitle}', errorContent.innerHTML);
		} else {			
			var action = '${pageContext.request.contextPath}/refreshBindedFuncoes.do2';
			var myajax = new Ajax.Updater( 'organica.responsavel',action, 
					{method: 'get' } );
				
			//Actualizar status bar do Panel
			// Update the status bar later in code:
			var sb = Ext.getCmp('infoarea');
			sb.setStatus({
			    text: response.responseText,
			    iconCls: 'ok-icon',
			    clear: true // auto-clear after a set interval
			});
		}
	}
	
	//verificar se funcoes estão associadas ao utilizador em sessão
	function verifyFuncAction(funcId){
		var funcs=[];
		<c:forEach items="${funcoesAlreadyUsed}" var="funcao" varStatus="i">
			  if(funcId==${funcao.id}){
				Ext.Msg.alert('${alreadyUsedTitle}', '${alreadyUsedMsg}');  
				return true;			
			  }	
		</c:forEach>
		return false;
	}
	

	function fnchama( btn ){
	   action = "ajaxListOrganica.do2";
	   paramts = "valuePlaceOlder=organica.parent&descPlaceOlder=organicaDesc&window=winchoose";
	   ExtWindow('${designacaosingular}',action,paramts,'ext');
    }
</script>

<script type="text/javascript">
	var enableDragDrop = true;
	<c:if test="${IPDMSInteropReceiver}">
		enableDragDrop = false;
	</c:if>
	//Barra de status com mensagem inicial
	var mainStatus= "${statusBarMsg}";

	//Titulo do gridPanel1
	var titledisp='${funcoesDisponiveis}';
	//Titulo do gridPanel2
	var titleesc='${funcoesEscolhidas}';
	//Titulos das colunas(2)
	var headerCol1='${funcaoDesc}';
	var headerCol2='${descricao}';
	//Mensagem para ao arrastar elementos de uma gridpanel para outra
	var ddtext= ' ${funcoesEscolhidasDD}';


	//Dados de funcoes disponiveis e escolhidas para a organica
	var elemDisp = {
		records : [
			<c:forEach items="${organicaFormBean.availableFuncoes}" varStatus="i" var="elemento">
				{ name : ' <img src="${IMG_DIR}/icon/icon-user.png" style="vertical-align:middle; padding-right:5px;" alt="${colaborador}" title="${colaborador}" />${elemento.titulo}', descricao: '${elemento.descricao}' ,id : ${elemento.id}}
				 <c:if test="${!i.last}">,</c:if>
				</c:forEach>
		]
	};

	var elemEsc = {
		records : [
			<c:forEach items="${organicaFormBean.organica.funcoes}" varStatus="i" var="elemento">
				{ name : ' <img src="${IMG_DIR}/icon/icon-user.png" style="vertical-align:middle; padding-right:5px;" alt="${colaborador}" title="${colaborador}" />${elemento.titulo}', descricao: '${elemento.descricao}' ,id : ${elemento.id}}
				<c:if test="${!i.last}">,</c:if>
				</c:forEach>
		]
	}
</script>

<div id="ajaxresult" style="display: none;"></div>

<html:form action="/saveOrganica" method="post" styleClass="form">
	<html:hidden property="organica.id"/>
	<div class="row" style="padding-bottom:30px;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.obrigatorio"/>">
	    	<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio"/></span>
		</div>
	</div>
	    
	<fieldset  title="<fmt:message key="ipdms.organica.nivelhierarquico" />">
		<legend><fmt:message key="ipdms.organica.nivelhierarquico" /></legend>
		<div class="row formlabel_sf" >
	       <div class="leftTab label" style="width: 13%;" title="<fmt:message key='ipdms.organica.superior' />">
	           <fmt:message key="ipdms.organica.superior" /> 
	       </div>
	       
	       <div class="label" style="width: 5%; " title="Parametrizar Atributos">
	           <img alt="<fmt:message key="ipdms.organica.superior" />" title="<fmt:message key="ipdms.organica.superior" />" 
					src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" id="show-btn" onclick="fnchama(this)" class="cursorMao" />
	       </div>
	   
	       <div class="label" style="width: 79%;" title="Parametrizar Atributos">
	            <input type="hidden" name="organica.parent" id="organica.parent" value="${organicaFormBean.organica.parent.id}">
				<div id="organicaDesc"> ${organicaFormBean.organica.parent.designacao}</div>
	       </div>            
	   </div>
	
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 13%; " title="<fmt:message key="ipdms.organica.designacao" />">
				<label for="designacao"><fmt:message key="ipdms.organica.designacao" /> *</label>
			</div>
	           
			<div class="label" style="width: 84%;" title="<fmt:message key="ipdms.organica.designacao" />">
				<html:text property="organica.designacao" size="60" maxlength="100" styleId="designacao"/>
			</div>
		</div>
			
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 13%; " title="<fmt:message key="ipdms.organica.sigla" />">
				<label for="sigla"><fmt:message key="ipdms.organica.sigla" /> *</label>
			</div>
	           
			<div class="label" style="width: 84%;" title="<fmt:message key="ipdms.organica.sigla" />">
				<html:text property="organica.sigla" size="20" maxlength="20" styleId="sigla"/>
			</div>
		</div>
			
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 13%; " title="<fmt:message key="ipdms.organica.idexterno" />">
				<label for="idExterno"><fmt:message key="ipdms.organica.idexterno" /> *</label>
			</div>
	           
			<div class="label" style="width: 84%;" title="<fmt:message key="ipdms.organica.idexterno" />">
				<html:text property="organica.idExterno" size="20" maxlength="20" styleId="idExterno"/>
			</div>
		</div>
		
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 13%; " title="<fmt:message key="ipdms.organica.activa" />">
				<label for="activa"><fmt:message key="ipdms.organica.activa" /></label>
			</div>
	           
			<div class="label" style="width: 84%;" title="<fmt:message key="ipdms.organica.activa" />">
				<html:checkbox property="organica.active" style="border:0;" styleId="activa"/>
			</div>
		</div>
	</fieldset>
	
	<fieldset  title="<fmt:message key="ipdms.organica.contactos" />">
		<legend><fmt:message key="ipdms.organica.contactos" /></legend>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 13%; " title="<fmt:message key="ipdms.organica.telefone" />">
					<label for="telefone"><fmt:message key="ipdms.organica.telefone" /></label>
				</div>
	              
				<div class="label" style="width: 84%;" title="<fmt:message key="ipdms.organica.telefone" />">
					<html:text property="organica.telefone" size="20" maxlength="20" styleId="telefone"/>
				</div>
	        </div>
	        
	        <div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 13%; " title="<fmt:message key="ipdms.organica.fax" />">
					<label for="fax"><fmt:message key="ipdms.organica.fax" /></label>
				</div>
	              
				<div class="label" style="width: 84%;" title="<fmt:message key="ipdms.organica.fax" />">
					<html:text property="organica.fax" size="20" maxlength="20" styleId="fax"/>
				</div>
	        </div>
	        
	        <div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 13%; " title="<fmt:message key="ipdms.organica.email" />">
					<fmt:message key="ipdms.organica.email" />
				</div>
	              
				<div class="label" style="width: 84%;" title="<fmt:message key="ipdms.organica.email" />">
					<html:text property="organica.email" size="50" maxlength="50"/>
				</div>
	       	</div>			
	</fieldset>
		
	<fieldset  title="<fmt:message key="ipdms.organica.funcoes.responsavel" />">
		<legend><fmt:message key="ipdms.organica.funcoes.responsavel" /></legend>
		
	    <div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 13%; " title="<fmt:message key="ipdms.organica.funcoes.responsavel" />">
				<label for="organica.responsavel"><fmt:message key="ipdms.organica.funcoes.responsavel" /></label>
			</div>
	              
	        <div class="label" style="width: 84%;" title="<fmt:message key="ipdms.organica.funcoes.responsavel" />">
				<bean:define id="bindedfuncoes" name="organicaFormBean" property="organica.funcoes"/>
				<html:select property="organica.responsavel" styleId="organica.responsavel" value="${organicaFormBean.organica.responsavel.id}">
					<html:optionsCollection name="bindedfuncoes" value="id" label="titulo"/>
				</html:select> 
			</div>
		</div>
	
	</fieldset>
	
	<fieldset>
		<legend><fmt:message key="ipdms.organica.centroresultados.title" /></legend>
		
	    <div class="row formlabel_sf" >
	    	<div class="leftTab label" style="width: 13%; " title="<fmt:message key="ipdms.organica.centroresultados.title" />">
				<label for="organica.responsavel"><fmt:message key="ipdms.organica.centroresultados.title" /></label>
	    	</div>            
	        <div class="label" style="width: 84%;" title="<fmt:message key="ipdms.organica.centroresultados.title" />">        	
				<html:select property="idCentroResultado" styleId="idCentroResultado">
					<option value="0"><fmt:message key="ipdms.etapa.comboText" /></option>
					<html:optionsCollection name="opcoes" value="id" label="titulo" />
				</html:select> 
	        </div>
	   </div>
	
	</fieldset>
	
	<br /><br />
	
	<input type="hidden" id="loadInactive" name="loadInactive" value="${loadInactive}" />
	<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key="ipdms.forms.anterior.title"/>"
		onclick="setActionAndSubmit(this.form, 'listOrganica.do2?loadInactive=${loadInactive}');">
	<c:if test="${!IPDMSInteropReceiver}">
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key="ipdms.forms.submit.title"/>">
	</c:if>
	
	<div id="panel" style="width: 90%"></div>

</html:form>
