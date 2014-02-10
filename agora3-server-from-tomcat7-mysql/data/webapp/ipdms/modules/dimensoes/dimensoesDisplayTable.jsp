<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.dimensoes.imprimir.ambos" var="ambos" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.dimensoes.imprimir.fichas" var="imprimirFichas" />
<fmt:message key="ipdms.seleccionar" var="seleccionar" />
<fmt:message key="ipdms.todos" var="todos" />
<fmt:message key="ipdms.nenhum" var="nenhum" />
<fmt:message key="ipdms.dimensoes.edit.designacao" var="designacao" />
<fmt:message key="ipdms.dimensoes.descricao" var="descricao" />
<fmt:message key="ipdms.dimensoes.estado" var="estado" />
<fmt:message key="ipdms.dimensoes.titulo" var="editarValores" />
<fmt:message key="ipdms.dimensoes.eliminar.titulo" var="eliminar" />
<fmt:message key="ipdms.forms.imprimir" var="imprimir" />
<fmt:message key="ipdms.dimensoes.designacaoplural" var="dimensoesDesc" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<script type="text/javascript">

	function Checkboxes(state) {
  	  $$('input[type="checkbox"]').each(function filter(item) {
  	      {
   	     item.checked=state;
    	    }
	});

	}   

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
		}
		else if(btn=='ok') {
			tipo+="word";
		}
		else if(btn=='no') {
			tipo+="ambos";
		}
		else	
			return false;

		var dimensoes = "&ncDim=";
		var count = 0;
		$$('.printDim').each(function filter(item) {
	  	      {
	   	 		if(item.checked == 1) {
		   	 		if(count > 0)
		   	 			dimensoes+=","+item.value;
		   	 		else
		   	 			dimensoes+=item.value;
		   	 		count++;
	   	 		}
	  	      }
		});

		var action = "${pageContext.request.contextPath}/gerarFicheirosDimensao.do2";
		action += tipo;
		action += dimensoes;
		action += "&window=winchoose";

		winValorDim = ExtWindowSizeParam('${imprimirFichas}',
				action,
				'',
				'html',
				450, //width
				300	 //height
				);
		
	}

	function editValores(numConteudo)
	{
		document.deleteForm.action='showValoresDimensionais.do2?numeroConteudo='+numConteudo;
		document.deleteForm.submit();
	}

		
</script>

<c:if test="${not empty paginatedList.list}">
<span class="formlabel_select">
	${seleccionar} <a href="#" onclick="Checkboxes(true);" title="${todos}" title="${todos}">${todos}</a>,
				   <a href="#" onclick="Checkboxes(false);" title="${nenhum}" title="${nenhum}">${nenhum}</a>
</span><br/><br/>
</c:if>
<display:table id="dimensoes" name="${paginatedList}" htmlId="worklist"  requestURI="${originalMapping}.do2">
	<display:column title="${designacao}" sortable="true" sortName="designacao"  style="id=${dimensoes.numeroConteudo}; width:22%" class="clickableDisplayColumn">
		${dimensoes.designacao}<span style="display: none;">${paramId}=${dimensoes.numeroConteudo}</span>
	</display:column>
	<display:column title="${descricao}" sortable="true" sortName="descricao" property="descricao" class="clickableDisplayColumn"></display:column>
	<display:column style="width:12%" title="${estado}" class="clickableDisplayColumn">
		<c:choose>
			<c:when test="${dimensoes.aprovado == 'S'}">
				<fmt:message key="ipdms.dimensoes.aprovado" />
			</c:when>
			<c:otherwise>
				<fmt:message key="ipdms.dimensoes.naoaprovado" />
			</c:otherwise>
		</c:choose>
	</display:column>
	<display:column style="text-align:center; width:8%" title="${editarValores}">
		<img src="${pageContext.request.contextPath}/images/icon/icon-editar.png" onclick="editValores('${dimensoes.numeroConteudo}');" class="cursorMao" alt="${editarValores}" title="${editarValores}" /> 	
	</display:column>
	<c:if test="${not empty removeAction}">
	<c:if test="${!IPDMSInteropReceiver}">
		<display:column style="text-align:center; width:7%" title="${eliminar}">
			<label for="removeRow_${dimensoes.numeroConteudo}"><input type="checkbox" id="removeRow_${dimensoes.numeroConteudo}" name="removeRow_${dimensoes.numeroConteudo}" value="checked" class="radion" style="text-align:center; border:0;"/></label> 	
		</display:column>
	</c:if>
	</c:if>
	<display:column style="text-align:center; width:5%" title="${imprimir}">
			<label for="printDim_${dimensoes.numeroConteudo}"><input type="checkbox" name="printDim_${dimensoes.numeroConteudo}" class="printDim" id="printDim_${dimensoes.numeroConteudo}" value="${dimensoes.numeroConteudo}" style="border:0;"/></label> 	
	</display:column>
	<display:footer>
		<td colspan="4" class="tableFooter">&nbsp;</td>
		<c:if test="${not empty removeAction}">
		<c:if test="${!IPDMSInteropReceiver}">
			<td class="tableFooter alignCenter">
				<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" onclick="cancelar(event,'${dimensoesDesc}', '<fmt:message key="ipdms.dimensoes.eliminar.msg" /> ',decisao,'${sim}','${nao}');" class="cursorMao" alt="<fmt:message key="ipdms.forms.eliminar"/>" title="<fmt:message key='ipdms.forms.eliminar'/>" />
			</td>
		</c:if>
		</c:if>
		<td class="tableFooter alignCenter">
			<img src="${pageContext.request.contextPath}/images/icon/icon-print.png" onclick="imprimirDim(event,'${dimensoesDesc}', '<fmt:message key="ipdms.dimensoes.imprimir.msg"/> ',decisaoprint);" class="cursorMao" alt="<fmt:message key="ipdms.forms.imprimir"/>" title="<fmt:message key='ipdms.forms.imprimir'/>" />
		</td>
	</display:footer>
	
</display:table>