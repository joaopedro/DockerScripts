<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.colaborador.morada" var="moradaDes" />

<c:set var="extraproperties" />
<c:if test="${not empty fieldInstance}">
	<c:set var="extraproperties">${extraproperties} value="${fieldInstance.value}"</c:set>
	<c:if test="${not empty fieldInstance.relationObject}">
		<c:set var="moradaDescription">${fieldInstance.relationObject.moradaDescription}</c:set>
	</c:if>
</c:if>

<c:set var="methodOnClose" value="refreshDynamicValues" />
<c:if test="${empty fieldInstance || (not empty fieldInstance && isTramitacao)}">
	<c:set var="methodOnClose" value="refreshMoradaLabel(${dfieldId})" />
</c:if>

<a class="texto" href="#" onclick="editMoradaPopup('${dfieldId}','${methodOnClose}');" id="moradas_${dfieldId}"><img alt="${moradaDes}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"></a>

<span id="${dfieldId}_label">
	${moradaDescription}
</span>

<input type="hidden" id="${dfieldId}" name="${dfieldId}" ${extraproperties} />

<!-- Define o nome do método que será invocado aquando do fecho da popup de selecção da morada 
		refreshDynamicValues 
			invocado na instrução do processo
		refreshMoradaLabel${dfieldId} 
			invocado na tramitação do processo ou na previsualização do formulário dinâmico
	-->



<script type="text/javascript">
	
	
	
	//O nome do método é construido com editMoradaPopup + valor do campo do formulário dinamico.
	//Para garantir que temos sempre métodos com nomes únicos independentemente do nr de campos
	//do mesmo tipo no formulário dinâmico
	editMoradaPopup= function(idPlaceHolder,method){

		Ext.onReady(function(){
			action = "${pageContext.request.contextPath}/moradaPopupLocaleAware.do2"; 
			action += "?method=edit&id="+$(idPlaceHolder).value; 
			action += "&idPlaceHolder="+idPlaceHolder;
			action += "&savemorada=true";
			action += "&window=winchoose";
					
			return ExtWindowAll('${moradaDes}',action,'','html',true,true,true,650,400,true,true,'fit', method);
		});
		
	};
	
	
	//Preview - Not actually in webflow, or in the tramitation process
	refreshMoradaLabel = function(idPlaceHolder) {
		
		if($F(idPlaceHolder) != '') {
			//Update label
			new Ajax.Updater(idPlaceHolder+'_label', 'moradaPopupLocaleAware.do2?method=getLabel', 
					{method: 'get', parameters: 'id='+$F(idPlaceHolder)});
		}
		
	};

</script>

