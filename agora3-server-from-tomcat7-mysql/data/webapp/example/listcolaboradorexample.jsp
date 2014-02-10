<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<LINK href='${pageContext.request.contextPath}/ipdms/themes/window/window-default.css' type=text/css rel=stylesheet>
<LINK href='${pageContext.request.contextPath}/ipdms/themes/window/alphacube.css' type=text/css rel=stylesheet>

<script src='${pageContext.request.contextPath}/ipdms/js/prototype.js' type="text/javascript"></script>
<script src='${pageContext.request.contextPath}/ipdms/js/scriptaculous/scriptaculous.js?load=effects,dragdrop' type="text/javascript"></script>
<script src='${pageContext.request.contextPath}/ipdms/js/window/window.js' type="text/javascript"></script>


<script>
	function showAuditHistory(numero){
		var action = "${pageContext.request.contextPath}/auditColaboradorHistory.do2?numero=" + numero;
		action += "&window=win";
		
		win = new Window({className:"alphacube", title: "Audit History", top:150, left:500, width:500, 
			height:600, zIndex:22000, resizable: true, minimizable: false, maximizable: false, 
			url: action, 
			showEffectOptions: {duration:null}, 
			hideEffectOptions:{duration:null}});
		win.show(); 	
	}
</script>

<script type="text/javascript">	
	document.title = 'IPDMS - <bean:message key="ipdms.gestao.de" locale="locale"/> <bean:message key="ipdms.colaborador.designacaoplural" locale="locale"/>';	 
</script>

<div class="row" style="padding-top:0px; text-align:left">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><bean:message key="ipdms.gestao.de" locale="locale"/>&nbsp;<bean:message key="ipdms.colaborador.designacaoplural" locale="locale"/></td>
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
		<li> Para <b>adicionar</b> um(a) <bean:message key="ipdms.colaborador.designacaosingular" locale="locale"/>, carregue no botão <bean:message key="ipdms.forms.criar" locale="locale"/>; </li>
		<li> Para <b>modificar</b> um(a) <bean:message key="ipdms.colaborador.designacaosingular" locale="locale"/>, carregue no seu nome; </li>
		<li> Para <b>eliminar</b> <bean:message key="ipdms.colaborador.designacaoplural" locale="locale"/>, seleccione a checkbox nas linhas de dados respectivas e carregue no botão <bean:message key="ipdms.forms.eliminar" locale="locale"/>. </li>
	</ul>
</div>

<br />


<html:form action="/deleteColaborador.do2" method="post" styleClass="form">
<table style="border:none" cellpadding="0" cellspacing="0" class="centro">
	<c:choose>
	  <c:when test="${not empty listFormBean.elementos}">
	  	<tr>
	      	<th width="52" class="centro"><img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png"  alt="Eliminar" title="Eliminar"/></th>
	      	<th width="1170" class="centro"><bean:message key="ipdms.colaborador.designacaosingular" locale="locale"/></th>
	    </tr>
	    <logic:iterate name="listFormBean" property="elementos" id="elementos">
		  <nested:root name="elementos">
		  <tr>
		  	<td  class="centro">
		  		<nested:checkbox property="seleccionado" indexed="true" styleClass="radion" style="border:0;"/>
			  	<nested:hidden property="numeroConteudo" indexed="true"/>
		  	</td>
		  	<td class="centro">
		  		<nested:link action="/editColaborador" paramId="numero" paramProperty="numeroConteudo">
			  			<nested:write property="titulo" />
			  	</nested:link>
			  	&nbsp;&nbsp;&nbsp;
			  	<a href="#" onclick="showAuditHistory('${elementos.numeroConteudo}');" class="formfield">(historico)</a>
		  	</td>
		  </tr>
		  </nested:root>
		  </logic:iterate>	  
	  </c:when>
	  <c:otherwise>
	  	<tr class="formfield">
	  		<td colspan="2" style="text-align:center;">Não existem <bean:message key="ipdms.colaborador.designacaoplural" locale="locale"/> criados(as).</td>
	  	</tr>
	  	<tr><td colspan="2">&nbsp;</td></tr>
	  </c:otherwise>
	</c:choose>
</table>
<br />
	<c:if test="${not empty listFormBean.elementos}">
		<input type="submit" class="btForm" value="<bean:message key="ipdms.forms.eliminar" locale="locale"/>">
	</c:if>
	<input type="submit" class="btForm" 
		   value="<bean:message key="ipdms.forms.criar" locale="locale"/>" 
		   onclick="this.form.action='editColaborador.do2'; this.form.submit();">
	
</html:form>