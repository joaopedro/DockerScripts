<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<fmt:message key="ipdms.processo.imagemWorkflow" var="imagemWorkflow"/>
<fmt:message key="ipdms.processo.operacoesadministrativas" var="operacoesadministrativas"/>
<fmt:message key="ipdms.listetapas.darConhecimentoEtapa" var="darConhecimentoEtapa"/>
<fmt:message key="ipdms.listetapas.parecerEtapa" var="parecerEtapa"/>

<script type="text/javascript">

//loads an image, showing it in a window Ext
carregaImagem = function(title, action){
	var titulo = '${imagemWorkflow} ' + title;
    ExtWindowSizeParam(titulo,action,'','html',850,600);    
};

getElementsByName_iefix = function(tag, name) {
	var elem = document.getElementsByTagName(tag);

    var arr = new Array();
    for(i = 0,iarr = 0; i < elem.length; i++) {
         att = elem[i].getAttribute("name");
         if(att == name) {
              arr[iarr] = elem[i];
              iarr++;
         }
    }
    return arr;
}

showOperacoesAdministrativas = function (action, processo, numero){
	var titulo = '${operacoesadministrativas} ' + processo;
	var url = action + '?numero=' + numero;
    ExtWindowSizeParam(titulo,url,'','html',800,500);    
};

function showInfo(titulo, action, id) {
	var action = "${pageContext.request.contextPath}/" + action;
	action += "?id=" + id;
		
	ExtWindowSizeParam(titulo, action, '', 'html', 700, 400);		
};

</script>

<c:if test="${suporte}">
	<p class="formlabel" style="padding: 5px;">
        <fmt:message key="ipdms.listetapas.titulo" />
        <br>
        <fmt:message key="ipdms.listetapas.subtitulo" />
    </p>
</c:if>

