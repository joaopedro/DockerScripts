<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.forms.select.default" var="selectDefault" />

<%--Header --%>
<div class="row" style="text-align:left; padding-top:0px;">
	<table border="0" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
			<td class="titulo1"><bean:write name="relatorio" property="titulo"/></td>
		  </tr>
		</tbody>
	</table>					
</div>
	 
<%--Paramters of the form --%>
<logic:present name="parametros">
	<logic:iterate name="parametros" id="parametro" type="org.eclipse.birt.report.engine.api.IParameterDefnBase">
		<nested:root name="parametro">			
			<div class="row formlabel_sf">
				<div class="leftTab label" style="width: 17%;">
					<label for="nome"><nested:write property="promptText"/></label>
				</div>
				
				<div class="label" style="width: 80%;">					
					<c:set var="inputname" value="${parametro.name}"></c:set>
					<c:set var="inputvalue" value="${requestScope[inputname]}"></c:set>				
					
					<%-- CAIXAS DE TEXTO --%>
					<nested:equal property="controlType" value="0">
						<%-- NORMAIS --%>
						<input type="text" id='<nested:write property="name"/>' class="inputtext" name='${inputname}'
							<nested:equal property="dataType" value="4">onkeypress="return false;" size="15" maxlength="10"</nested:equal>
							<c:if test="${empty inputvalue}">value='${parametro.defaultValue}'</c:if>
								value='${inputvalue}'													
						/>
								
						<%-- COM DATA --%>
						<nested:equal property="dataType" value="4">
							<script type="text/javascript">
								Calendar.setup({
									inputField     :    "${inputname}",
									ifFormat       :    formatDateToCalendar('${formatacaodata}'),
									showsTime      :    false
								});			
							</script>
						</nested:equal>
					</nested:equal>
										
					<%-- LIST BOX --%>
					<nested:equal property="controlType" value="1">
						<logic:present name="<%=parametro.getName()%>">
							
							<%-- if multi-value is enable --%>						
							<c:if test="${parametro.handle.paramType == 'multi-value'}">
								<select name="<nested:write property="name"/>"
									<%--Verifica o parametro em questão é susceptivel de recarregamento da página. só se
										não for o último do grupo
									 --%>
										<logic:present name="recarregaveis">
										<logic:iterate name="recarregaveis" id="lista" type="java.lang.String">
											<logic:equal name="lista" value="<%=parametro.getName()%>">onchange="reloadForm(this)"</logic:equal>
										</logic:iterate>
									</logic:present>
									multiple="multiple">
																			
									<logic:iterate name="<%=parametro.getName()%>" id="option" type="java.lang.String">
										<bean:write name="option" filter="false"/>
									</logic:iterate>
								</select>
							</c:if>
									
							<%-- if simple selection is enable --%>
							<c:if test="${parametro.handle.paramType == 'simple'}">
								<select name="<nested:write property="name"/>"
									<%--Verifica o parametro em questão é susceptivel de recarregamento da página. só se
										não for o último do grupo
									 --%>
									<logic:present name="recarregaveis">
										<logic:iterate name="recarregaveis" id="lista" type="java.lang.String">
											<logic:equal name="lista" value="<%=parametro.getName()%>">onchange="reloadForm(this)"</logic:equal>
										</logic:iterate>
									</logic:present>>
																			
									<option value="defeito">${selectDefault}</option>
									<logic:iterate name="<%=parametro.getName()%>" id="option" type="java.lang.String">
										<bean:write name="option" filter="false"/>
									</logic:iterate>
								</select>
							</c:if>
							
						</logic:present>
					</nested:equal>
			
					<%-- RADIO BUTTONS --%>
						
					<%-- CHECK BOXES --%>
					<nested:equal property="controlType" value="3">
						<input type="checkbox" name="" value="" style="border:0;" />
					</nested:equal>
				</div>
			</div>
		</nested:root>
	</logic:iterate>			
</logic:present>