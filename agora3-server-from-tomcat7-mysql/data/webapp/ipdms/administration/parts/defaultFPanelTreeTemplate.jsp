<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
Ext.onReady(function(){
	
	//panel para mostrar tool bar(top)//
	fpanel = new Ext.Panel({
	    
	    title       : '${actionName}s', 
	    border      :true,
		width       : 600,
	    height      : 300,
	    renderTo    : 'tree-div', 
		id    : 'fpan',
		layout:'fit',
		tbar:[expandir,
				 colapsar,
				 '->',
				 <c:if test="${not empty multiple}">
				 ,seleccionar,
				 remover
				 </c:if>]});
	
	//adcionar componente treepanel 
	fpanel.add(tree);

});

</script>