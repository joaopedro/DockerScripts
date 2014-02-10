<%@ taglib prefix="html" uri="/tags/html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<fmt:message key='ipdms.colaborador.designacaosingular' var="colaborador"/>
<fmt:message key='ipdms.colaborador.multiplos' var="multiplosColaboradores"/>
<fmt:message key='ipdms.organica.designacaoplural' var="organicas"/>
<fmt:message key='ipdms.forms.seguinte' var="seguinte"/>
<fmt:message key='ipdms.forms.seguinte.title' var="seguinteTitle"/>
<fmt:message key='ipdms.forms.cancelar' var="cancelar"/>
<fmt:message key='ipdms.forms.cancelar.title' var="cancelarTitle"/>
<fmt:message key='ipdms.so.gestaoAusencias.pedidos' var="pedidos"/>
<fmt:message key='ipdms.so.gestaoAusencias.cancelarProcesso.confirm' var="cancelarConfirm"/>
<fmt:message key='webflow.sim' var="sim"/>
<fmt:message key='webflow.nao' var="nao"/>

<bean:define id="ausencia" name="gestaoAusenciasFlowBean" property="ausencia" />

<script src='${pageContext.request.contextPath}/ipdms/js/swf-ajax.js' type="text/javascript"></script>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<script type="text/javascript">
    
function decisao(btn){
	
	if(btn=='yes'){

		ajaxSubmitReferer(evento,'${referer}');
		 }
	else{
		return false;
	    }

}	

Ext.onReady(function(){
	//cololcar formato de data caso nao haja datas reais
	dateFormatCheckonLoad();
});

</script>


<style type="text/css">

	.extended_form_field{
		border:1px solid black;
		padding:5px;
	}
	
</style>

<script>


function parseList(id){
	var e = document.getElementById(id);	
	if (e != null){
		if(e.innerHTML.indexOf(";") != -1){
			e.innerHTML = e.innerHTML.replace(/;/g,', ');
			alert(e.innerHTML);
			e.innerHTML = e.innerHTML.substring(0,e.innerHTML.lastIndexOf(','));			
		}				
	}	
}

function showOrganicaMultiple(){
	var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
	paramts = "valuePlaceOlder=organica.multiple.parent";
	paramts += "&descPlaceOlder=organica.multiple.desc";
	paramts += "&window=winchoose&multiple=true";
	
	winOrgMulti=ExtWindow('${organicas}',action,paramts,'ext');
	winOrgMulti.on('close',function(){postOrganicaMultipleFunction();})
}

function postOrganicaMultipleFunction(){
	parseList('organica.multiple.desc');
}


function showOrganicaColaboradoresMultiple(){
	var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
	paramts = "valuePlaceOlder=colaboradores.multiple.parent";
	paramts += "&descPlaceOlder=colaboradores.multiple.desc";
	paramts += "&window=winchoose&multiple=true";

	winColMulti=ExtWindow('${multiplosColaboradores}',action,paramts,'ext');
	winColMulti.on('close',function(){postOrganicaColaboradoresMultipleFunction();});
}

function postOrganicaColaboradoresMultipleFunction(){
	parseList('colaboradores.multiple.desc');
}


function showOrganicaColaboradores(){
	var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
	paramts = "valuePlaceOlder=colaboradores.parent";
	paramts += "&descPlaceOlder=colaboradores.desc";
	paramts += "&window=winchoose";
	paramts += "&node=${ausencia.loggedUserOrganicaId}";
	paramts += "&includeParent=true";
	
	winCol=ExtWindow('${colaborador}',action,paramts,'ext');
	winCol.on('close',function(){postOrganicaColaboradoresFunction();});
}

function postOrganicaColaboradoresFunction(){
	parseList('colaboradores.desc');
}

</script>
<logic:notPresent name="_resumo" scope="request">
	<html:form	action="applicationFlow"
				method="post"
				enctype="multipart/form-data"
				onsubmit="dateFormatCheckonSubmit();" >	
		<br />
		
		<input	type="hidden"
				name="_flowExecutionKey"
				value="${flowExecutionKey}" />
				
		<html:errors />
		
	<div class="webflow_formdiv">
	
		<table>
			<tr>
				<td width="200">
					<span  class="formlabel" title="<fmt:message key='ipdms.so.gestaoAusencias.requeridoPor' />">
						<fmt:message key="ipdms.so.gestaoAusencias.requeridoPor" />
					</span>
				</td>
				<td width="50">&nbsp;</td>
				<td class="formfield" width="400">
