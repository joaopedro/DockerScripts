<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<logic:present name="errorMessageKey">

	<div class="mensagenCaixa">
		<div style="float:left; width:2%;">
			<img src="images/icon/icon-atencao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="<fmt:message key='ipdms.instrucao.pedido.info.title' />" title="<fmt:message key='ipdms.instrucao.pedido.info.title' />"/>
		</div>
		<div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
			<div class="info"><fmt:message key="${errorMessageKey}" /></div>
		</div>
		<div style="clear:both"></div>
	</div>
	</logic:present>

<logic:present name="niveis">

<logic:notEmpty name="niveis">
<br />
<table border="0" cellpadding="0" cellspacing="1" summary="Gestão de Dimensões" style="border:1px solid #eaeaea; width:100%">  
	<tr class="hoverTransparente">
		<td colspan="2">
	  		<logic:iterate name="niveis" id="nivel" indexId="index">
	  		<nested:root name="nivel">
	  			<ul id="list-${index}" class="dhtmlgoodies_tree" style="display:block;">
		  			<li id="${index}" parentId="${index-1}">
		  				<img src="${pageContext.request.contextPath}/images/tree/dhtmlgoodies_minus.gif" alt="<fmt:message key='ipdms.dimensoes.edit.nivel' />" title="<fmt:message key='ipdms.dimensoes.edit.nivel' />" />
			  			<a href="#" onclick="editarNivel(${index});" style="text-decoration:underline;" title="<fmt:message key='ipdms.forms.editar' /> <nested:write property="designacao" />">
			  				<nested:write property="designacao" />
			  			</a>
			 </nested:root>
			 </logic:iterate>
			<logic:iterate name="niveis" id="nivel" indexId="index"> 
			<nested:root name="nivel">
			 		</li>				  	
		  		</ul>
		  	</nested:root>
		  	</logic:iterate>
		</td>
	</tr>
</table>

</logic:notEmpty>
</logic:present>

<logic:notPresent name="niveis">
	<logic:present name="erroniveis">
	<table width="100%">
		<tr><td class="formfield" style="text-align:center;"><fmt:message key="${erroniveis}"/></td></tr>
	</table>
	</logic:present>
</logic:notPresent>

<script type="text/javascript">
	<logic:present name="alterado">
		
		Element.toggle($('novoNivel'));
	</logic:present>
</script>