<c:if test="${not empty entries}">
     <c:set var="processo" value="${servicoOnline.variante.processo.titulo}" />
     <c:set var="numeroSO" value="${servicoOnline.numeroConteudo}" />        
     <div class="row formlabel_sf" >
         <div class="leftTab label" style="width: 97%; ">
            <a href="javascript:carregaImagem('${processo}','processimage.do2?method=prepare&numero=${numeroSO}')" class="texto">
              <fmt:message key="ipdms.processo.consultarimagemprocesso"/>
          	</a> 
         </div>
     </div>
	 <br />
	 <div class="row formlabel_sf" >
         <div class="leftTab label" style="width: 97%; ">
	 		<c:url var="link" value="/tarefa/servicoOnlineToPdf.do2">
				<c:param name="servicoOnlineId" value="${servicoOnline.numeroConteudo}" />
			</c:url>
			<a href="${link}" target="_blank" class="texto">
				<fmt:message key="ipdms.processo.resumoprocessopdf"/>
				<img src="${pageContext.request.contextPath}/images/icon/icon-PDF.png">
			</a>
		</div>
	</div>
	<br/><br/>
	<div class="row formlabel_sf" >
         <div class="leftTab label" style="width: 97%; ">
         	<c:set var="idProcessoEnt" value="${servicoOnline.idProcessoEntidade}" />
            <a href="javascript:showOperacoesAdministrativas('showOperacoesAdminProcesso.do2','${idProcessoEnt}','${numeroSO}')" class="texto">
              <fmt:message key="ipdms.processo.consultaroperacoesadminprocesso"/>
          	</a> 
         </div>
     </div>
	 <br/>

	<c:forEach var="grouppedEntries" items="${entries}">
        
	<c:set var="localsystem" value="${empty grouppedEntries.systemName}" />
	<div style="padding:5px;">
	<table id="worklist" name="worklistPadrao" cellpadding="0" cellspacing="0" class="worklistPadrao, centro">
		<caption>
			<fmt:message key="ipdms.listetapas.sysInfo"/>
					<c:choose>
						<c:when test="${localsystem}"><fmt:message key="ipdms.listetapas.sysInfo.local"/></c:when>
						<c:otherwise>${grouppedEntries.systemName}</c:otherwise>
					</c:choose>
		</caption>
		<tr>
			<th>&nbsp;</th>
			<th><fmt:message key="ipdms.etapa.designacaoplural"/></th>
			<th><fmt:message key="ipdms.listetapas.tipoaccao"/></th> 
			<th><fmt:message key="ipdms.guichetadmin.menu.dataInicio"/></th>
			<th><fmt:message key="ipdms.guichetadmin.menu.dataFim"/></th>
			<th><fmt:message key="ipdms.listetapas.respondidopor"/></th>
			<th><fmt:message key="ipdms.colaborador.designacaosingular"/></th>
			<th><fmt:message key="ipdms.myprocesses.assignado"/></th>
			<th><fmt:message key="ipdms.listetapas.resposta"/></th>
			<th><fmt:message key="ipdms.listetapas.motivo"/></th>
			<c:if test="${localsystem}">
				<th></th>
				<th><fmt:message key="ipdms.documentos.list.hash"/></th>
			</c:if>
			<th></th>
			<th><%-- Consultar Etapa --%></th>
		</tr>
		<c:forEach var="soLogListable" items="${grouppedEntries.entries}">
		
		<c:choose>
			<c:when test="${soLogListable.logEntry}"> <%-- E' um soLog --%>
				<c:set var="entry" value="${soLogListable.log}" />
				
				<tr>
					<td style="border-right:1px solid white;" ></td>
					<td>${entry.etapa.titulo}</td>
					<td>${entry.tipomovimento.descricao}</td>
					<td>
						<fmt:formatDate value="${entry.begindate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>
					</td>
					<td>
						<fmt:formatDate value="${entry.enddate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>
					</td>
					<td title="${soLogListable.responderUser.titulo}">${entry.responder}</td>
					<td title="${entry.colaborador.titulo}">${entry.colaborador.login}</td>
					<td id="assignedUser">					
						<c:if test="${not empty entry.assigneduser}">
							<c:if test="${not empty entry.nid}">
							<img src="images/icon/icon-mais.png"
								 style="vertical-align:top"
								 class="cursorMao"
								 title="<fmt:message key='ipdms.listetapas.assigneduser'/>"
								 alt="<fmt:message key='ipdms.listetapas.assigneduser'/>"
								 action="workflowusers.do2?role=${entry.assigneduser}&nid=${entry.nid}"
								 onClick="showAssignedUser(this);"
								 id="${entry.nid}"
							 />${entry.assigneduser}	
							<span id="users_${entry.nid}" class="ipdms_reportData" style="border-left: none; vertical-align: top;"></span>
							</c:if>
						</c:if>						
					</td>
					<td>${entry.result}</td>
					<td>
						<c:choose> 
							<c:when test="${fn:length(entry.comentario)<100}">
								${entry.comentario}
							</c:when>
							<c:otherwise>
								${fn:substring(entry.comentario,0,99)}...
							</c:otherwise>
						</c:choose>
					</td>
					<c:if test="${localsystem}">
					<td id="ssltd">
						<c:if test="${entry.certificateInfo != null}">
							<a href="${pageContext.request.contextPath}/showCertificateInfo.do2?id=${entry.certificateInfo.id}" target="_blank">
							<img src="${pageContext.request.contextPath}/images/icon/icon-lock-small.png"
								alt="<fmt:message key='ipdms.listetapas.certificateInfo'/>"
								title="<fmt:message key='ipdms.listetapas.certificateInfo'/>" 
								style="border:none;" />
							</a>
						</c:if>
					</td>
					<td>
						<c:if test="${soLogListable.hashAvailable}">
							<c:choose>
								<c:when test="${soLogListable.hashOk}">
									<img src="${pageContext.request.contextPath}/images/icon/icon-OK.png"
										alt="<fmt:message key='ipdms.listetapas.hashOk'/>"
										title="<fmt:message key='ipdms.listetapas.hashOk'/>" 
										style="border:none;" />
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/images/icon/icon-atencao.png"
										alt="<fmt:message key='ipdms.listetapas.hashNotOk'/>"
										title="<fmt:message key='ipdms.listetapas.hashNotOk'/>" 
										style="border:none;" />
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
					</c:if>
					<td id="ssltd">
						<c:url var="link" value="/tarefa/notificationToPdf.do2">
							<c:param name="nid" value="${entry.nid}" />
						</c:url>
						<a href="${link}" target="_blank"><img src="${pageContext.request.contextPath}/images/icon/icon-PDF.png" title="PDF" alt="PDF"></a>
					</td>
					<td>
						<%-- Link para visualização de etapa --%>
						<c:if test="${entry.nid !=null or !localsystem}">
	  						<c:url var="linkEtapa" value="/notification.do2">
	  							<c:param name="processId" value="${entry.itemkey}" />
	  							<c:param name="processType" value="${entry.itemtype}" />
	  							<c:param name="etapaId" value="${entry.etapa.numeroConteudo}" />
	  							<c:param name="nid" value="${entry.nid}" />
	  							<c:param name="referer" value="${referer}" />
	  						</c:url>
							<a href="${linkEtapa}" title="<fmt:message key='ipdms.listetapas.consultarEtapa'/>">
								<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" class="cursorMao" alt="<fmt:message key='ipdms.listetapas.consultarEtapa'/>" title="<fmt:message key='ipdms.listetapas.consultarEtapa'/>" />
							</a>
						</c:if>
						<%-- Link para visualização do dar conhecimento e parecer --%>
						<c:if test="${entry.tipomovimento.id == 6}">
							<c:set var="titulo" value="${darConhecimentoEtapa} ${entry.etapa.titulo}"/>						
							<a href="javascript:showInfo('${titulo}','ajaxShowDarConhecimento.do2','${entry.id}')">
								<img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" class="cursorMao" alt="<fmt:message key='ipdms.listetapas.verDarConhecimento'/>" title="<fmt:message key='ipdms.listetapas.verDarConhecimento'/>" />
							</a>
						</c:if>
						<%-- Link para visualização do parecer --%>
						<c:if test="${entry.tipomovimento.id == 10}">
							<c:set var="titulo" value="${parecerEtapa} ${entry.etapa.titulo}" />						
							<a href="javascript:showInfo('${titulo}','ajaxShowParecer.do2','${entry.id}')">
								<img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" class="cursorMao" alt="<fmt:message key='ipdms.listetapas.verParecer'/>" title="<fmt:message key='ipdms.listetapas.verParecer'/>" />
							</a>
						</c:if>						
						
					</td>
				</tr>
			</c:when>
			<c:otherwise> <%-- E' um processo--%>
				<c:set var="entry" value="${soLogListable}" />
				<tr class="hoverTransparente" name="trPadraobegin_${entry.numeroConteudo}" id="trPadraobegin_${entry.numeroConteudo}">
					<td align="center">
							<img src="images/icon/icon-mais.png" id="imgPadrao_${entry.numeroConteudo}" name="imgPadrao_${entry.numeroConteudo}" 
								onclick="historicoEtapas(${entry.numeroConteudo}, 1, getElementsByName_iefix('table','worklistPadrao')[0]);" title="<fmt:message key='ipdms.listetapas.consultarHistory'/>" alt="<fmt:message key='ipdms.listetapas.consultarHistory'/>" class="cursorMao" />
					</td>
					<td colspan="13">
						<b>${entry.variante.titulo}</b> (<fmt:formatDate value="${entry.dataPreenchimento.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>)
					</td>
				</tr>
				<tr id="trendPadrao_${entry.numeroConteudo}" name="trendPadrao_${entry.numeroConteudo}"></tr>
			</c:otherwise>
		</c:choose>
		
		</c:forEach>
	</table>
	</div>
	</c:forEach>
</c:if>

<%--
<c:if test="${suporte}">
	<p class="formlabel">Etapas do Processo</p>
	<c:if test="${not empty entries}">
	
		<c:forEach var="grouppedEntries" items="${entries}">
			<c:set var="localsystem" value="${empty grouppedEntries.systemName}" />
			<span class="texto">Informação no sistema 	
			<c:choose>
				<c:when test="${localsystem}">local</c:when>
				<c:otherwise>${grouppedEntries.systemName}</c:otherwise>
			</c:choose>
			</span>
						
			<display:table id="entry" name="${grouppedEntries.entries}" htmlId="worklist">
				<display:column title="Etapa" >
					<span style="display: none">processId=${entry.itemkey},processType=${entry.itemtype},etapaId=${entry.etapa.numeroConteudo},nid=${entry.nid}</span>
					${entry.titulo}
				</display:column>
				<display:column title="Tipo de Acção">
					${entry.tipomovimento.descricao}
				</display:column>
		 		<display:column title="Início">
		 			<fmt:formatDate value="${historicoEntry.begindate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>	
		 		</display:column>
				<display:column title="Fim">
					<fmt:formatDate value="${historicoEntry.enddate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/>
				</display:column>
				<display:column title="Assignado a" >${entry.responder}</display:column>
				<display:column title="Resposta">${entry.result}</display:column>		
			</display:table>
		
		</c:forEach>
	</c:if>
</c:if>
--%>
