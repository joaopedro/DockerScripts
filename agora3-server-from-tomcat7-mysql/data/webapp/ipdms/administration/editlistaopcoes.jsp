<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script>

function Checkboxes(state) {
	
    $$('input[type="checkbox"][name^="cut#"]').each(function filter(item) {
                {
                item.checked=state;
                }
    });
    
}   

</script>


<html:form action="/saveListaOpcoes" method="post" styleClass="form">
	<html:hidden property="numero"/>
	<html:hidden property="itensSize" value="${fn:length(listaOpcoesFormBean.itens)}" />
	
	<div class="row" style="padding-bottom:20px;">
		<div class="leftTab label" style="width: 90%;" title="<fmt:message key='ipdms.obrigatorio' />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>
	
	<%-- titulo --%>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.listaopcoes.titulo' />">
	  		<fmt:message key="ipdms.listaopcoes.titulo" /> *
	  	</div>	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.listaopcoes.titulo' />">
	  		<html:text property="titulo" style="width: 50%;" size="40" maxlength="80"/>
	  	</div>
	</div>
	
	<%-- descricao --%>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.listaopcoes.descricao' />">
	  		<fmt:message key="ipdms.listaopcoes.descricao" />
	  	</div>	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.listaopcoes.descricao' />">
	  		<html:text property="descricao" style="width: 50%;" size="80" maxlength="100"/>
	  	</div>
	</div>
	
	<%-- sigla --%>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.listaopcoes.sigla' />">
	  		<fmt:message key="ipdms.listaopcoes.sigla" />
	  	</div>	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.listaopcoes.sigla' />">
	  		<html:text property="sigla" style="width: 50%;" size="20" maxlength="40"/>
	  	</div>
	</div>
	
	<%-- idexterno --%>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.listaopcoes.idexterno' />">
	  		<fmt:message key="ipdms.listaopcoes.idexterno" />
	  	</div>	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.listaopcoes.idexterno' />">
	  		<html:text property="idExterno" style="width: 50%;" size="20" maxlength="40"/>
	  	</div>
	</div>
	
	<br />
	<br />
	<br />
	<div id="itens-div">
				
		<div class="row" style="padding-top:0px; text-align:left;">
			<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo2"><fmt:message key='ipdms.forms.listaItens' /></td>
				  </tr>
				</tbody>
			</table>					
		</div>
	
		<div>
			<span class="formlabel_select" >
				<fmt:message key='ipdms.seleccionar' /> <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="<fmt:message key='ipdms.todos' />"><fmt:message key='ipdms.todos' /></a>,
							   <a href="#"  onclick="Checkboxes(false);" class="formlabel_select" title="<fmt:message key='ipdms.nenhum' />"><fmt:message key='ipdms.nenhum' /></a>
			</span>
		</div>
				
		<div>
			<table cellpadding="0" cellspacing="0" class="centro"> 
				<tr>
					<th class="centro"><fmt:message key="ipdms.item.nome"/> * </th>
					<th class="centro"><fmt:message key="ipdms.item.descricao"/></th>
					<th class="centro"><fmt:message key="ipdms.item.sigla"/></th>
					<th class="centro"><fmt:message key="ipdms.item.idexterno"/></th>
					<th class="centro"><img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" alt="<fmt:message key='ipdms.forms.eliminar' />" title="<fmt:message key='ipdms.forms.eliminar' />" /></th>
				</tr>
	
				<logic:iterate name="listaOpcoesFormBean" property="itens" id="itens" indexId="counter">
					
					
					<nested:root name="itens">
						<tr class="hoverTransparente">
							<td class="centro"><label for="titulo${counter}"><nested:text property="titulo" size="40" maxlength="80" indexed="true" styleId="titulo${counter}"/></label></td>
							<td class="centro"><label for="descricao${counter}"><nested:text property="descricao" size="50" maxlength="100" indexed="true" styleId="descricao${counter}"/></label></td>
							<td class="centro"><label for="sigla${counter}"><nested:text property="sigla" size="20" maxlength="20" indexed="true" styleId="sigla${counter}"/></label></td>
							<td class="centro"><label for="idExterno${counter}"><nested:text property="idExterno" size="20" maxlength="20" indexed="true" styleId="idexterno${counter}"/></label></td>
														
							<td class="centro">
								<nested:hidden property="numero" indexed="true"/>
							  	<nested:greaterThan property="numero" value="0">
									<label for="eliminar${counter}"><input type="checkbox" style="border: none;" name="cut#${itens.numero}" id="eliminar${counter}"/></label>
							  	</nested:greaterThan>							   
							</td>														 
						</tr>
												
					 </nested:root>
				</logic:iterate>
			</table>	
		</div>		
	</div>
	
	<div class="buttonRow">
		<input type="button" class="btForm" title="<fmt:message key="ipdms.forms.anterior.title"/>" value="<fmt:message key="ipdms.forms.anterior"/>"
				onclick="setActionAndSubmit(this.form, 'listListaOpcoes.do2');">
		<input type="submit" class="btForm" title="<fmt:message key="ipdms.forms.submit.title"/>" value="<fmt:message key="ipdms.forms.submit"/>">
	</div>

</html:form>