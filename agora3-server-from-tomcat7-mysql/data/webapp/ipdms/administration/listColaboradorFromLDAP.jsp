<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.colaborador.listColaboradorFromLDAP.titulo" var="tituloMsg" />
<fmt:message key="ipdms.colaborador.listColaboradorFromLDAP.help" var="helpMsg" />
<fmt:message key="ipdms.colaborador.listColaboradorFromLDAP.importar" var="importar" />
<fmt:message key="ipdms.colaborador.listColaboradorFromLDAP.empty" var="emptyMsg" />

<style>
 .formlabel_select, .formlabel_select a:visited {
	color:#000000;
	font-size:9px;
	font-weight:bold;
}
</style>
<script type="text/javascript">	
	document.title = '${productName} - ${tituloMsg}';	 
</script>

<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${tituloMsg}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${tituloMsg}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" /></td>
		  </tr>
		</tbody>
	</table>		
	${helpMsg}				
</div>
<br />
<div id="MensagemErro">
	<html:errors/>
</div>
<br />
<table cellpadding="0" cellspacing="0" class="centro">
	
	<c:choose>
	  <c:when test="${not empty ldapUsers}">
	  	<tr>
	      	<th width="25%" class="centro"><fmt:message key="ipdms.colaborador.designacaosingular" /></th>
	      	<th width="25%" class="centro">Login</th>
	      	<th width="25%" class="centro">E-Mail</th>
	      	<th width="5%" class="centro">&nbsp;</th>
	    </tr>
	    <c:forEach var="user" items="${ldapUsers}">
	    		  
		  <tr>
		  	<td class="centro">${user.name}</td>
		  	<td class="centro">${user.username}</td>
		  	<td class="centro">${user.email}</td>
		  	<td class="centro">
		  		<a href="${pageContext.request.contextPath}/editColaborador.do2?ldapuserUUID=${user.id}">
		  			${importar}
		  		</a>
		  	</td>
		  </tr>
		</c:forEach>	  
	  </c:when>
	  <c:otherwise>
	  	<tr class="formfield">
	  		<td colspan="3" class="alignCenter">${emptyMsg}</td>
	  	</tr>
	  </c:otherwise>
	</c:choose>
</table>
<br />

<div class="buttonRow">
	<a href="${pageContext.request.contextPath}/listColaborador.do2">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />">
	</a>
</div>