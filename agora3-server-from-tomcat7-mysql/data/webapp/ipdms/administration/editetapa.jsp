<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html:form action="/saveEtapa" method="post" styleId="form">
	<html:hidden property="numero"/>
	
	<div class="row" style="padding-bottom:20px;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.obrigatorio" />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.nome' />">
	  		<fmt:message key="ipdms.etapa.nome" /> * 
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.nome' />">
	  		<html:text property="titulo" maxlength="80" size="40" />
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.descricao' />">
	  		<fmt:message key="ipdms.etapa.descricao" />
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.descricao' />">
	  		<html:text property="descricao" maxlength="1000" size="40" />
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.descricaoExterna' />">
	  		<fmt:message key="ipdms.etapa.descricaoExterna" />
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.descricaoExterna' />">
	  		<html:text property="descricaoExterna" maxlength="1000" size="40" />
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.limite' /> ">
	  		<fmt:message key="ipdms.etapa.limite" /> * 
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.limite' /> ">
	  		<html:text property="limite" maxlength="40" size="40" />
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.reminder' />">
	  		<fmt:message key="ipdms.etapa.reminder" />
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.reminder' />">
	  		<html:text property="reminder" maxlength="40" size="40" />
	  	</div>
	</div>
	<br /><br /> 	
	<fieldset>
		<legend><fmt:message key='ipdms.etapa.AccoesDisponiveis' /></legend>
				<div class="formfield" style="margin-left:4px;">
				<html:checkbox property="darConhecimento" styleClass="radion" style="border:0;" /><fmt:message
					key="ipdms.etapa.darConhecimento" /><br />
				<html:checkbox property="aguardar" styleClass="radion" style="border:0;" /><fmt:message
					key="ipdms.etapa.aguardar" /><br />
				<html:checkbox property="encarregar" styleClass="radion" style="border:0;" /><fmt:message
					key="ipdms.etapa.encarregar" />	<br />	
				<html:checkbox  property="delegavel"
					title="Delegavel" styleClass="radion" style="border:0;"/><fmt:message
					key="ipdms.etapa.delegavel" /><br />
				<html:checkbox property="encerrar" styleClass="radion" style="border:0;" /><fmt:message
					key="ipdms.etapa.encerrar" /><br />
				<html:checkbox property="suspender" styleClass="radion" style="border:0;" /><fmt:message
					key="ipdms.etapa.suspender" />		
					</div>
	</fieldset>
	<div class="row formlabel_sf"  style="height:30px;">
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.nomeactividade' />">
	  		<fmt:message key="ipdms.etapa.nomeactividade" /> * 
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.nomeactividade' />">
	  		<html:text property="nomeActividade" maxlength="80" size="40" />
	  	</div>
	</div>
	<div class="row formlabel_sf" style="height:30px;">
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.view' />">
	  		<fmt:message key="ipdms.etapa.view" />
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.view' />">
	  		<html:text property="view" maxlength="80" size="40"/>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.body' />">
	  		<fmt:message key="ipdms.etapa.body" />
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.body' />">
	  		<html:textarea property="body" ></html:textarea>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.visivelExterior' />">
	  		<fmt:message key="ipdms.etapa.visivelExterior" />
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.visivelExterior' />">
	  		<html:checkbox property="visivelExterior" styleClass="radion" style="border:0;" />
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.tohash' />">
	  		<fmt:message key="ipdms.etapa.tohash" />
	  	</div>  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.tohash' />">
	  		<html:checkbox property="tohash" styleClass="radion" style="border:0;" />
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.secureconnection' />">
	  		<fmt:message key="ipdms.etapa.secureconnection" />
	  	</div>  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.secureconnection' />">
	  		<html:checkbox property="secureConnection" styleClass="radion" style="border:0;" />
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.etapa.securesubmit' />">
	  		<fmt:message key="ipdms.etapa.securesubmit" />
	  	</div>
	  	
	  	<fmt:message key='ipdms.etapa.securesubmitresponses.title' var="securesubmitresponsesTitle"/>
	  	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.etapa.securesubmit' />">
	  		<html:checkbox property="secureSubmit" styleClass="radion" style="border:0;" />
	  		<html:text property="secureSubmitResponses" maxlength="80" size="40" title="${securesubmitresponsesTitle}"/>
	  		<i>(<fmt:message key="ipdms.etapa.securesubmitresponses" />)</i>
	  	</div>
	</div>
	
	<br /><br />
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="Distribuível">
		  	<html:checkbox property="distribuivel" styleClass="radion" styleId="checkCl" style="border:0;" onclick="showDistribOptions(this);"/> <fmt:message key="ipdms.etapa.distribuivel" />&nbsp;
		</div>
		 <div id="dist-elements" class="label" title="<fmt:message key="ipdms.etapa.distribuivel" />" style="width: 80%; position: relative" >
		 	<div style="float: left;">
		  		<html:select property="distribuicaoId" styleId="distribuicaoId" onchange="showHideElements(this.value);">
					<option value="0"><fmt:message key="ipdms.etapa.comboText" /></option>
					<html:options collection="distribuicoes" property="id" labelProperty="descricao" />
				</html:select>
			</div>
			<fmt:message key="ipdms.etapa.funcaosigla" var="funcaosigla"/>
			<div id="funcao" style="display: none;">
				<div class="leftTab label" style="width:10%">${funcaosigla}</div>
				<div><html:text property="funcao" styleId="funcaoval" maxlength="30" size="10" title="${funcaosigla}" /></div>
			</div>
						
			<div id="grupo" style="display: none;">
				<div class="leftTab label" style="width:10%"> <fmt:message key="ipdms.etapa.grupo" /></div>
				<div>
					<html:select property="grupoId" styleId="grupoId" >
						<option value="0"><fmt:message key="ipdms.etapa.comboText" /></option>
						<html:options collection="grupos" property="id" labelProperty="titulo" />
					</html:select>
				</div>
			</div>
			
			<div id="etaparespondida" style="display: none;">
				<div class="leftTab label" style="width:10%"> <fmt:message key="ipdms.etapa.designacaosingular" /></div>
				<div>
					<html:select property="etapaRespondida" styleId="etapaRespondida" >
						<option value="0"><fmt:message key="ipdms.etapa.comboText" /></option>
						<html:options collection="etapas" property="numeroConteudo" labelProperty="titulo" />
					</html:select>
				</div>
			</div>			
			
			<script type="text/javascript">
			
				//var distId;
				var distOrgFuncao;
				var distIdGrupo;
				var distNumeroEtapa;
				<c:forEach var="dist" items = "${distribuicoes}">
					if('${dist.sigla}' == 'ORGANICAFUNCAO'){
						distOrgFuncao = '${dist.id}';	
					} else if('${dist.sigla}' == 'GRUPONPAX' ){
						distIdGrupo = '${dist.id}';
					} else if('${dist.sigla}' == 'RESPONDEUETAPA' ){
						distNumeroEtapa = '${dist.id}';
					}			
				</c:forEach>
					
				//se checkbox para distribuir n estiver activa esconder select box
				if(!document.etapaFormBean.distribuivel.checked){
					$('distribuicaoId').style.display = 'none';
				} else {
					if($('distribuicaoId').value == distOrgFuncao){
						$('funcao').style.display = 'inline';
					} else if($('distribuicaoId').value == distIdGrupo){
						$('grupo').style.display = 'inline';
					} else if($('distribuicaoId').value == distNumeroEtapa){
						$('etaparespondida').style.display = 'inline';
					}
				}
								
				/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				//Ao submeter o form, o valor da função é colocado a vazio caso a distribuição não seja para a função da OP de quem intruiu//
				/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				$('form').onsubmit = function(){
					if($('funcao').style.visibility == 'hidden' || $('distribuicaoId').style.visibility == 'hidden'){
						$('funcaoval').value = '';
					}
					if($('grupo').style.visibility == 'hidden' || $('distribuicaoId').style.visibility == 'hidden'){
						$('grupoId').value = '';
					}
					if($('etaparespondida').style.visibility == 'hidden' || $('distribuicaoId').style.visibility == 'hidden'){
						$('numeroEtapa').value = '';
					}
				}
			</script>
			
		 </div>
	</div>
	
	<!-- <fieldset style="margin-left:14px; width:48%; padding-bottom:35px;">
		<legend> <html:checkbox property="distribuivel" styleClass="radion" onclick="useFieldSelect(this,document.etapaFormBean.distribuicaoId);"/> <bean:message key="ipdms.etapa.distribuivel" locale="locale" />&nbsp;</legend>
		<div class="row formlabel_sf" style="margin-left:-10px;">
			<div class="leftTab label" style="width: 25%;" title="Distribuível">
		  		<bean:message key="ipdms.etapa.distribuicao" locale="locale"/>
		  	</div>
		  	
		  	<div class="label" style="width: 70%; " title="Distribuível">
		  		<html:select property="distribuicaoId">
					<option value="0">(escolha uma)</option>
					<html:options collection="distribuicoes" property="id" labelProperty="descricao" />
				</html:select>			
		  	</div>
		 </div>
		<script type="text/javascript">document.etapaFormBean.distribuicaoId.disabled=!<bean:write name="etapaFormBean" property="distribuivel"/>;</script>
	</fieldset>-->
	
	<logic:greaterThan name="${formBeanName}" property="numero" value="0">
		
		<%-- Associar Lista de Opções --%>
		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.etapa.listaopcoes' />">
		  		<fmt:message key="ipdms.etapa.listaopcoes" />
		  	</div>
		  	
		  	<div class="label" style="width: 5%;" title="<fmt:message key='ipdms.etapa.listaopcoes' />">
		  		<img class="cursorMao" alt="<fmt:message key='ipdms.etapa.listaopcoes' />" title="<fmt:message key='ipdms.etapa.listaopcoes' />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
					onclick="setActionAndSubmit($('form'),  'listEtapaListaOpcoesRelation.do2?numero=${etapaFormBean.numero}');"/>
		  	</div>
		  	
		  	<fmt:message key="ipdms.etapa.listaopcoesassociadas" var="listaopcoesassociadas"/>
		  	<fmt:message key="ipdms.etapa.semListaopcoesassociadas" var="semListaopcoesassociadas"/>
		  	
		  	<div class="label" style="width: 74%;" title="<fmt:message key='ipdms.etapa.listaopcoes' />">
		  		<span class="textoAzul">» ${listaopcoesassociadas}:</span> 
		  		<div class="listaCinzenta" style="width: 70%;">
		  		<c:set var="collectionName" value="${etapaFormBean.listaOpcoesAssociadas}" scope="request"></c:set>
					<c:set var="firstline" value="${listaopcoesassociadas}" scope="request"></c:set>
					<c:set var="noinfo" value="${semListaopcoesassociadas}" scope="request"></c:set>
					<jsp:include page="moreInfoInTittle.jsp" /><br/>
					
		  		</div>
		  	</div>
		</div>
		
		<%-- Associar Tarefas --%>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.etapa.tarefas' />">
		  		<fmt:message key="ipdms.etapa.tarefas" />
		  	</div>
		  	
		  	<div class="label" style="width: 5%;" title="<fmt:message key='ipdms.etapa.tarefas' />">
		  		<img class="cursorMao" alt="<fmt:message key='ipdms.etapa.tarefas' />" title="<fmt:message key='ipdms.etapa.tarefas' />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
					onclick="setActionAndSubmit($('form'), 'listTarefaEtapaRelation.do2?numero=${etapaFormBean.numero}');"/>
		  	</div>
		  	
		  	<div class="label" style="width: 74%;" title="<fmt:message key='ipdms.etapa.tarefas' />">
		  		<span class="textoAzul"><fmt:message key="ipdms.etapa.tarefasassociadas" /></span> 
		  		<div class="listaCinzenta" style="width: 70%;">
		  			<c:set var="collectionName" value="${etapaFormBean.tarefasAssociadas}" scope="request"></c:set>
					<jsp:include page="moreInfoTarefasInTittle.jsp" /><br/>
		  		</div>
		  	</div>
		</div>
		
		<%-- Associar Grupos de Variantes --%>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.etapa.gruposvariantes' />">
		  		<fmt:message key="ipdms.etapa.gruposvariantes" />
		  	</div>
		  	
		  	<div class="label" style="width: 5%;" title="<fmt:message key='ipdms.etapa.gruposvariantes' />">
		  		<img class="cursorMao" alt="<fmt:message key='ipdms.etapa.gruposvariantes' />" title="<fmt:message key='ipdms.etapa.gruposvariantes' />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
					onclick="setActionAndSubmit($('form'), 'listGrupoVarianteEtapaRelation.do2?numero=${etapaFormBean.numero}');"/>
		  	</div>
		  	
		  	<fmt:message key='ipdms.etapa.semGruposAssociados' var = "semGruposAssociados"/>
		  	
		  	<div class="label" style="width: 74%;" title="<fmt:message key='ipdms.etapa.gruposvariantes' />">
		  		<span class="textoAzul"><fmt:message key="ipdms.etapa.gruposvariantesassociados" /></span> 
		  		<div class="listaCinzenta" style="width: 70%;">
		  			<c:set var="collectionName" value="${etapaFormBean.gruposVariantesAssociados}" scope="request"></c:set>
					<c:set var="noinfo" value="${semGruposAssociados}" scope="request"></c:set>
					<jsp:include page="moreInfoInTittle.jsp" /><br/>
		  		</div>
		  	</div>
		</div>
	
		<%-- 
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 18%;" title="Parametrizar Atributos">
		  		<bean:message key="ipdms.etapa.atributos" locale="locale" />
		  	</div>
		  	
		  	<div class="label" style="width: 5%; " title="Parametrizar Atributos">
		  		<img class="cursorMao" alt="Associar Tarefas" title="Associar Atributos" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
						onclick="setActionAndSubmit($('form'), 'listParametrosAtributoOfEtapa.do2');"/>
		  	</div>
		
			<div class="label" style="width: 74%;" title="Parametrizar Atributos">
		  		<span class="textoAzul">» Atributos Associados:</span> 
		  		<div class="listaCinzenta" style="width: 70%;" >
		  			<c:set var="collectionName" value="${etapaFormBean.atributoEtapa}" scope="request"></c:set>
					<jsp:include page="moreInfoAtributosInTittle.jsp" /><br/>
		  		</div>
		  	</div>
		
		</div>
		--%>
	</logic:greaterThan>
	
	<fmt:message key='ipdms.etapa.formulariodinamico' var="formulariodinamico"/>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%;" title="${formulariodinamico}">
	  		${formulariodinamico}
	  	</div>
	  	<div class="label" style="width: 5%; " title="${formulariodinamico}">
	  		<img class="cursorMao" alt="${formulariodinamico}" title="${formulariodinamico}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
					onclick="showFormularios();"/>
	  	</div>
	  	<div class="label" style="width: 45%; " title="${formulariodinamico}">
	  		<span id="dynamicFormDescSpan">${etapaFormBean.dynamicFormDesc}</span>
		  	<html:hidden property="dynamicFormDesc" styleId="dynamicFormDesc" />
		  	<html:hidden property="dynamicFormId" styleId="dynamicFormId" /> 	
	  	</div>
	</div>
	
	<script>
	function showFormularios(){
		var action = "${pageContext.request.contextPath}/listDynamicFormsPopup.do2?method=showPopup";
		action += "&dynamicFormId=dynamicFormId";
		action += "&dynamicFormDesc=dynamicFormDesc";
		action += "&dynamicFormDescSpan=dynamicFormDescSpan";
		action += "&window=winchoose";
		ExtWindow('${formulariodinamico}',action,'','html');
	}
	</script>
	
	
	<c:set var="formName" value="etapaFormBean" scope="request" />
	<jsp:include page="privilegestemplate.jsp" />	
	<div class="buttonRow">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title' />"
					onclick="setActionAndSubmit(this.form, 'listEtapa.do2');" />
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key='ipdms.forms.submit.title' />" />
	</div>

