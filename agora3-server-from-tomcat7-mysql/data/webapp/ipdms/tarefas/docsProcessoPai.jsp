<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.tarefas.lancarsubprocesso.title" var="title" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.docsEnviar" var="docsEnviar" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.titulo" var="titulo" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.descricao" var="descricao" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.comentario" var="comentario" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.ficheiro" var="ficheiro" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.extensao" var="extensao" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.seleccionar" var="seleccionar" />

<LINK href='${THEMES_DIR}/window/window-default.css' type=text/css rel=stylesheet>
<LINK href='${THEMES_DIR}/window/alphacube.css' type=text/css rel=stylesheet>

<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>

<script type="text/javascript">
	var rules = {
		'#worklist tbody tr': function(el) {
			el.onmouseover = function(){
				Element.addClassName(this,'active-row')				
			};
			el.onmouseout = function() {
				Element.removeClassName(this, 'active-row');
			};
		}
	};
	Behaviour.register(rules);
</script>
<script type="text/javascript">	
	document.title = '${productName} - ${title}: ${docsEnviar}';	 
</script>
<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${title}: ${docsEnviar}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<html:form action="/tarefas/lancarsubprocesso.do2" method="get" styleId="JP1">
<html:hidden property="numero"/>
<html:hidden property="etapa"/>
<html:hidden property="nid" value="${nid}"/>
<display:table id="listaProcessos"  name="documentospai" pagesize="20"
		requestURI="" htmlId="worklist">

		<display:column title="${titulo}" sortable="true"
			sortName="titulo"
			property="titulo"></display:column>
		<display:column title="${descricao}" sortable="true" sortName="descricao"
			property="descricaoCurta"></display:column>
		<display:column title="${comentario}" sortable="true"
			sortName="comentario" 
			property="comentario"></display:column>
		<display:column title="${ficheiro}" sortable="true"
			sortName="ficheiro" 
			property="nomeImagem"></display:column>
		<display:column title="${extensao}" sortable="true"
			sortName="extensao" 
			property="extensao"></display:column>
		<display:column title="${seleccionar}" sortable="false" class="alignCenter"
			 style="width:5%">
			<html:multibox style="checks" property="id"
				value="${listaProcessos.id}"></html:multibox>
		</display:column>

	</display:table>

<br /><br />
<input type="button" class="btForm" value="<fmt:message key='ipdms.forms.anterior'/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
	onclick="setActionAndSubmit(this.form, '${pageContext.request.contextPath}${urlAnterior}');">
<input class="btForm" type="submit"  value="<fmt:message key='ipdms.forms.submit'/>" title="<fmt:message key='ipdms.forms.submit.title'/>"/>

</html:form>