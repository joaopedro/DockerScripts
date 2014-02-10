<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<fmt:message key="ipdms.modules.entidade.designacaoplural" var="entidades" />
<fmt:message key="ipdms.aprovacaoregisto.criar.msgAlerta" var="msgAlerta" />

<c:set var="THEMES_DIR"
	value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<script>

function showEntidadesSimplePopup(){
	var action = "${pageContext.request.contextPath}/listEntidadeSimplePopup.do2?method=showPopup";
	action += "&idEntidade=idEntidade";
	action += "&nomeEntidade=entidade_nome";
	action += "&nifEntidade=nifEntidade";
	action += "&nif=${associarEntidadeForm.nifEntidade}";
	action += "&nome=${associarEntidadeForm.designacaoEntidade}";
	action += "&window=winchoose";
	winEntidades = ExtWindow('${entidades}',action,'','html');

	winEntidades.on('close', function( p ) { 

		var nif = document.getElementById("nifEntidade").value;

		var nifEntidade = '${associarEntidadeForm.nifEntidade}';
		if(nifEntidade!='') {
			if( nif != nifEntidade){
				alert('${msgAlerta}');
			}
		}
	});
       
	winEntidades.show();
}

</script>

<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.aprovacaoregisto.criar.titulo" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id="entidadeColabErrorDiv">
	<html:errors />
</div>


<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div><br />

<html:form action="/tarefas/associarEntidade" method="post" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<input type="hidden" name="urlAnterior" value="${urlAnterior}">
<input type="hidden" name="numConteudoSO" value="${associarEntidadeForm.numConteudoSO}"/>
<input type="hidden" name="versaoConteudoSO" value="${associarEntidadeForm.versaoConteudoSO}"/>
<input type="hidden" name="tituloColab" value="${associarEntidadeForm.tituloColab}"/>
<input type="hidden" name="nifColab" value="${associarEntidadeForm.nifColab}"/>
<input type="hidden" name="biColab" value="${associarEntidadeForm.biColab}"/>
<input type="hidden" name="moradaColab" value="${associarEntidadeForm.moradaColab}"/>
<input type="hidden" name="localidadeColab" value="${associarEntidadeForm.localidadeColab}"/>
<input type="hidden" name="designacaoEntidade" value="${associarEntidadeForm.designacaoEntidade}"/>
<input type="hidden" name="nifEntidade" id="nifEntidade" value="${associarEntidadeForm.nifEntidade}"/>
<input type="hidden" name="tipoEntidade" value="${associarEntidadeForm.tipoEntidade}"/>

<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.colaborador' />">
			<fmt:message key="ipdms.aprovacaoregisto.criar.colaborador" />:
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.colaborador' />">
			&nbsp;${associarEntidadeForm.tituloColab}
		</div>
</div>

<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.nif' />">
			<fmt:message key="ipdms.aprovacaoregisto.criar.nif" />:
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.nif' />">
			&nbsp;${associarEntidadeForm.nifColab}
		</div>
</div>

<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.bi' />">
			<fmt:message key="ipdms.aprovacaoregisto.criar.bi" />:
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.bi' />">
			&nbsp;${associarEntidadeForm.biColab}
		</div>
</div>

<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.morada' />">
			<fmt:message key="ipdms.aprovacaoregisto.criar.morada" />:
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.morada' />">
			&nbsp;${associarEntidadeForm.moradaColab}
		</div>
</div>

<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.localidade' />">
			<fmt:message key="ipdms.aprovacaoregisto.criar.localidade" />:
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.localidade' />">
			&nbsp;${associarEntidadeForm.localidadeColab}
		</div>
</div>

<c:if test="${associarEntidadeForm.tipoEntidade == 'C'}">
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.designacaoEntidade' />">
			<fmt:message key="ipdms.aprovacaoregisto.criar.designacaoEntidade" />:
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.designacaoEntidade' />">
			&nbsp;${associarEntidadeForm.designacaoEntidade}
		</div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.nifEntidade' />">
			<fmt:message key="ipdms.aprovacaoregisto.criar.nifEntidade" />:
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.nifEntidade' />">
			&nbsp;${associarEntidadeForm.nifEntidade}
		</div>
	</div>
</c:if>


<div class="row formlabel_sf" style="height: 60px;">
	<div class="leftTab label" style="width: 13%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.entidade' />"><fmt:message key="ipdms.aprovacaoregisto.criar.entidade" /> *</div>
  	
  	<div class="label" style="width: 4%;">
  		<a href="#" onclick="showEntidadesSimplePopup();"><img src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" class="cursorMao" alt="<fmt:message key='ipdms.aprovacaoregisto.criar.entidade' />" title="<fmt:message key='ipdms.aprovacaoregisto.criar.entidade' />" /></a>
  		<input type="hidden" name="idEntidade" id="idEntidade" value="${associarEntidadeForm.idEntidade}"/>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.aprovacaoregisto.criar.entidade' />"><html:text styleClass="textinput" property="nomeEntidade" size="77" styleId="entidade_nome" readonly="true" style="width:97%"/></div>
</div>

<br/>
<div class="buttonRow">
	<input type="submit" class="btForm"
		title="<fmt:message key='ipdms.forms.submit.title'/>"
		value="<fmt:message key='ipdms.forms.submit'/>">		
	<input type="button" class="btFormEscuro"
		title="<fmt:message key='ipdms.forms.cancelar.title'/>"
		value="<fmt:message key='ipdms.forms.cancelar'/>"
		onclick="this.form.action='${pageContext.request.contextPath}${urlAnterior}'; this.form.method.value='prepare'; this.form.submit();">
</div>

</html:form>