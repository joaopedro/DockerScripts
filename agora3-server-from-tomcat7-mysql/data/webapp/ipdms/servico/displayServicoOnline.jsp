<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script src='${JS_DIR}/historico.js' type="text/javascript"></script>
<script type="text/javascript" src='${JS_DIR}/jquery/jquery-1.7.2.js' ></script>
<script type="text/javascript" src='${JS_DIR}/dynamicFormFunctions.js' ></script>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.processo.designacaosingular" var="designacaosingular" />
<fmt:message key="ipdms.servicoonline.requerente" var="requerente" />
<fmt:message key="ipdms.servicoonline.docsAnexados" var="docsAnexados" />
<fmt:message key="ipdms.servicoonline.histProcesso" var="histProcesso" />
<fmt:message key="ipdms.servicoonline.info" var="info" />
<fmt:message key="ipdms.servicoonline.dadosEtapa" var="dadosEtapa" />
<fmt:message key="ipdms.servicoonline.etapas" var="etapas" />
<fmt:message key="ipdms.loading" var="loading" />
<fmt:message key='ipdms.forms.anterior.title' var="anteriorTitle" />

<script type="text/javascript">	
	document.title = '${productName} - ${designacaosingular} ${conteudo.variante.titulo} (${conteudo.idProcessoEntidade})';	 
</script>

<div class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${designacaosingular} ${conteudo.variante.titulo} (${conteudo.idProcessoEntidade})</td>
		  </tr>
		</tbody>
	</table>					
</div>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<script type="text/javascript">
	
	
  	Ext.onReady(function(){

	    // second tabs built from JS
	    var tabs2 = new Ext.TabPanel({

	    	id       : 'processoTabPanel',
	        renderTo : 'tabPanelWrapper',        
	        activeTab: 0,
	        defaults :{ autoScroll: true,autoHeight: true, autoWidth: true},
	        
	        items:[{
		        	xtype: 'panel',
	                title: '${requerente}',
	                autoLoad: {url: 'displayconteudo.do2',text:'${requerente} - ${loading}',params: 'tab=dadosRequerente&numero=${param['numero']}', scripts: true}
	            },{ 
	            	xtype: 'panel',
	                title: '${docsAnexados}',
	                autoLoad: {url: 'displayconteudo.do2',text:'${docsAnexados} - ${loading}', params: 'tab=listDocumentos&numero=${param['numero']}', scripts: true}
	            },{ 
	            	xtype: 'panel',
	                title: '${histProcesso}',
	                autoLoad: {url: 'displayconteudo.do2',text:'${histProcesso} - ${loading}', params: 'tab=historico&numero=${param['numero']}', scripts: true}
	            },{ 
	            	xtype: 'panel',
	                title: '${info}',
	                autoLoad: {url: 'displayconteudo.do2',text:'${info} - ${loading}', params: 'tab=informacoes&numero=${param['numero']}', scripts: true}
	            },{ 
	            	xtype: 'panel',
	                title: '${dadosEtapa}',
	                autoLoad: {url: 'tarefas/mostrarEtapas.do2',text:'${dadosEtapa} - ${loading}', params: 'tab=dadosEtapa&numero=${param['numero']}', scripts: true}
	            },{ 
	            	xtype: 'panel',
	                title: '${etapas}',
	                autoLoad: {url: 'displayconteudo.do2',text:'${etapas} - ${loading}', params: 'tab=etapas&numero=${param['numero']}', scripts: true}
	            }
	        ]
	    });

	}); 
	
</script>
	<bean:define id="path" name="<%= org.apache.struts.Globals.MAPPING_KEY %>" property="path"/>
	<div id="tabPanelWrapper" style="height:auto;overflow: hidden"></div> 

	<c:if test="${buttonAnterior == null}">
		<html:form action="<%= path.toString() %>">			
			<br />
			<html:hidden property="urlAnterior" value="${urlAnterior}" />
			<div class="buttonRow">			
				<html:cancel styleClass="btForm" title="${anteriorTitle}"><fmt:message key="ipdms.forms.anterior" /></html:cancel>			
			</div>
			<body> </body>
		</html:form>
	</c:if>
