<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<LINK href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />
<LINK href='${THEMES_DIR}/estilos.css' type=text/css rel=stylesheet />

<script type="text/javascript">
          
   	function affectParent(value, description){
  		parent.document.getElementById('${param.valuePlaceHolder}').value = value;
  		parent.document.getElementById('${param.descPlaceHolder}').innerHTML = description;  		 		  		
  		closeWindow();  		
  	}
      
    function closeWindow(){
    	parent.${param.window}.close();
    }  	
            
</script>

<c:set var="parameters" value="window=${param.window}&valuePlaceHolder=${param.valuePlaceHolder}&descPlaceHolder=${param.descPlaceHolder}&exclude=${param.exclude}"/>
<html:form action="/popupDimensao.do2?${parameters}" method="POST" styleId="dimensaoPopupForm">
            
	<div class="row formlabel_sf">
    	<div class="leftTab label" style="width: 9em"><fmt:message key="ipdms.dimensoes.search.designacao" /></div>
		<div class="label">
        	<html:text maxlength="260" property="designacao" styleId="designacao" style="width: 33em;" />
        </div>
        <div class="leftTab label">
        	<html:submit styleClass="btForm" title="Pesquisar"><fmt:message key="ipdms.forms.pesquisar" /></html:submit>			
		</div>
	</div>

    <div class="row">&nbsp;</div>
            
	<div class="row" style="width: 98%;">
    	<display:table id="dimensao" name="${elements}" htmlId="worklist" pagesize="10" excludedParams="ajax">                  
        	<display:column title="Designação">                  
            	<input type='hidden' id='VALUE_${dimensao.id.numeroConteudo}' value='${dimensao.id.numeroConteudo}'/>
                <input type='hidden' id='DESC_${dimensao.id.numeroConteudo}' value='${dimensao.designacao}'/>
                <c:set var="url" value="affectParent('${dimensao.id.numeroConteudo}','${dimensao.designacao}')" />
                <a href="#" class="label"  onclick="${url}">${dimensao.designacao}</a>
			</display:column>                  
		</display:table>
	</div>
   
    <div class="row">&nbsp;</div>
   
	<table align="center">
    	<tr>
        	<td>
            	<input type="button" class="btForm" value="Fechar" onclick="closeWindow();">
            	<input type="button" class="btForm" value="Limpar" onclick="affectParent('',''); closeWindow();">
			</td>
		</tr>
	</table>

</html:form>

