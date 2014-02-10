<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>

<%-- get save and back action from tiles-definition --%>
<c:set var="saveAction">
	<tiles:getAsString name="saveaction" />
</c:set>
<c:set var="backAction">
	<tiles:getAsString name="backaction" />
</c:set>


<c:set var="formBean" value="${associacaoFormBean}" />

<script type="text/javascript">	
	document.title = '${productName} - ${formBean.nomeConteudo} - <fmt:message key="ipdms.etapa.listaopcoes"/>';	 
</script>

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${formBean.nomeConteudo} - <fmt:message key="ipdms.etapa.listaopcoes"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ajuda'/>" title="<fmt:message key='ipdms.forms.ajuda'/>" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${formBean.nomeConteudo} - <fmt:message key="ipdms.etapa.listaopcoes"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ocultarAjuda'/>" title="<fmt:message key='ipdms.forms.ocultarAjuda'/>" /></td>
		  </tr>
		</tbody>
	</table>	
	<fmt:message key="ipdms.etapa.associarListaOpcoes.help"/>
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<br />

<html:form action="/${saveAction}" method="post" styleClass="form">

	<html:hidden property="numero" value="${numeroConteudoRetorno}" />
	
	<div class="row formlabel_sf" >
	    <table cellpadding="0" cellspacing="0" class="centro">
	        <tr>
	        	<th width="5%" class="centro"><fmt:message key="ipdms.forms.select"/></th>
	            <th class="centro"><fmt:message key="ipdms.listaopcoes.designacaosingular"/></th>	            
	        </tr>
	        <tbody>  
	        	<logic:iterate name="formBean" property="elementos" id="elementos">
	  				<nested:root name="elementos">
	                	<tr>
	                    	<td class="alignCenter">
	                    		<nested:checkbox property="seleccionado" styleClass="radion" indexed="true" style="border:0;"/>
	  							<nested:hidden property="id" indexed="true"/>
	  						</td>
		                    <td class="centro">                                    
		                        <nested:write property="titulo" />
		                    </td>		                   
	                    </tr>
				  	</nested:root>
				  </logic:iterate>
	         </tbody>
	    </table>
	    
	    <div class="buttonRow">
	    	
			<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
				onclick="this.form.action='${pageContext.request.contextPath}/${backAction}.do2?numero=${numeroConteudoRetorno}'; this.form.submit();"> 
			<c:if test="${not empty formBean.elementos}">
				<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key='ipdms.forms.submit.title'/>">
			</c:if>
	     </div>
	     
	</div>
	
</html:form>
