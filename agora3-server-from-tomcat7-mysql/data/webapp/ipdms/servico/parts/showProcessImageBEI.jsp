<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>


<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />

<link href='${THEMES_DIR}/jbpm/workflowimage.css' type=text/css rel=stylesheet />
 

<logic:present name="nodes">
        		
	<%-- Carrega a imagem do processo --%>               
    <img alt="Workflow Process Diagram" src="loadworkflowprocessimage.do2?numero=${numero}" style="position: absolute; top: 0; left: 0" />
       
    <logic:iterate id="node" name="nodes">
   			 
		<%--set the positional and size values from token position --%>
		<c:set var="pool_x_coord" value="${poolX + 31}"/>
		<c:set var="pool_y_coord" value="${poolY + 4}" />	
		<c:set var="x" value="${node.x + pool_x_coord}" />
		<c:set var="y" value="${node.y + pool_y_coord}" />
		<c:set var="width" value="${node.width}" />
		<c:set var="height" value="${node.height}"/>
		<%--set the positional and size values from token position --%>
		
					               
		<%-- Aplica as css para realçar o caminho percorrido pela tramitação do processo--%>               
		<%-- The task area --%>
		<c:set var="style" value="top:${y + 2}px;left:${x + 1}px;width:${width - 6}px;height:${height - 6}px;"/>
		<c:set var="styleClass" value="pbox"/>
		<c:if test="${node.end}"><c:set var="styleClass" value="pbox_e"/></c:if>
		<c:if test="${node.suspended}"><c:set var="styleClass" value="pbox_s"/></c:if>
		<c:if test="${node.entries == 0}"><c:set var="styleClass" value="pbox_ns"/></c:if>
		<div style="position: absolute; ${style}" class="${styleClass}"></div>
			                            
		<%-- The state area 
			 Where the state will appear
			 Running, Suspended, Ended
			 --%>		
		<c:set var="style" value="top:${y - 14}px;left:${x}px;width:${width - 3}px;"/>
		<c:set var="styleClass" value="pboxc"/>
		<c:if test="${node.end}"><c:set var="styleClass" value="pboxc_e"/></c:if>
		<c:if test="${node.suspended}"><c:set var="styleClass" value="pboxc_s"/></c:if>
		<div style="${style}" class="pboxce">
			<div class="${styleClass}">
				<c:if test="${!node.end && !token.suspended}"><c:set var="status" value="Running"/></c:if>
				<c:if test="${!node.end && token.suspended}"><c:set var="status" value="Suspended"/></c:if>
				<c:if test="${node.end}"><c:set var="status" value="Ended"/></c:if>				
				<c:if test="${node.entries == 1}">
					<a class="pboxc_e" href="">${status}</a>
				</c:if>
				<c:if test="${node.entries > 1}">
					<a class="pboxc_e" href="">${status} (${node.entries})</a>
				</c:if>							           
			</div>
		</div>
		             
	</logic:iterate>
      		   
</logic:present>

