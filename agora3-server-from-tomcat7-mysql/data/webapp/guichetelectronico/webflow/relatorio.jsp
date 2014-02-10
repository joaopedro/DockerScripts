<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="guichetelectronico.forms.concluido" bundle="${guichetBundle}" var="concluido"/>

<html:form action="applicationFlow" method="post">
<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

<html:errors/>
<div id="content">
<div class="row formlabel_sf" >
   	 <div class="row formlabel_sf" >
          <div class="leftTab label" style="width: 87%; ">
				<fmt:message key="guichetelectronico.webflow.relatorio.mensagem" bundle="${guichetBundle}"/>
				<bean:write name="webflowActionForm" property="servicoOnline.idProcessoEntidade" />
          </div>
     </div>
</div>
<c:if test="${not empty teste.linkPDF }">
<div class="row formlabel_sf" >
   	 <div class="row formlabel_sf" >
          <div class="leftTab label" style="width: 87%; ">
			<fmt:message key="guichetelectronico.webflow.relatorio.link" bundle="${guichetBundle}"/> 
			<a href="${pageContext.request.contextPath}/<bean:write name="webflowActionForm" property="linkPDF" />" class="webflow_link" target="_blank">
			<bean:write name="webflowActionForm" property="servicoOnline.idProcessoEntidade" /></a>.
          </div>
     </div>
</div>
	</c:if>
<div style="clear:both;"></div>
<div class="buttonRow">
	<html:submit value="${concluido}" title="${concluido}" styleClass="btForm" onclick="setActionAndSubmit(this.form,'${pageContext.request.contextPath}/guichetelectronico/publico/homepage.do2');"/>
</div>
</div>
</html:form>
