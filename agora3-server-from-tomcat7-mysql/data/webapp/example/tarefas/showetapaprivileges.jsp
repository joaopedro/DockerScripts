<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<div class="row formlabel_sf" style="padding:20px; padding-left: 25px;">
	
	<logic:present name="privileges">		
		<logic:iterate name="privileges" id="privilege">
			<div style="padding-top: 5px;">	
				${privilege.organica.designacao} - ${privilege.funcao.descricao}
			</div>								
		</logic:iterate>		
	</logic:present>
	
	<c:if test="${empty privileges}">
	
		<div>
			<bean:message key="ipdms.modules.formacao.tarefa.etapasemprevilegios" locale="locale"/>
		</div>
	
	</c:if>	
	
</div>