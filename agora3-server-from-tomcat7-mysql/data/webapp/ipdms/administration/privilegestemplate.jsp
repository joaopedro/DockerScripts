<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script>

function Checkboxes(state) {
	
    $$('input[type="checkbox"][name^="privileges"]').each(function filter(item) {
                {
                item.checked=state
                }
    });

    $$('[id^="td-"]').each(function filter(item) {
        {
        if(state){
    		item.style.display='inline';}
        else{
        	item.style.display='none';}
        }   
    });  

   }
Ext.onReady(function(){
	//cololcar formato de data caso nao haja datas reais
	dateFormatCheckonLoad();
});

</script>

<FIELDSET style="margin-top:80px; margin-left:14px; width:92%">
<LEGEND>
	<fmt:message key="ipdms.colaborador.funcoes"/>
</LEGEND>

<span class="formlabel_select" >
	<fmt:message key="ipdms.seleccionar"/> <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="<fmt:message key='ipdms.todos'/>"><fmt:message key='ipdms.todos'/></a>,
				   <a href="#"  onclick="Checkboxes(false);" class="formlabel_select" title="<fmt:message key='ipdms.nenhum'/>"><fmt:message key='ipdms.nenhum'/></a>
</span><br/><br/>


	<logic:iterate name="${formBeanName}" property="privileges" id="privileges" indexId="depCtr">
	<nested:root name="privileges">	
	<div class="row formlabel_sf" >
           <div class="leftTab label" style="width: 13%; " title="">
				<span class="textoBold"><nested:write property="nomeAreaFuncional"/></span>
           </div>
           
           <div class="label" style="width: 4%;" title="">
              	<c:choose>
					<c:when test="${date != null}">
						<nested:checkbox property="checked" styleClass="radion" value="true" indexed="true" style="border:0;"
						onclick="$('td-${privileges.organicaFuncao.id }').toggle();" styleId="funcao${depCtr}"/>				
					</c:when>
					<c:otherwise>
						<nested:checkbox property="checked" styleClass="radion" value="true" indexed="true" style="border:0;" styleId="funcao${depCtr}" />
					</c:otherwise>
				</c:choose>
           </div>
           
           <div class="label" style="width: 20%;; padding-top:2px;" title="">
           		<label for="funcao${depCtr}"><nested:write property="nomeCategoria" /></label>
           </div>
	
	
	

		<c:if test="${date != null}">
			<c:set var="display">
				<c:choose>
					<c:when test="${privileges.checked == true}">inline</c:when>
					<c:otherwise>none</c:otherwise>
				</c:choose>
			</c:set>
			<c:set var="dateFormat"><fmt:message key='date.format'/></c:set>
			
			<div class="label" id="td-${privileges.organicaFuncao.id }" style="display: ${display };">
				<fmt:message key="ipdms.colaborador.previlage.de"/>
				<input type="text" id="privileges[${depCtr}].inicio" 
					name="privileges[${depCtr}].inicio" size="10" maxlength="10"  
					class="date" value="<fmt:formatDate value='${privileges.inicio.time}' pattern='${dateFormat}'/>">
				<img style="vertical-align: bottom" id="button[${depCtr}].inicio" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="" class="cursorMao" alt="<fmt:message key='ipdms.colaborador.dataInicio'/>" title="<fmt:message key='ipdms.colaborador.dataInicio'/>" />
                <script type='text/javascript'>
                	Calendar.setup({ inputField : 'privileges[${depCtr}].inicio', ifFormat : '%d-%m-%Y', showsTime : false });
                	Calendar.setup({ inputField : 'privileges[${depCtr}].inicio', ifFormat : '%d-%m-%Y', button : "button[${depCtr}].inicio" });
				</script>
				<fmt:message key="ipdms.colaborador.previlage.ate"/>
				<input type="text" id="privileges[${depCtr}].fim" 
					name="privileges[${depCtr}].fim" size="10" maxlength="10"  
					class="date" value="<fmt:formatDate value='${privileges.fim.time}' pattern='${dateFormat}'/>">
				<img style="vertical-align: bottom" id="button[${depCtr}].fim" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="" class="cursorMao" alt="<fmt:message key='ipdms.colaborador.dataFim'/>" title="<fmt:message key='ipdms.colaborador.dataFim'/>" />                
               <script type='text/javascript'>
                	Calendar.setup({ inputField : 'privileges[${depCtr}].fim', ifFormat : '%d-%m-%Y', showsTime : false });
                	Calendar.setup({ inputField : 'privileges[${depCtr}].fim', ifFormat : '%d-%m-%Y', button : "button[${depCtr}].fim" });
                </script>
                
			</div>
		</c:if>
     </div>	
	</nested:root>	
	</logic:iterate>
</FIELDSET>
<br />
