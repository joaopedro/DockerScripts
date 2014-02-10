<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.forms.seguinte" var="seguinte" />
<fmt:message key="ipdms.forms.seguinte.title" var="seguinteTitle" />
<fmt:message key="ipdms.forms.gravar" var="gravar" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />

<table width="100%">
	<tr>
		<td style="text-align:right;">
			<html:submit property="_eventId_next" value="${seguinte}" styleClass="btForm" onkeyup="doAjax(event);" onmouseup="ajaxSubmit(event);" title="${seguinteTitle}"/>
		</td>
		<td width="10%">
		</td>
		<td style="text-align:left;" width="50%">
			<logic:equal name="webflowActionForm" property="idProcesso" value="">
				<logic:present role="EMPRESA,CIDADAO">
					<html:submit property="_eventId_suspend" value="${gravar}" styleClass="btForm" title="${gravar}"
								onkeyup="if( confirmaGravar() ) doAjaxReferer(event,'${flowExecutionContext.activeSession.scope.map.referer}');"
								onmouseup="if( confirmaGravar() ) ajaxSubmitReferer(event,'${flowExecutionContext.activeSession.scope.map.referer}');"/>		
				</logic:present>
				<logic:notPresent role="EMPRESA,CIDADAO">
					<html:submit property="_eventId_suspend" value="${gravar}" styleClass="btForm" title="${gravar}"
								onkeyup="doAjaxReferer(event,'${flowExecutionContext.activeSession.scope.map.referer}');"
								onmouseup="ajaxSubmitReferer(event,'${flowExecutionContext.activeSession.scope.map.referer}');"/>		
				</logic:notPresent>
			</logic:equal>
			<html:submit property="_eventId_cancel" value="${cancelar}" styleClass="btFormEscuro" title="${cancelarTitle}"
						onclick="if( confirmaCancelar() ) ajaxSubmitReferer(event,'${flowExecutionContext.activeSession.scope.map.referer}');"/>
		</td>
	</tr>
</table>