<!--
TODO
remover hardcoded values dos :radio
* alterar tb no bean
-->					
					<html:radio	property="ausencia.requeridoPor"
								value="_proprio_"
								styleId="requeridoPorProprio"
								onchange="document.getElementById('colaboradorSubstituidoRow').style.visibility = 'hidden';">
						<label for="requeridoPorProprio" title="<fmt:message key='ipdms.so.gestaoAusencias.proprio'/>">
							<fmt:message key="ipdms.so.gestaoAusencias.proprio"/>
						</label>
					</html:radio>
					
					<html:radio	property="ausencia.requeridoPor"
								value="_outro_colaborador_"
								styleId="requeridoPorOutroColaborador"
								onchange="document.getElementById('colaboradorSubstituidoRow').style.visibility = '';">
						<label for="requeridoPorOutroColaborador" title="<fmt:message key='ipdms.so.gestaoAusencias.outroColaborador' />">
							<fmt:message key="ipdms.so.gestaoAusencias.outroColaborador" />
						</label>
					</html:radio>
				</td>
				<td />
			</tr>
			<tr>
				<td>
					<span  class="formlabel" title="<fmt:message key='ipdms.so.gestaoAusencias.nome'/>">
						<fmt:message key="ipdms.so.gestaoAusencias.nome"/>
					</span>
				</td>
				<td><img src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"
						 style="visibility:hidden;" alt="<fmt:message key='ipdms.forms.pesquisar' />" title="<fmt:message key='ipdms.forms.pesquisar' />" />
				</td>
				<td class="formfield extended_form_field" title="<fmt:message key='ipdms.so.gestaoAusencias.nome'/>">
						<bean:write name="gestaoAusenciasFlowBean" property="ausencia.colaboradorRequerenteNome" />
				</td>
			</tr>
			<!-- colaborador substituido -->
			<tr id="colaboradorSubstituidoRow" style="visibility: <bean:write name="gestaoAusenciasFlowBean" property="ausencia.colaboradorSubstituidoVisibility" />">
				<td>
					<span  class="formlabel" title="<fmt:message key='ipdms.so.gestaoAusencias.colaboradorSubstituido'/>">
						<fmt:message key="ipdms.so.gestaoAusencias.colaboradorSubstituido"/>
					</span>
				</td>
				<td style="text-align:right;">
					<a class="formlabel" href="#" onclick="showOrganicaColaboradores();">
						<img	style="vertical-align: bottom"
								src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"
								onclick=""
								class="cursorMao"
								alt="<fmt:message key='ipdms.forms.pesquisar' />"
								title="<fmt:message key='ipdms.forms.pesquisar' />" />
					</a>
				</td>
				<td class="formfield extended_form_field" title="<fmt:message key='ipdms.so.gestaoAusencias.colaboradorSubstituido'/>">
					<div id="colaboradores.desc">
						<bean:write name="gestaoAusenciasFlowBean" property="ausencia.colaboradorSubstituidoNome" />
					</div>
					<html:hidden	styleId="colaboradores.parent"
									property="ausencia.colaboradorSubstituido" />
				</td>
			</tr>
			<tr>
				<td>
					<span  class="formlabel" title="<fmt:message key='ipdms.so.gestaoAusencias.periodoDeAusencia'/>">
						<fmt:message key="ipdms.so.gestaoAusencias.periodoDeAusencia"/>
					</span>
				</td>
				<td style="text-align:right;">
					<span class="formlabel" title="<fmt:message key='ipdms.so.gestaoAusencias.de'/>">
						<fmt:message key="ipdms.so.gestaoAusencias.de"/>
					</span>
					
				</td>
				<td>
					<html:text	property="ausencia.dataInicioAusencia" 
								styleId="dataInicioAusencia"
								maxlength="10"
								size="10"
								styleClass="date" />
					<img	style="vertical-align: bottom"
							id="dataInicioAusenciaButton"
							src="${pageContext.request.contextPath}/images/icon/icon-calendario.png"
							onclick=""
							class="cursorMao"
							alt="<fmt:message key="ipdms.so.gestaoAusencias.dataInicio"/>"
							title="<fmt:message key="ipdms.so.gestaoAusencias.dataInicio"/>" />
	                <script type='text/javascript'>
	                	Calendar.setup({ inputField : 'dataInicioAusencia', ifFormat : '%d-%m-%Y', showsTime : false });
	                	Calendar.setup({ inputField : 'dataInicioAusencia', ifFormat : '%d-%m-%Y', button : "dataInicioAusenciaButton" });
					</script>
					
					<span style="display:inline;" class="formlabel" title="<fmt:message key='ipdms.so.gestaoAusencias.a'/>">
						&nbsp; <fmt:message key="ipdms.so.gestaoAusencias.a"/>
					</span>
					
					<html:text	property="ausencia.dataFimAusencia" 
								styleId="dataFimAusencia"
								maxlength="10"
								size="10"
								styleClass="date" />
					<img	style="vertical-align: bottom"
							id="dataFimAusenciaButton"
							src="${pageContext.request.contextPath}/images/icon/icon-calendario.png"
							onclick=""
							class="cursorMao"
							alt="<fmt:message key='ipdms.so.gestaoAusencias.dataFim' />"
							title="<fmt:message key="ipdms.so.gestaoAusencias.dataFim" />" />
	                <script type='text/javascript'>
	                	Calendar.setup({ inputField : 'dataFimAusencia', ifFormat : '%d-%m-%Y', showsTime : false });
	                	Calendar.setup({ inputField : 'dataFimAusencia', ifFormat : '%d-%m-%Y', button : "dataFimAusenciaButton" });
					</script>
					
				</td>
			</tr>
			<tr><td><br /></td></tr>
			<tr><td colspan="4" class="titulo2">
					<fmt:message key="ipdms.so.gestaoAusencias.2substituto"/></td></tr>
			<!-- organica(s) substituta(s) -->
			<tr>
				<td>
					<span  class="formlabel" title="<fmt:message key='ipdms.so.gestaoAusencias.nivelHierarquico'/>">
					<fmt:message key="ipdms.so.gestaoAusencias.nivelHierarquico"/></span></td>
				<td style="text-align:right;">
					<a class="formlabel" href="#" onclick="showOrganicaMultiple();" id="windOrgMulti">
						<img	style="vertical-align: bottom"
								src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"
								onclick=""
								class="cursorMao"
								alt="<fmt:message key='ipdms.forms.pesquisar'/>"
								title="<fmt:message key='ipdms.forms.pesquisar'/>" />
					</a>
				</td>
				<td class="formfield extended_form_field" title="<fmt:message key='ipdms.so.gestaoAusencias.nivelHierarquico'/>">
					<div id="organica.multiple.desc">
						<bean:write name="gestaoAusenciasFlowBean" property="ausencia.niveisHierarquicosSubstitutosDescriptionAsString" />
					</div>
					<html:hidden	styleId="organica.multiple.parent"
									property="ausencia.niveisHierarquicosSubstitutos" />
				</td>
			</tr>
			<!-- colaborador(es) substituto(s) -->
			<tr>
				<td>
					<span  class="formlabel" title="<fmt:message key='ipdms.so.gestaoAusencias.nome'/>">
						<fmt:message key="ipdms.so.gestaoAusencias.nome"/></span></td>
				<td style="text-align:right;">
					<a class="formlabel" href="#" onclick="showOrganicaColaboradoresMultiple();" id="windColMulti">
						<img	style="vertical-align: bottom"
								src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"
								onclick=""
								class="cursorMao"
								alt="<fmt:message key='ipdms.forms.pesquisar'/>"
								title="<fmt:message key='ipdms.forms.pesquisar'/>" />
					</a>
				</td>
				<td class="formfield extended_form_field" title="<fmt:message key='ipdms.so.gestaoAusencias.nome'/>">
					<div id="colaboradores.multiple.desc">
						<bean:write name="gestaoAusenciasFlowBean" property="ausencia.colaboradoresSubstitutosDescriptionAsString" />
					<!-- 
					 -->
					</div>
					
					<html:hidden	styleId="colaboradores.multiple.parent"
									property="ausencia.colaboradoresSubstitutos" />
			</tr>
		</table>
	
		<br /><br />
		
		<div class="buttonRow">
							
			<html:submit	property="_eventId_next" title="${seguinteTitle}"
							value="${seguinte}"
							styleClass="btForm" />
			<!--
							onkeyup="doAjax(event);" 
							onmouseup="ajaxSubmit(event);" 
			 -->
							
			<html:button	property="_eventId_cancel"  title="${cancelarTitle}"
							value="${cancelar}" 
							styleClass="btFormEscuro"
							onclick="cancelar(event,'${pedidos}','${cancelarConfirm}',decisao,'${sim}','${nao}');" />
		</div>
		
	</div>
		
	</html:form>
