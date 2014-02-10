<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.loading" var="loading" />
<fmt:message key="ipdms.modules.entidade.requerente" var="requerente" />
<fmt:message key="ipdms.modules.entidade.morada" var="morada" />
<fmt:message key="ipdms.modules.entidade.extendedRequerente" var="extendedRequerente" />
<fmt:message key="ipdms.modules.entidade.tab.moradaestrangeira" var="moradaestrangeira" />
<fmt:message key="ipdms.modules.entidade.tab.entidaderelation" var="entidaderelation" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.forms.submit" var="submit" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" />
<fmt:message key="ipdms.modules.entidade.designacaosingular" var="entidade" />
<fmt:message key="ipdms.modules.entidade.eliminar.single.confirm" var="confirm" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.modules.entidade.activa.sim" var="activa" />
<fmt:message key="ipdms.modules.entidade.activa.nao" var="eliminada" />

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/modules/entidade/js/entidadeutil.js"></script>
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<LINK href='${pageContext.request.contextPath}/ipdms/modules/entidade/theme/entidade.css' type='text/css' rel='stylesheet' />
 <c:set var="testVar" value="${entidadeFormBean.tipoEntidade}" />
<script type="text/javascript">

var tabs2;
var tituloReqLoad='${requerente} - ${loading}';
var tituloMorLoad='${morada} - ${loading}';

Ext.onReady(function(){

	var createNewUrlParams='';
	if('${param.createNewEntidade}' == 'true'){
		$('nomeLabel').value ='${param.newNome}';
		$('nifLabel').value ='${param.newNif}';		
		createNewUrlParams='&createNewEntidade=true';
		createNewUrlParams+='&newSexo=${param.newSexo}';
		createNewUrlParams+='&newBi=${param.newBi}';
		createNewUrlParams+='&newDataNascimento=${param.newDataNascimento}';
	}
	
    //TABS EXT
     tabs2 = new Ext.TabPanel({

 	   id         :'entidadeTabPanel',
       renderTo   : 'entidadetabs',      
       autoWidth  : true,
       activeTab  : 0,
       //plain:false,
       defaults   :{autoScroll: true, autoHeight: true, autoWidth: true},
       items      :[
        	 <c:choose>
        		<c:when test="${entidadeFormBean.tipoEntidade eq '1'}">		
        		{   
            		id:'req',
                    title: '${requerente}',
                    autoLoad: {url: 'editEntidade.do2', text:tituloReqLoad, params: 'method=loadEntidadeSingularForm'+createNewUrlParams, scripts: true}
                },
                	<c:if  test="${extendedSingular}">
               		{   
                		id:'entededReq',
                        title: '${extendedRequerente}',
                        autoLoad: {url: 'editEntidade.do2', text:tituloReqLoad, params: 'method=loadEntidadeSingularForm', scripts: true}
                    },
                	</c:if>
                { id:'mor',
                    title: '${morada}',
                    autoLoad: {url: 'editEntidade.do2', text:tituloMorLoad, params: 'method=loadMoradaForm', scripts: true}
                }				
        		</c:when>
        		<c:when test="${entidadeFormBean.tipoEntidade eq '2'}">
        		{	
            		id:'req',
                    title: '${requerente}',
                    autoLoad: {url: 'editEntidade.do2',text:tituloReqLoad, params:'method=loadEntidadeColectivaForm', scripts: true}
                },{ 
                    id:'mor',
                    title: '${morada}',
                    autoLoad: {url: 'editEntidade.do2', text:tituloMorLoad,params:'method=loadLocaisForm', scripts: true}
                }
        		</c:when>
        	</c:choose>			
        	,{
                title: '${moradaestrangeira}',
                autoLoad: {url: 'editEntidade.do2', text:'${moradaestrangeira} - ${loading}', params: 'method=loadMoradaEstrangeiraForm', scripts: true}
            }, {
                title: '${entidaderelation}',
                autoLoad: {url: 'editEntidade.do2', text:'${entidaderelation} - ${loading}', params: 'method=loadEntidadeRelations', scripts: true}
            }
        ]
    });

     dateFormatCheckonLoad();
     
	//TODO - alterar
    function handleActivate(tab){
        alert(tab.title + ' was activated.');
    }
	
}); 


function decisao(btn){
	if(btn=='yes'){
		 setActionAndSubmit(document.forms[0], '${pageContext.request.contextPath}/deleteEntidade${param.deletePopUp}.do2?id=${entidadeFormBean.id}');
		 }
	else{
		return false;
		}

}


//actualizar tabs
function actualizaTabs(val){

	if(val.value==1){//singular
		tabs2.getItem('req').getUpdater().update({url: 'editEntidade.do2', params: 'method=loadEntidadeSingularForm', scripts: true});
		tabs2.getItem('mor').getUpdater().update({url: 'editEntidade.do2', params: 'method=loadMoradaForm', scripts: true});
	}else if(val.value==2){//colectica
		tabs2.getItem('req').getUpdater().update({url: 'editEntidade.do2', params: 'method=loadEntidadeColectivaForm', scripts: true});
		tabs2.getItem('mor').getUpdater().update({url: 'editEntidade.do2', params: 'method=loadLocaisForm', scripts: true});

		}
		;

}

</script>

