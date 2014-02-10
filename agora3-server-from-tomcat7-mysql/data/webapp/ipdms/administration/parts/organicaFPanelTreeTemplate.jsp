<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.organica.mostrarIncativas" var="mostrarIncativas"/>
<fmt:message key="ipdms.organica.designacaoplural" var="designacaoplural"/>

<script>
checkInactivas = function() {
	var action = 'listOrganica.do2';
	if($('loadInactive').checked) {
		action += '?loadInactive=true';
	}

	$('listFormBean').action = action;
	$('listFormBean').submit();	
}

var checkBox = '<input type="checkbox" id="loadInactive" name="loadInactive" <c:if test="${not empty loadInactive}"> checked="checked" </c:if> onclick="checkInactivas();" /> ${mostrarIncativas}';

tree.on('click', function(node,el){
	$('listFormBean').action= 'edit${actionName}.do2?id='+node.id+'&loadInactive=${loadInactive}'; $('listFormBean').submit();
}, this); 

Ext.onReady(function(){

	<c:if test="${not empty loadInactive}">
		loadtree.dataUrl = 'showOrganicaNode.do2?loadInactive=true';	
	</c:if>
	
	//panel para mostrar tool bar(top)//
	fpanel = new Ext.Panel({
	    
	    title       : '${designacaoplural}', 
	    border      :true,
		width       : 600,
	    height      : 300,
	    renderTo    : 'tree-div', 
		id    : 'fpan',
		layout:'fit',
		tbar:[expandir,
				 colapsar,
				 '->', checkBox 
				 <c:if test="${not empty multiple}">
				 ,seleccionar,
				 remover
				 </c:if>]});
	
	//adcionar componente treepanel 
	fpanel.add(tree);
});

</script>
