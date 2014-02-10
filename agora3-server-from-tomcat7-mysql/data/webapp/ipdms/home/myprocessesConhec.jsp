<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.myprocesses.darconhecimento.listaprocessos" var="docTitle"/>

<script type="text/javascript">	
	document.title = "${productName} - ${docTitle}";
</script>

<div class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.myprocesses.darconhecimento.listaprocessos" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<div class="mensagenErro1"><html:errors /></div>

<html:form action="darconhecim.do2" method="get" styleId="darConheciForm">

	<c:if test="${not empty paginatedList.list}">
		<span class="formlabel_select" >
			<fmt:message key="ipdms.seleccionar" /> <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="<fmt:message key='ipdms.todos' />"><fmt:message key="ipdms.todos" /></a>,
						   <a href="#"  onclick="Checkboxes(false);" class="formlabel_select" title="<fmt:message key='ipdms.nenhum' />"><fmt:message key="ipdms.nenhum" /></a>
		</span><br/><br/>
	</c:if>
	
	<input type="hidden" name="urlAnterior" value="homepage.do2"/>
	
	<fmt:message key="ipdms.myprocesses.darconhecimento.numprocesso" var="numprocesso"/>
	<fmt:message key='ipdms.myprocesses.darconhecimento.variante' var="variante"/>
	<fmt:message key='ipdms.myprocesses.darconhecimento.etapa' var="etapa"/>
	<fmt:message key='ipdms.myprocesses.darconhecimento.dataEntrada' var="dataEntrada"/>
	<fmt:message key='ipdms.myprocesses.darconhecimento.conhecdadopor' var="conhecdadopor"/>
	<fmt:message key='ipdms.myprocesses.darconhecimento.dataenvioparaconhec' var="dataenvioparaconhec"/>
	<fmt:message key='ipdms.myprocesses.darconhecimento.assunto' var="assunto"/>
	<fmt:message key='ipdms.myprocesses.darconhecimento.entidade' var="entidade"/>
	<fmt:message key='ipdms.myprocesses.darconhecimento.consultar' var="consultar"/>
	<fmt:message key='ipdms.myprocesses.darconhecimento.tomeiConhecimento' var="tomeiConhecimento"/>
		
	<ajax:displayTag id="myProcessosConhecDisplayTag" baseUrl="${pageContext.request.contextPath}/myprocessesConhecim.do2">
	
		<display:table id="listaProcessos"  name="${paginatedList}" requestURI="" htmlId="worklist">
						
			<display:column title="${numprocesso}" sortable="true"
				sortName="idProcessoEntidade"
				property="servicoOnline.idProcessoEntidade"></display:column>
			<display:column title="${variante}" sortable="true" sortName="titulo"
				property="servicoOnline.variante.titulo"></display:column>
			<display:column title="${etapa}" sortable="true" sortName="titulo"
				property="etapa.titulo"></display:column>
			<display:column title="${dataEntrada}" sortable="true"
				sortName="dataPreenchimento">
				<fmt:formatDate
					value="${listaProcessos.servicoOnline.dataPreenchimento.time}"
					pattern="dd-MM-yyyy HH:mm:ss" />
			</display:column>
			<display:column title="${conhecdadopor}" sortable="true"
				sortName="" property="colaboradorEmitente.titulo">
			</display:column>
			<display:column title="${dataenvioparaconhec}"
				sortable="true" sortName="dataEnvio" style="width:20%;">
				<fmt:formatDate value="${listaProcessos.dataEnvio.time}"
					pattern="dd-MM-yyyy HH:mm:ss" />
			</display:column>			
			<display:column title="${assunto}">
				${listaProcessos.servicoOnline.assunto}
			</display:column>			
			<display:column title="${entidade}">
				<c:forEach var="soEntidade" items="${listaProcessos.servicoOnline.entidades}">
					${soEntidade.id.entidade.nome}			
				</c:forEach>
			</display:column>						
			<display:column title="${consultar}" sortable="false" style="text-align:center; width:4%">
				<a href="${pageContext.request.contextPath}/visualizaprocesso.do2?id=${listaProcessos.id}"> <img
					src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png"
					alt="<fmt:message key="ipdms.myprocesses.consultarprocesssonumero"/> ${listaProcessos.servicoOnline.idProcessoEntidade}" class="cursorMao" style="border: none;" 
					title="<fmt:message key="ipdms.myprocesses.consultarprocesssonumero"/> ${listaProcessos.servicoOnline.idProcessoEntidade}"/></a>
	
			</display:column>
			<display:column title="${tomeiConhecimento}" sortable="false" class="alignCenter"
				sortName="dataEnvio" style="width:8%">
				<html:multibox style="checks" property="id" styleId="checkconhec"
					value="${listaProcessos.id}"></html:multibox>
	
			</display:column>
			<display:footer>
				<td colspan="9" class="tableFooter">&nbsp;</td>
				<td class="tableFooter alignCenter"><img
					src="${pageContext.request.contextPath}/images/icon/icon-visto.png"
					onclick="$('darConheciForm').submit();" class="cursorMao" alt="<fmt:message key="ipdms.myprocesses.darconhecimento"/>"
					title="<fmt:message key="ipdms.myprocesses.darconhecimento"/>" /></td>
			</display:footer>

		</display:table>
		
	</ajax:displayTag>
	
	<br />
	<br />

</html:form>