<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.modules.entidade.edit" />';	 
</script>

<c:if test="${param.saveAction != null}">
<style>
	html{	
		overflow:auto;	/* Overflow: hide content, i.e. now scrollbars */
	}
</style>
</c:if>
<c:set var="entidade_locale" value="${sessionScope['ipdms.entidade.locale']}" scope="request" />
<body style="overflow: auto;">
<%-- FORM TITLE --%>
<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.modules.entidade.edit" />';	 
</script>
<div class="row" style="text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.modules.entidade.edit" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<%-- DISPLAY ERRORS --%>
<div id="MensagemErro">
	<html:errors />
</div>

<c:set var="nameTabMorada"><fmt:message key="ipdms.modules.entidade.singular.tab.morada" /></c:set>
<c:set var="nameTabLocais"><fmt:message key="ipdms.modules.entidade.colectivo.tab.morada" /></c:set>

<c:set var="saveAction">
	<c:choose>
		<c:when test="${param.saveAction != null}">${param.saveAction}</c:when>
		<c:otherwise>/saveEntidade.do2</c:otherwise>
	</c:choose>
</c:set>

<c:set var="urlAnterior" value="${urlAnterior}" scope="session"/>

<%-- FORM ENTIDADE --%>
<html:form action="${saveAction}" onsubmit="dateFormatCheckonSubmit();">

	<input type="hidden" name="id1" value="9819212" />
	<input type="hidden" name="tipoEntidadeAntigo" id="tipoEntidadeAntigo" value="${entidadeFormBean.tipoEntidade }" />

	<html:hidden property="urlAnterior" value="${urlAnterior}"/>
	<c:if test="${param.saveAction != null}">
		<input type="hidden" name="saveAction" value="${param.saveAction}" />
	</c:if>
	
<div style="margin-bottom:3%;">	
	<div class="row" style="padding-bottom:2%;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.tipoentidade' />">
			<label for="tipoLabel"><fmt:message key="ipdms.modules.entidade.tipoentidade" /> *</label>
	  	</div>
	  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.tipoentidade' />">
	  		<%-- TODO por este select dinamico--%>
			<html:select property="tipoEntidade" onchange="actualizaTabs(this);" styleId="tipoLabel">
				<html:optionsCollection name="tipoEntidadeOptions" value="value" label="title"/>
			</html:select>		
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key="ipdms.modules.entidade.nome" />">
			<label for="nomeLabel"><fmt:message key="ipdms.modules.entidade.nome" /> *</label>
	  	</div>
	  	
	  	<div class="label" style="width: 87%;" title="<fmt:message key="ipdms.modules.entidade.nome" />">
	  		<html:text property="nome" size="80" maxlength="80" styleId="nomeLabel" />	
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key="ipdms.modules.entidade.nif"/>">
			<label for="nifLabel"><fmt:message key="ipdms.modules.entidade.nif"/></label>
	  	</div>
	  	
	  	<div class="label" style="width: 87%;" title="<fmt:message key="ipdms.modules.entidade.nif"/>">
	  		<html:text property="nif" size="10" maxlength="25" styleId="nifLabel" />
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key="ipdms.modules.entidade.pais" />">
			<label for="paisLabel"><fmt:message key="ipdms.modules.entidade.pais" /> *</label>
	  	</div>
	  	
	  	<div class="label" style="width: 87%;" title="<fmt:message key="ipdms.modules.entidade.pais" />">
	  		<html:select property="siglaPais" styleId="paisLabel">
				<html:option value=""><fmt:message key="ipdms.forms.select.default" /></html:option>
				<html:optionsCollection name="paisOptions" value="value" label="title"/>
			</html:select>
	  	</div>
	</div>

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.idexterno'/>">
			<label for="idExternoLabel"><fmt:message key="ipdms.modules.entidade.idexterno"/></label>
	  	</div>
	  	
	  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.idexterno'/>">
	  		<html:text property="idExterno" size="10" maxlength="25" styleId="idExternoLabel"/>
	  	</div>
	</div>

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.estado'/>">
			<fmt:message key="ipdms.modules.entidade.estado"/>:
	  	</div>
	  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.estado'/>">
		  	<c:choose>
		  		<c:when test="${entidadeFormBean.activa}">${activa}</c:when>
		  		<c:otherwise>${eliminada}</c:otherwise>
		  	</c:choose>
	  	</div>
	</div>
</div>	

<div id="entidadetabs" style="overflow: hidden"></div>
	<br/>
	<div class="buttonRow">
		<c:if test="${!IPDMSInteropReceiver}">
			<html:button styleId="apagar" property="apagar" onclick="cancelar(event,'${entidade}','${confirm}',decisao,'${sim}','${nao}');" styleClass="btForm" title="${eliminar} ${entidade}">${eliminar}</html:button>
		</c:if>
		<html:button styleId="back" property="back" onclick="setActionAndSubmit(this.form, '${pageContext.request.contextPath}/${urlAnterior}');" styleClass="btForm" title="${anteriorTitle}">${anterior}</html:button>
		<c:if test="${!IPDMSInteropReceiver}">
			<html:submit styleClass="btForm" styleId="submitBt" title="${submitTitle}">${submit}</html:submit>
		</c:if>	
	</div>
</html:form>
</body>