</html:form>


<script type="text/javascript">

///////////////////////////////////////////////////////////////
//controlo da checkbox para visualizar opcoes de distribuição//
///////////////////////////////////////////////////////////////		
function showDistribOptions(element){
	if(!element.checked){
		$('distribuicaoId').style.display = "none";			//selectBox
		$('funcao').style.display = "none";			//textbox função
		$('grupo').style.display = "none";			//selectBox grupo
		$('etaparespondida').style.display = "none";	//selectBox respondeuetapa
	} else {				
		$('distribuicaoId').style.display = "inline";
		if($('distribuicaoId').value == distOrgFuncao){
			$('funcao').style.display = "inline";
		}
		if($('distribuicaoId').value == distIdGrupo){
			$('grupo').style.display = "inline";
		}
		if($('distribuicaoId').value == distNumeroEtapa){
			$('etaparespondida').style.display = "inline";
		}
	}
		
}
	
	
//////////////////////////////////////////////////////////////////
//caso a opccao escolhida seja:									//			
//1. Distribuicao para funcao da O.P. 							//
//	 de quem instruiu Processo, é necessário adicionar a funcao	//
//2. Distribuicao Grupo - Varias pessoas, é necessário 			//
//	 adicionar o grupo											//
//3. Distribuicao para quem respondeu a uma etapa, é necessário //
//	 adicionar o numero da etapa respondida						//
//////////////////////////////////////////////////////////////////
function showHideElements(id){	
	
	var newEl;
	
	if(id == distOrgFuncao){
		$('funcao').style.display = 'inline';
		$('grupo').style.display = 'none';
		$('etaparespondida').style.display = 'none';
	} else if(id == distIdGrupo){
		$('grupo').style.display = 'inline';
		$('funcao').style.display = 'none';
		$('etaparespondida').style.display = 'none';
	} else if(id == distNumeroEtapa){
		$('etaparespondida').style.display = 'inline';
		$('grupo').style.display = 'none';
		$('funcao').style.display = 'none';		
	} else {
		$('funcao').style.display = 'none';
		$('grupo').style.display = 'none';
		$('etaparespondida').style.display = 'none';
	}
	
}	

</script>


