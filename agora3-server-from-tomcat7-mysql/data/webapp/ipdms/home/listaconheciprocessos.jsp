<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.myprocesses.darconhecimento.listaprocessos" var="title" />
<fmt:message key="ipdms.processo.designacaoplural" var="processos" />
<fmt:message key="ipdms.myprocesses.darconhecimento.conhecidos" var="conhecidos" />
<fmt:message key="ipdms.seleccionar" var="seleccionar" />
<fmt:message key="ipdms.todos" var="todos" />
<fmt:message key="ipdms.nenhum" var="nenhum" />
<fmt:message key="ipdms.myprocesses.darconhecimento.numprocesso" var="numprocesso" />
<fmt:message key="ipdms.myprocesses.darconhecimento.variante" var="variante" />
<fmt:message key="ipdms.myprocesses.darconhecimento.etapa" var="etapa" />
<fmt:message key="ipdms.myprocesses.darconhecimento.dataEntrada" var="dataEntrada" />
<fmt:message key="ipdms.myprocesses.darconhecimento.conhecdadopor" var="conhecdadopor" />
<fmt:message key="ipdms.myprocesses.darconhecimento.dataenvioparaconhec" var="dataenvioparaconhec" />
<fmt:message key="ipdms.myprocesses.darconhecimento.consultar" var="consultar" />
<fmt:message key="ipdms.myprocesses.darconhecimento.consultarprocesso" var="consultarprocesso" />
<fmt:message key="ipdms.myprocesses.darconhecimento.tomeiConhecimento" var="tomeiConhecimento" />
<fmt:message key="ipdms.myprocesses.darconhecimento" var="darconhecimento" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ipdms/js/ext/resources/css/messageEditCreate.css" /> 

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/messageEditCreate.js"></script>

<script type="text/javascript">

function Checkboxes(state) {
	
    $$('input[type="checkbox"][id^="checkConhec"]').each(function filter(item) {
                {
                item.checked=state;
                }
    });
    
}   

	var rules = {
		'#worklist tbody tr': function(el) {
			el.onmouseover = function(){
				Element.addClassName(this,'active-row');				
			};
			el.onmouseout = function() {
				Element.removeClassName(this, 'active-row');
			};
		}
	};
	Behaviour.register(rules);
</script>
<script type="text/javascript">	
	document.title = '${productName} - ${title}';	 
</script>
<div class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${title}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id='extInfo' ></div>
<script>
var darConhec;
if(${empty darConhec}){
	conhec=false;	
}
else	
	conhec=true;

	if(conhec==true){
	Ext.example.msg('${processos}','${conhecidos}');
}
</script>

<div class="mensagenErro1"><html:errors /></div>

<html:form action="darconhecim.do2" method="get" styleId="darConheciForm">

<c:if test="${not empty listaProc}">
<span class="formlabel_select" >
	${seleccionar}: <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="${todos}">${todos}</a>,
				   <a href="#"  onclick="Checkboxes(false);" class="formlabel_select" title="${nenhum}">${nenhum}</a>
</span><br/><br/>
</c:if>
<input type="hidden" name="urlAnterior" value="listaconhecim.do2?nrconteudo=${nrconteudo}"/>


<display:table id="listaProcessos"  name="listaProc" pagesize="20"
		requestURI="" htmlId="worklist">

		<display:column title="${numprocesso}" sortable="true"
			sortName="idProcessoEntidade"
			property="servicoOnline.idProcessoEntidade"></display:column>
		<display:column title="${variante}" sortable="true" sortName="titulo"
			property="servicoOnline.variante.titulo"></display:column>
		<display:column title="${etapa}" sortable="true" sortName="titulo"
			property="etapa.titulo"></display:column>
		<display:column title="${dataEntrada}" sortable="true"
			sortName="dataPreenchimento">
			<fmt:formatDate
				value="${listaProcessos.servicoOnline.dataPreenchimento.time}"
				pattern="dd-MM-yyyy HH:mm:ss" />
		</display:column>
		<display:column title="${conhecdadopor}" sortable="true"
			sortName="" property="colaboradorEmitente.titulo">
		</display:column>
		<display:column title="${dataenvioparaconhec}"
			sortable="true" sortName="dataEnvio" style="width:20%;">
			<fmt:formatDate value="${listaProcessos.dataEnvio.time}"
				pattern="dd-MM-yyyy HH:mm:ss" />
		</display:column>
		<display:column title="${consultar}" sortable="false" style="width:4%" class="alignCenter">
			<a href="${pageContext.request.contextPath}/visualizaprocesso.do2?id=${listaProcessos.id}"> <img
				src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png"
				alt="${consultar}" class="cursorMao" style="border: none;" title="${consultarprocesso} ${listaProcessos.servicoOnline.idProcessoEntidade}"/> </a>

		</display:column>
		<display:column title="${tomeiConhecimento}" sortable="false" class="alignCenter"
			sortName="dataEnvio" style="width:6%">
			<html:multibox style="checks" property="id"
				value="${listaProcessos.id}" styleId="checkConhec"></html:multibox>

		</display:column>
		<display:footer>
			<td colspan="7" class="tableFooter">&nbsp;</td>
			<td class="tableFooter alignCenter"><img
				src="${pageContext.request.contextPath}/images/icon/icon-visto.png"
				onclick="$('darConheciForm').submit();" class="cursorMao" alt="${darconhecimento}"
				title="${darconhecimento}" /></td>
		</display:footer>


	</display:table>
	<br />
	<br />
<div class="buttonRow">
		<input class="btForm" type="button" value="${anterior}" 
				onclick="window.location.href='${pageContext.request.contextPath}/${urlAnterior}';" title="${anteriorTitle}"/>
</div>


</html:form>


