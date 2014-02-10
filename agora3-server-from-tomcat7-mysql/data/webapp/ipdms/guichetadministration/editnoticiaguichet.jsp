<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.guichetadmin.noticia.edit.header" var="titulo" />
<fmt:message key="ipdms.forms.select" var="select" />
<fmt:message key="ipdms.guichetadmin.menuitem.instrucao.variante" var="variante" />
<fmt:message key="ipdms.guichetadmin.menu.menu" var="menu" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMAGE_DIR" value="${pageContext.request.contextPath}/images" />

<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script type="text/javascript">	

function decisaovoltar(btn)
{
	 		
	if(btn=='yes') {
		document.forms[0].action='listNoticiaGuichet.do2';
		document.forms[0].submit();
	}
	else
		return false;
}

function callConfirmDialog(event){
	cancelar(event,'<fmt:message key="ipdms.guichetadmin.noticia.edit.header"/>','<fmt:message key="ipdms.guichetadmin.noticia.edit.cancelar.confirm"/>',decisaovoltar,'${sim}','${nao}');
}

</script>
<script type="text/javascript">	

Ext.onReady(function(){
	//cololcar formato de data caso nao haja datas reais
	dateFormatCheckonLoad();
});

</script>

<script type="text/javascript">	
	document.title = '${productName} - ${titulo}';	 
</script>

<div class="row" style="padding-top:0px; text-align:left;">
	<table border="0" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${titulo}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id="noticiaGuichetErrorDiv">
	<html:errors />
</div>

<html:form action="/saveNoticiaGuichet" styleClass="form" enctype="multipart/form-data" onsubmit="return dateFormatCheckonSubmit();" >
	<html:hidden property="id"/>
 

	<!-- DIV DO FORMULÁRIO -->
	<div class="row" style="padding-bottom:2%;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.obrigatorio" />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.noticia.edit.titulo" />">
	  		<label for="titulo"><fmt:message key="ipdms.guichetadmin.noticia.edit.titulo" /> *</label>
	  	</div>

	  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.noticia.edit.titulo" />">		  		
			<html:text property="titulo" styleId="titulo" style="width:80%"/>
	  	</div>
	</div>
			
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.noticia.edit.subtitulo" />">
			<label for="subtitulo"><fmt:message key="ipdms.guichetadmin.noticia.edit.subtitulo" /> *</label>
		</div>

		<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.noticia.edit.subtitulo" />">
			<html:text property="subtitulo" styleId="subtitulo" style="width:80%" />
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.noticia.edit.descricao" />">
			<label for="descricao"><fmt:message key="ipdms.guichetadmin.noticia.edit.descricao" /> *</label>
		</div>

		<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.noticia.edit.descricao" />">
			<html:textarea property="descricao" rows="5"   styleId="descricao" style="width:80%"/>
		</div>
	</div>
			
<!-- 	<div class="row formlabel_sf" > -->
<%-- 		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.menuitem.ordem" />"> --%>
<%-- 			<label for="ordem"><fmt:message key="ipdms.guichetadmin.menuitem.ordem" /> *</label> --%>
<!-- 		</div> -->

<%-- 		<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.guichetadmin.menuitem.ordem" />"> --%>
<%-- 			<html:text property="ordem" styleId="ordem" style="width:5%" />																 --%>
<!-- 		</div> -->
<!-- 	</div> -->
		
	<div style="clear:both"></div>

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.noticia.edit.datainicio" />">
			<label for="dataInicio"><fmt:message key="ipdms.guichetadmin.noticia.edit.datainicio" /></label>
		</div>

		<div class="label" style="width: 13%;" title="<fmt:message key="ipdms.guichetadmin.noticia.edit.datainicio" />">					
				<html:text property="dataInicio" styleClass="date" styleId="dataInicio" maxlength="10" style="width:85%" />					
		</div>

		<div class="label" style="width: 67%;" title="<fmt:message key="ipdms.guichetadmin.noticia.edit.datainicio" />">
				<img id="dataInicioButton" src="${pageContext.request.contextPath}/images/guichet/icons/icon-calendario.png" class="cursorMao" alt="<fmt:message key="ipdms.guichetadmin.menuitem.dataInicio" />" title="<fmt:message key="ipdms.guichetadmin.menuitem.dataInicio" />"/>
				<script type='text/javascript'>
               	Calendar.setup({ inputField : 'dataInicio', ifFormat : '%d-%m-%Y', button : "dataInicioButton" });
			</script>
		</div>
	</div>
	<div style="clear:both"></div>
			
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.guichetadmin.noticia.edit.datafim" />">
			<label for="dataFim"><fmt:message key="ipdms.guichetadmin.menuitem.dataFim" /></label>
		</div>

		<div class="label" style="width: 13%;" title="<fmt:message key="ipdms.guichetadmin.noticia.edit.datafim" />">					
				<html:text property="dataFim" styleClass="date" styleId="dataFim" maxlength="10" style="width:85%" />					
		</div>

		<div class="label" style="width: 67%;" title="<fmt:message key="ipdms.guichetadmin.noticia.edit.datafim" />">
				<img id="dataFimButton" src="${pageContext.request.contextPath}/images/guichet/icons/icon-calendario.png" class="cursorMao" alt="<fmt:message key="ipdms.guichetadmin.menuitem.dataFim" />" title="<fmt:message key="ipdms.guichetadmin.menuitem.dataFim" />"/>
				<script type='text/javascript'>
               	Calendar.setup({ inputField : 'dataFim', ifFormat : '%d-%m-%Y', button : "dataFimButton" });
			</script>
		</div>
	</div>
	<div style="clear:both"></div><br/>
	<div class="buttonRow">
		<input type="submit" class="btForm" value="<fmt:message key='ipdms.forms.submit' />" title="<fmt:message key='ipdms.forms.submit.title' />" id="submeter">
		<input 
			type="button" 
			class="btFormEscuro" 
			onclick="callConfirmDialog(event);" title="<fmt:message key='ipdms.forms.cancelar.title'/>" 
			value="<fmt:message key='ipdms.forms.cancelar'/>" 
			id="cancelar">
	</div>	
</html:form>