</logic:notPresent>

<%------------------------ RESUMO ------------------------%>
<logic:present name="_resumo" scope="request">

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;">
  		<fmt:message key="ipdms.so.gestaoAusencias.requeridoPor" />:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;">
  	
	<c:choose>
		<c:when test="${ausencia.requeridoPor == '_proprio_'}">
			<fmt:message key="ipdms.so.gestaoAusencias.proprio" />
		</c:when>
		<c:otherwise>
			<fmt:message key="ipdms.so.gestaoAusencias.outroColaborador" />
		</c:otherwise>
	</c:choose>
  		
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;">
  		<fmt:message key="ipdms.so.gestaoAusencias.nome" />:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" >
  		${ausencia.colaboradorRequerenteNome}
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;">
  		<fmt:message key="ipdms.so.gestaoAusencias.colaboradorSubstituido" />:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" >
  		${ausencia.colaboradorSubstituidoNome}
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;">
		<fmt:message key="ipdms.so.gestaoAusencias.nivelHierarquico"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" >
  		${ausencia.niveisHierarquicosSubstitutosDescriptionAsString} &nbsp;
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;">
		<fmt:message key="ipdms.so.gestaoAusencias.colaboradorSubstituto"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" >
  		${ausencia.colaboradoresSubstitutosDescriptionAsString} &nbsp;
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;">
		<fmt:message key="ipdms.so.gestaoAusencias.periodoDeAusencia"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" >
  		
  		<fmt:message key="ipdms.so.gestaoAusencias.de"/>
		<bean:write name="gestaoAusenciasFlowBean" property="ausencia.dataInicioAusencia" format="dd-MM-yyyy" />
		
		<fmt:message key="ipdms.so.gestaoAusencias.a"/>
		<bean:write name="gestaoAusenciasFlowBean" property="ausencia.dataFimAusencia" format="dd-MM-yyyy" />
  	
	</div>
</div>

<br />&nbsp;
<br />&nbsp;
<br />&nbsp;

</logic:present>

