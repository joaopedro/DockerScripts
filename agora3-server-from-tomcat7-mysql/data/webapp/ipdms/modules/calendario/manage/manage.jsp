<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.loading" var="loadingMsg" bundle="${calendarioBundle}" />

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src='${pageContext.request.contextPath}/ipdms/modules/calendario/calendario.js'></script>


<logic:notPresent name="calendario">
	<div class="row" style="padding-top:0px; text-align:left; ">
		<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo1">
			    	<fmt:message key="calendario.activo.inexistente" bundle="${calendarioBundle}" />
			    </td>
			  </tr>
			</tbody>
		</table>
	</div>
</logic:notPresent>

<logic:present name="calendario">

	<c:set var="titulo" value="${calendario.ano} - ${calendario.descricao}"/>
	
	<script type="text/javascript">	
		document.title = '${productName} - <fmt:message key="calendario.manage.titulo" bundle="${calendarioBundle}" /> ${titulo}';	 
	</script>
	
	<div class="row" style="padding-top:0px; text-align:left; ">
		<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo1">
			    	<fmt:message key="calendario.manage.titulo" bundle="${calendarioBundle}" /> ${titulo}
			    </td>
			  </tr>
			</tbody>
		</table>					
	</div>
	
	<script type="text/javascript">
		
	  	Ext.onReady(function(){
		    var tabs2 = new Ext.TabPanel({
		    	id       : 'manageCalendarioTabPanel',
		        renderTo : 'tabPanelWrapper',        
		        activeTab: 0,
		        defaults :{ autoScroll: false,autoHeight: true, autoWidth: true},
		        
		        items:[{
			        	xtype: 'panel',
		                title: '<fmt:message key="data.fn" bundle="${calendarioBundle}" />',
		                autoLoad: {url: 'fn/module.do2', text:'${loadingMsg}',params: 'id=${calendario.id}', scripts: true}
		            },{ 
		            	xtype: 'panel',
		                title: '<fmt:message key="data.fl" bundle="${calendarioBundle}" />',
		                autoLoad: {url: 'fl/module.do2',text:'${loadingMsg}', params: 'id=${calendario.id}', scripts: true}
		            },{ 
		            	xtype: 'panel',
		                title: '<fmt:message key="data.ponte" bundle="${calendarioBundle}" />',
		                autoLoad: {url: 'ponte/module.do2',text:'${loadingMsg}', params: 'id=${calendario.id}', scripts: true}
		            },{ 
		            	xtype: 'panel',
		                title: '<fmt:message key="data.tp" bundle="${calendarioBundle}" />',
		                autoLoad: {url: 'tp/module.do2',text:'${loadingMsg}', params: 'id=${calendario.id}', scripts: true}
		            }
		        ]
		    });
		});
	</script>
	
	<script type="text/javascript">

		//delete feriado nacional
		function deleteFeriadofn(btn) {
			if(btn=='yes'){
				deletefn();
			}
		}
		
		// delete feriado local
		deleteFeriadofl = function (btn) {
			if(btn=='yes'){
				deletefl();
			}
		}
		
		// delete ponte
		deleteFeriadoPonte = function (btn) {
			if(btn=='yes'){
				deleteponte();
			}
		}
		
		// delete tolerância de ponto
		deleteFeriadoTp = function (btn) {
			if(btn=='yes'){
				deletetp();
			}
		}

	</script>
	
	<div id="tabPanelWrapper" style="height:auto;overflow: hidden"></div>

</logic:present> 