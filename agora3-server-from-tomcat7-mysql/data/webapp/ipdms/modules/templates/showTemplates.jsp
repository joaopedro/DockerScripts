<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.modules.templates.template.titulotab" var="templates" />
<fmt:message key="ipdms.modules.templates.template.criar.success" var="success" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ipdms/js/ext/resources/css/messageEditCreate.css" /> 

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/messageEditCreate.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script type="text/javascript">

function Checkboxes(state) {
    $$('input[type="checkbox"][name^="removeRow_"]').each(function filter(item) {
                {
                item.checked=state;
                }
    });
    
}   

Ext.onReady(function(){
			
	
	    // second tabs built from JS
	    var tabs2 = new Ext.TabPanel({

	    	id       : 'processoTabPanel',
	        renderTo : 'tabPanelWrapper',        
	        deferredRender : false,
	        activeTab: ${activeTab},
	        defaults :{ autoScroll: true,autoHeight: true, autoWidth: true},
	        items:[{
	                title: '<fmt:message key="ipdms.modules.templates.tipotemplate.titulo" />',
	                autoLoad: {url: 'tipoTemplateAction.do2', params: 'method=show', scripts: true}
	            },{
	                title: '<fmt:message key="ipdms.modules.templates.template.titulotab" />',
	                autoLoad: {url: 'templatesAction.do2', scripts: true}
	            }]
	    });
	  });

</script>
<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.modules.templates.titulo" />';	 
</script>
<div class="row" style="padding-top: 0px; text-align:left;">
<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
		<tr>
			<td class="titulo1"><fmt:message key="ipdms.modules.templates.titulo" /></td>
		</tr>
	</tbody>
</table>
</div>
<div id='extInfo' style="width: 100%" ></div>
<script>
var saving;
if(${empty tabAction}){
	saving=false;	
}
else
	saving=true;

	if(saving==true){
	Ext.example.msg('${templates}','${success}');
}
</script>



<div id="tabPanelWrapper" style="height:auto;overflow: hidden"></div> 

