<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.apresentacao.titulo" var="titulo"/>

<script type="text/javascript">	
	document.title = '${productName} - ${titulo}';	 
</script>

<div id="ver_ajuda" style="text-align:left; padding-top:0; ">
   <table border="0" cellpadding="0" cellspacing="0" class="headings">
    <tbody>
      <tr>
        <td class="titulo1">${titulo}</td>
        <td style="width:4%; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ajuda' />" title="<fmt:message key='ipdms.forms.ajuda' />" /></td>
      </tr>
    </tbody>
   </table>					
</div>
<div id="ajuda" class="info" style="text-align:left; padding-top:0; display: none;">
    <table border="0" cellpadding="0" cellspacing="0" class="headings">
        <tbody>
          <tr>
            <td class="titulo1">${titulo}</td>
            <td style="width:4%; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ocultarAjuda' />" title="<fmt:message key='ipdms.forms.ocultarAjuda' />" /></td>
          </tr>
        </tbody>
    </table>	
	<fmt:message key="ipdms.apresentacao.help" />			
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<html:form action="/saveApresentacao" method="post" enctype="multipart/form-data" styleClass="form">

<div class="row" style="padding-bottom:2%;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.obrigatorio" />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.apresentacao.texto"/>">
  		<label for="texto"><fmt:message key="ipdms.apresentacao.texto"/> * </label>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 98%; " title="<fmt:message key="ipdms.apresentacao.texto"/>">
  		<html:textarea cols="70" rows="15" property="descricao" styleId="texto"/>
  	</div>
</div>
<div class="row formlabel_sf" id="rowAgrupamento" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.apresentacao.imagem"/>">
  		<fmt:message key="ipdms.apresentacao.imagem"/>
  	</div>

  	<c:set var="fileForUpload" value="${apresentacaoFormBean.imagem}" scope="request" />
  	<c:import url="/ipdms/commons/fileupload/replaceablefile.jsp">  		
  		<c:param name="formUploadProperty" value="imagem" />
  		<c:param name="withDescription" value="true" />
  	</c:import>
</div>
<div style="clear:both"></div>
<div class="buttonRow">
	<input type="submit" name="back" class="btForm" value="<fmt:message key='ipdms.forms.anterior'/>"
		onclick="this.form.action='homepage.do2';" title="<fmt:message key='ipdms.forms.anterior.title'/>" />
	<input type="submit" name="submit" class="btForm" value="<fmt:message key='ipdms.forms.submit'/>" title="<fmt:message key='ipdms.forms.submit.title'/>" />
</div>  	
</html:form>