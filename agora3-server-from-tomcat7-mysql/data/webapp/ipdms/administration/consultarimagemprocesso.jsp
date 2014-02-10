<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
//
//loads an image, showing it in a window Ext
//function carregaImagem(title, action){
//    var titulo = 'Imagem workflow para o processo ' + title;
//    ExtWindowSizeParam(titulo,action,'','html',700,600);    
//}
//
</script>


<c:if test="${workflowprocess_exist}">
    <span class="texto">        
	    <a href="javascript:carregaImagem('${processo}','loadworkflowprocessdefinitionimage.do2?codigoWorkflow=${codigoWorkflow}')" >
            <fmt:message key="ipdms.processo.consultarimagemprocesso"/>
        </a>       
	</span> 
</c:if>
<c:if test="${!workflowprocess_exist}">
    <fmt:message key="ipdms.processo.imagemprocesso_naoencontrada"/>
</c:if>
