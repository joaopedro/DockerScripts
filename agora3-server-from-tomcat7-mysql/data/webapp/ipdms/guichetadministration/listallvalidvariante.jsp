<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<LINK href='<kcms:path configEntry="THEMES" />/forms.css' type=text/css rel=stylesheet>
<LINK href='<kcms:path configEntry="THEMES" />/estilos.css' type=text/css rel=stylesheet>

<fmt:message key='ipdms.guichetadmin.menuitem.instrucao.variante' var="varianteTitle"/>
<fmt:message key='ipdms.processo.designacaosingular' var="processosTitle"/>
<fmt:message key='ipdms.guichetadmin.variantes.empty' var="variantesEmpty"/>

<script type="text/javascript">
	
	function affectParent(value, description){
		parent.document.getElementById('${param.valuePlaceOlder}').value=value;
		parent.document.getElementById('${param.otherValuePlaceOlder}').value=description;
		parent.${param.window }.close();
	}
</script>

<c:choose>
  <c:when test="${not empty variantesList}">
  <div style="margin:5px;">
	<display:table name="variantesList" id="variante" htmlId="worklist">
	  	
	  	  		<display:column title="${varianteTitle}">
  					<c:set 	var="onclickfunction"
		  					value="affectParent('${variante.numeroConteudo}','${variante.titulo}');" />
  					<a href="" onclick="${onclickfunction}"  class="label">
		  				${variante.titulo}
  					</a>
  				</display:column>
		  		<display:column title="${processosTitle}">
  					${variante.processo.titulo}
  				</display:column>
		</display:table>
		</div>
	</c:when>
	<c:otherwise>
		<div class="row formlabel_sf" >
			<div class="mensagenCaixa">
				<div style="float:left; width:3%;">
					<img src="images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="Mensagem de atenção" title="Mensagem de atenção"/>
				</div>
				<div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
					<div class="info">${variantesEmpty }</div>
				</div>
				<div style="clear:both"></div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
 <div class="buttonRow">
		<input type="button" class="btForm"
				title="<fmt:message key="ipdms.forms.fechar.title" />"
				value="<fmt:message key="ipdms.forms.fechar"/>" 
				onclick="parent.${param.window }.close();">
</div>


