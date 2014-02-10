<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>


<div class="row formlabel_sf" style="padding:20px; padding-left: 25px;">
	
	<logic:present name="colaboradores">		
		<logic:iterate name="colaboradores" id="col">
			<div style="padding-top: 5px;">	
				${col.titulo}
			</div>								
		</logic:iterate>		
	</logic:present>
	
	<c:if test="${empty colaboradores}">
	
		<div>
			<bean:message key="ipdms.modules.formacao.tarefa.colssemprevilegiosnaetapa" locale="locale"/>	
		</div>
	
	</c:if>	
	
</div>