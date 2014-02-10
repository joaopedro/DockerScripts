<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>

<tiles:importAttribute />

<tiles:insert definition="ipdms.base" flush="false">
	<tiles:put name="titulo" beanName="titulo" />
	<tiles:put name="main-body" direct="true" >
	
	<script type="text/javascript">	
		document.title = '${productName} - <tiles:getAsString name="titulo" />';	 
	</script>
		<div class="row" style="padding-top:0; text-align:left;">
			<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1"><tiles:getAsString name="titulo" /></td>
				  </tr>
				</tbody>
			</table>					
		</div>
		
		<div id="MensagemErro">
			<html:errors/>
		</div>
		
		<div id="ver_ajuda" class="info">
		<a href="Javascript:verAjuda('s');">Ajuda</a>
		</div>
		
		<div id="ajuda" class="info" style="display: none;">
		<a href="Javascript:verAjuda('n');">Ocultar Ajuda</a>
			<ul>
				<li> Para <b>adicionar</b> <tiles:getAsString name="msg.ajuda" />, carregue no botão <fmt:message key="ipdms.forms.criar" />; </li>
				<li> Para <b>modificar</b> <tiles:getAsString name="msg.ajuda" />, carregue no seu nome; </li>
				<li> Para <b>eliminar</b> <tiles:getAsString name="tipo" />, seleccione a checkbox nas linhas de dados respectivas e carregue no botão <fmt:message key="ipdms.forms.eliminar" />. </li>
			</ul>
		</div>
		
		<br />
		<tiles:useAttribute name="action.eliminar" classname="java.lang.String" id="actionEliminar"/>
		<html:form action="<%= actionEliminar %>" method="post" styleClass="form">
		<html:hidden property="tipoConteudo"/>
		<table class="formtable" style="text-align:center;">
		
		  <tr class="listHeader">
		  	<th><img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" alt="Eliminar" title="Eliminar" /> </th>
		  	<th class="formlabel"><tiles:getAsString name="tipo" /></th>
		  </tr>
		  
		  <logic:iterate name="listagemForm" property="elementos" id="elementos">
		  <nested:root name="elementos">
		  <tr class="formfield">
		  	<td>
		  		<nested:checkbox property="seleccionado" indexed="true" styleClass="radion" style="border:0;"/>
		  		<nested:hidden property="numeroConteudo" indexed="true"/>
		  	</td>
		  	
		  	<td>&nbsp;
				<tiles:useAttribute name="action.editar" classname="java.lang.String" id="actionEditar"/>
		  		<nested:link action="<%= actionEditar %>" paramId="numero" paramProperty="numeroConteudo">
		  			<nested:write property="tituloConteudo" />
		  		</nested:link>
		  	</td>
		  </tr>
		  </nested:root>
		  </logic:iterate>
		  
		  <tr>
			<td colspan="2">
				<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.criar" locale="locale"/>"
							onclick="this.form.action='<tiles:getAsString name="action.criar"/>';">
				<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.eliminar" locale="locale"/>">
			</td>
		  </tr>
		
		</table>
		</html:form>
	
	</tiles:put>
</tiles:insert>

