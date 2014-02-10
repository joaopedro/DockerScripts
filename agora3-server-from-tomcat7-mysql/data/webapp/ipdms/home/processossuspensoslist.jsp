<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.menu.processos.minhaArea.draftProcessos" var="draftProcessos" />

<div id="MensagemErro">
	<html:errors/>
</div>
<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
   <table style="border:none" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
	  <tr>
	    <td class="titulo1">${draftProcessos}</td>
	    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ajuda' />" title="<fmt:message key='ipdms.forms.ajuda' />" /></td>
	  </tr>
	</tbody>
   </table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${draftProcessos}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ocultarAjuda' />" title="<fmt:message key='ipdms.forms.ocultarAjuda' />" /></td>
		  </tr>
		</tbody>
	</table>	
	<fmt:message key="ipdms.processos.draft.help" />
</div>
<logic:present name="processos_suspensos">
<logic:notEmpty name="processos_suspensos">
<script type="text/javascript">	
	document.title = '${productName} - ${draftProcessos}';	 
</script>


<br />
<table cellpadding="0" cellspacing="0" class="centro" summary="Tabela com a lista dos draft de processos e o número de processos associados ao tipo em questão">
    <tr>
    	<th style="width:67.50em" class="centro"><fmt:message key='ipdms.forms.tipoprocesso' /></th>
		<th style="width:6.25em" class="centro"><fmt:message key='ipdms.myprocesses.darconhecimento.numProcessos' /></th>
    </tr>
    	<tbody>  
   		  	<logic:iterate name="processos_suspensos" id="processo">
	    <tr>
	      <td class="centro">
     		<a href="suspworklist.do2?method=presentSuspendedProcess&parentActivity=${cods_workflow[processo.numeroConteudo]}&tipo=${processo.numeroConteudo}" title="${processo.titulo}">
  				${processo.titulo}
  			</a>
		  </td>
	      <td class="centro" style="text-align: center; background-color: grey;">
	    	${contadores[processo.numeroConteudo]}
	      </td>
	    </tr>
	    </logic:iterate>
  		</tbody>
</table>

</logic:notEmpty>
<logic:empty name="processos_suspensos">
	<div class="row formlabel_sf" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="<fmt:message key='ipdms.instrucao.pedido.info.title' />" title="<fmt:message key='ipdms.instrucao.pedido.info.title' />"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info"><fmt:message key='ipdms.processos.draft.empty' /></div></div><div style="clear:both"></div></div></div>
	<div style="clear:both"></div>
</logic:empty>
</logic:present>