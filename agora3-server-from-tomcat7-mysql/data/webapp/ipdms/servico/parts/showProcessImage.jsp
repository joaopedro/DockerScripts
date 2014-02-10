<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<link href='${THEMES_DIR}/jbpm/processimage.css' type=text/css rel=stylesheet />

<c:set var="endNode" value="true" />
<logic:present name="node">
              
	<%-- Carrega a imagem do processo --%>               
    <img alt="Workflow Process Diagram" src="loadworkflowprocessimage.do2?numero=${numero}" style="position: absolute; top: 0; left: 0" />
       
    <%--set the positional and size values from token position --%>
	<c:set var="x" value="${node.x}" />                   
	<c:set var="y" value="${node.y}"/>
	<c:set var="width" value="${node.width}"/>
	<c:set var="height" value="${node.height}"/>
		       
	<c:set var="style_ttl" value="top:${y - 12}px;left:${x + 2}px;width:${width - 3}px;height:${height + 11}px;"/>	
	<c:set var="style_tks" value="top:${y}px;left:${x}px;width:${width - 3}px;height:${height - 3}px;"/>	
	<c:set var="style_all" value="top:${y - 14}px;left:${x}px;width:${width - 1}px;"/>	
           
    <logic:present name="tokens">    	          
	    <logic:iterate id="token" name="tokens" >
	       
	       <c:if test="${node.name == token.name}">
	       		<c:set var="endNode" value="false" /> 
	       			       
	       		<%-- Aplica as css para realçar a etapa(s) activa(s)--%>
		    	<c:if test="${!token.end}">
		       					    	   
		            <%-- Total task and state area --%>                                        
					<c:set var="styleClass" value="pboxs"/>
		            <c:if test="${token.suspended}"><c:set var="styleClass" value="pboxs_s"/></c:if>
		            <div style="${style_ttl}" class="${styleClass}"></div>
		                            
		            <%-- The task area --%>
		            <c:set var="styleClass" value="pbox"/>
		            <c:if test="${token.suspended}"><c:set var="styleClass" value="pbox_s"/></c:if>
		            <div style="position: absolute; ${style_tks}" class="${styleClass}"></div>
		                            
		            <%-- The state area 
		            	 Where the state will appear
		                 Running, Suspended, Ended
		            	 --%>
					<c:set var="styleClass" value="pboxc"/>
		            <c:if test="${token.suspended}"><c:set var="styleClass" value="pboxc_s"/></c:if>
		            <div style="${style_all}" class="pboxce">
			        	<div class="${styleClass}">
				        	<c:if test="${token.end == null && !token.suspended}"><c:set var="status" value="Running"/></c:if>
				            <c:if test="${token.end == null && token.suspended}"><c:set var="status" value="Suspended"/></c:if>					        
				            <c:if test="${token.name != null}"><c:set var="status" value="${token.name}"/></c:if>
				            ${status}			           
						</div>
					</div>
		            	
		       	</c:if>
		       	               
			</c:if>
	       	                      
		</logic:iterate>          
	</logic:present>

	<%-- process closed --%>
	<c:if test="${endNode}">
		       	
		<%-- Total task and state area --%>
		<c:set var="styleClass" value="pboxs_e"/>
		<div style="${style_ttl}" class="${styleClass}"></div>
		                            
		<%-- The task area --%>
		<c:set var="styleClass" value="pbox_e"/>
		<div style="position: absolute; ${style_tks}" class="${styleClass}"></div>
		                            
		<%-- The state area --%>
		<c:set var="styleClass" value="pboxc_e"/>
		<div style="${style_all}" class="pboxce">
			<div class="${styleClass}">Ended</div>
		</div>		       	
		       	
	</c:if>
				   
</logic:present>

