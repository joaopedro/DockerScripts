<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />

<!-- CODIGO EXT QUE TRATA DOS DRAG AND DROPS DE FUNÇÕES -->
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomStatusbar.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/dragndropGridpanels.js" ></script>
<script src="${JS_DIR}/ext/ExtContentIPDMS/CustomStatusBar.js"></script>

<fmt:message key="ipdms.grupo.mainStatus.msg" var="statusMsg"/>
<fmt:message key="ipdms.grupo.variantesDisponiveis" var="variantesDisponiveis"/>
<fmt:message key="ipdms.grupo.variantesEscolhidas" var="variantesEscolhidas"/>
<fmt:message key="ipdms.grupo.nome" var="nome"/>
<fmt:message key="ipdms.grupo.descricao" var="descricao"/>
<fmt:message key="ipdms.grupo.ddText" var="ddText"/>
<fmt:message key="ipdms.grupo.colaborador" var="colaborador"/>

<script type="text/javascript">
	
	var enableDragDrop = true;
	
	var exist;

	function dropPostActions(draggable, type){
		var action = null;
		var size=0;

		
		if(type=='add')
			action = 'addVarianteGrupo.do2';
		else
			action = 'removeVarianteGrupo.do2';

		var params = "varianteId="+draggable;
	
		var myajax = new Ajax.Updater( {
			success: "asd"},
				'${pageContext.request.contextPath}/'+action,
				{method: 'get', parameters: params,
				 enconding:'charset=ISO-8859-1',
				 onComplete: updatedBindedFuncoes} );
	}

	function updatedBindedFuncoes(response){
		
		//Actualizar status bar do Panel
		// Update the status bar later in code:
		var sb = Ext.getCmp('infoarea');
		sb.setStatus({
		    text: response.responseText,
		    iconCls: 'ok-icon',
		    clear: true // auto-clear after a set interval
		});

	}

	function verifyFuncAction(funcId){

		return false;

	}

	
</script>


<script type="text/javascript">

	//Barra de status com mensagem inicial
	var mainStatus= "${statusMsg}";

	//Titulo do gridPanel1
	var titledisp='${variantesDisponiveis}';
	//Titulo do gridPanel2
	var titleesc='${variantesEscolhidas}';
	//Titulos das colunas(2)
	var headerCol1='${nome}';
	var headerCol2='${descricao}';
	//Mensagem para ao arrastar elementos de uma gridpanel para outra
	var ddtext= ' ${ddText}';


	//Dados de funcoes disponiveis e escolhidas para a organica
	  var elemDisp = {
				records : [
							<c:forEach items="${grupoVarianteFormBean.variantes}" varStatus="i" var="elemento">
							{ name : ' <img src="${IMG_DIR}/icon/icon-user.png" style="vertical-align:middle; padding-right:5px;" alt="${colaborador}" title="${colaborador}" />${elemento.titulo}', descricao: '${elemento.descricao}' ,id : ${elemento.numeroConteudo}}
							 <c:if test="${!i.last}">,</c:if>
							</c:forEach>
						   ]
			};


			var elemEsc = {
					records : [
								<c:forEach items="${grupoVarianteFormBean.grupoVariante.variantes}" varStatus="i" var="elemento">
								{ name : ' <img src="${IMG_DIR}/icon/icon-user.png" style="vertical-align:middle; padding-right:5px;" alt="${colaborador}" title="${colaborador}" />${elemento.titulo}', descricao: '${elemento.descricao}' ,id : ${elemento.numeroConteudo}}
								<c:if test="${!i.last}">,</c:if>
								</c:forEach>
								]
			};	

	</script>

<html:form action="/saveGrupoVariante" method="post" styleClass="form">
<html:hidden property="grupoVariante.id"/>
<div class="row" style="text-align:left; padding-top:0px;">
	<table style="border:none" cellpadding="0" cellspacing="0" width="100%" >
		<tbody>
		<!-- TÍTULOS -->
		<tr>
			<td>
				<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
					  <tr>
					    <td class="titulo2"><fmt:message key="ipdms.variante.identificacao" /></td>
					  </tr>
					</tbody>
				</table>					
			</td>
		</tr>
	</tbody>
	</table>
</div>


	<div class="row" style="padding-bottom:20px;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.variante.titulo' />">
	  		<label for="titulo"><fmt:message key="ipdms.variante.titulo" /> *</label>
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.variante.titulo' />">
	  		<html:text property="grupoVariante.titulo" size="60" maxlength="100" styleId="titulo"/>
	  	</div>
	</div>
	
<div class="buttonRow">
	<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
				onclick="setActionAndSubmit(this.form, 'listGrupoVariante.do2');">
	<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key='ipdms.forms.submit.title'/>">
</div>	
<br />
<div id="panel" style="width: 90%"></div>
</html:form>