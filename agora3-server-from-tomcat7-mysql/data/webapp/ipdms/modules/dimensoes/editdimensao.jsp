<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.dimensoes.imprimir.ambos" var="ambos" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.dimensoes.imprimir.fichas" var="imprimirFichas" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.dimensoes.designacaoplural" var="dimensoes" />

<SCRIPT src="${pageContext.request.contextPath}/ipdms/modules/dimensoes/js/dimensao.js"
	type="text/javascript"></script>
	
<script>
function imprimirDim(event,title,message,callBack){

	//cancelar resposta á notificacao//
		Ext.onReady(function(){
		
			evento=event;//variavel usada no ajaxsubmitreferer
			// the 'fn' for the message box can then reset the form or not based on the users selection
			Ext.MessageBox.show({
				title:title,
				msg: message,
				buttons: {yes:'PDF', no:'${ambos}', ok:'Word', cancel:'${cancelar}'},
				modal : true,
				fn: callBack,
				animEl: event.target,
				icon: Ext.MessageBox.QUESTION
			});
	    

		});
}


function decisaoprint(btn)
{
	var tipo = "?type=";
	
	 		
	if(btn=='yes') {
		tipo+="pdf";
		//document.deleteForm.action='imprimirFichaDimensao.do2?multi=true&type=word';
		//document.deleteForm.submit();
	}
	else if(btn=='ok') {
		tipo+="word";
	}
	else if(btn=='no') {
		tipo+="ambos";
	}
	else	
		return false;

	var ncDim = "${dimensaoForm.numeroConteudo}";
	var dimensao = "&ncDim="+ncDim;

	var action = "${pageContext.request.contextPath}/gerarFicheirosDimensao.do2";
	action += tipo;
	action += dimensao;
	action += "&window=winchoose";

	winValorDim = ExtWindowSizeParam('${imprimirFichas}',
			action,
			'',
			'html',
			450, //width
			300	 //height
			);
	
	}

function cancelarDim(event,title,message,callBack){

	//cancelar resposta á notificacao//
	Ext.onReady(function(){
		
			evento=event;//variavel usada no ajaxsubmitreferer
			// the 'fn' for the message box can then reset the form or not based on the users selection
			Ext.MessageBox.show({
				title:title,
				msg: message,
				buttons: {yes:'${sim}', no:'${nao}'},
				modal : true,
				fn: callBack,
				animEl: event.target,
				icon: Ext.MessageBox.QUESTION
			});
	    

	});
}

function decisaovoltar(btn)
{
	 		
	if(btn=='yes') {
		document.dimensaoForm.action='listDimensoes.do2';
		document.dimensaoForm.submit();
	}
	else
		return false;
}
</script>

<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.dimensoes.edit.titulo" />';	 
</script>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />

<LINK href='${THEMES_DIR}/tree/folder-tree-static.css' type=text/css rel=stylesheet>

<div class="row" style="padding-top:0; text-align:left;">
	<table border="0" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.dimensoes.criar" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id="dimensaoErrorDiv">
	<html:errors />
</div>

<html:form action="/saveDimensao" method="post" styleClass="form" enctype="multipart/form-data">
<input type="hidden" name="method" value="save"/>

<!-- DIV DO FORMULÁRIO -->
			<div class="row" style="padding-bottom:2%;">
				<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
			  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
			  	</div>
			</div>

			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.dimensoes.edit.designacao' />">
					<label for="designacao"><fmt:message key="ipdms.dimensoes.edit.designacao" /> *</label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.dimensoes.edit.designacao' />">
					<html:text property="designacao" styleId="designacao" style="width: 90%; " maxlength="100"/>
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.dimensoes.edit.sigla' />">
					<label for="sigla"><fmt:message key="ipdms.dimensoes.edit.sigla" /> *</label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.dimensoes.edit.sigla' />">
					<html:text property="sigla" styleId="sigla" style="width: 45%;" maxlength="40" />
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.dimensoes.edit.descricao' />">
					<label for="descricao"><fmt:message key="ipdms.dimensoes.edit.descricao" /> *</label>
				</div>

				<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.dimensoes.edit.descricao' />">
					<html:textarea property="descricao" styleId="descricao" rows="4"  style="width: 45%;" />
				</div>
			</div>
			
			<div style="clear:both"></div><br />
		
			<div class="row" style="padding-top:0; text-align:left;">
				<table border="0" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
						<tr>
						    <td class="titulo2"><fmt:message key="ipdms.dimensoes.edit.niveis" /></td>
						</tr>
					</tbody>
				</table>					
			</div>
	
			<div id="niveldimensional"><jsp:include page="niveldimensional.jsp" /></div>

			<div class="buttonRow">
				<c:if test="${!IPDMSInteropReceiver}">
					<input type="submit" class="btForm" title="<fmt:message key='ipdms.forms.submit.title'/>" value="<fmt:message key='ipdms.forms.submit'/>" id="submeter">
				</c:if>
				<input type="button" class="btFormEscuro" onclick="cancelarDim(event,'${dimensoes}', '<fmt:message key="ipdms.dimensoes.cancelar.msg"/>',decisaovoltar);" title="<fmt:message key='ipdms.forms.cancelar.title'/>" value="<fmt:message key='ipdms.forms.cancelar'/>" id="cancelar">
			</div>
	

</html:form>