<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="formBean" value="${associacaoFormBean}" />

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.processo.etapas" var="associarEtapas"/>

<script type="text/javascript">	
	document.title = '${productName} - ${formBean.nomeConteudo} - ${associarEtapas}';	 
</script>

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${formBean.nomeConteudo} - ${associarEtapas}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="<fmt:message key="ipdms.forms.ajuda"/>" title="<fmt:message key="ipdms.forms.ajuda"/>" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${formBean.nomeConteudo} - ${associarEtapas}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="<fmt:message key="ipdms.forms.ocultarAjuda"/>" title="<fmt:message key="ipdms.forms.ocultarAjuda"/>" /></td>
		  </tr>
		</tbody>
	</table>	
	<fmt:message key="ipdms.processo.associarEtapas.help"/>
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<br />

<html:form action="/saveProcessoEtapaRelation" method="post" styleClass="form">

<html:hidden property="numero" value="${formBean.id}" />

<div class="row formlabel_sf" >
    <table cellpadding="0" cellspacing="0" class="centro">
        <tr>
        	<th class="centro" style="width:5%"><fmt:message key="ipdms.forms.select"/></th>
            <th class="centro"><fmt:message key="ipdms.etapa.designacaosingular"/></th>
            <th style="width:8%" class="centro"><fmt:message key="ipdms.item.atributo.ordem"/></th>
        </tr>
            <tbody>  
             	<logic:iterate name="formBean" property="elementos" id="elementos">
  			  	<nested:root name="elementos">
                    <tr>
                    	<td class="alignCenter">
                    		<nested:checkbox property="seleccionado" styleClass="radion" indexed="true" style="border:0;"/>
  							<nested:hidden property="numeroConteudo" indexed="true"/>
  						</td>
	                    <td class="centro">                                    
	                        <nested:write property="titulo" />
	                    </td>
	                    <td class="centro">
	                    	<nested:text property="ordem" indexed="true" onkeypress="return isDigit();" styleClass="number" size="5" maxlength="5"/>
	                    </td>
                    </tr>
			  </nested:root>
			  </logic:iterate>
            </tbody>
    </table>
    <div class="buttonRow">
    	
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key="ipdms.forms.anterior.title"/>"
			onclick="this.form.action='${pageContext.request.contextPath}/editProcesso.do2?numero=${formBean.id}'; this.form.submit();"> 
		<c:if test="${not empty formBean.elementos}">
			<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key="ipdms.forms.submit.title"/>">
		</c:if>
     </div>
</div>
</html:form>
